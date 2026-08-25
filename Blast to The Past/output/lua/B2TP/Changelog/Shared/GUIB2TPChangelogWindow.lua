-- The B2TP in-game changelog popup.
--
-- Built on vanilla's menu2 GUI framework: GUIMenuTabbedBox for the frame, GUIMenuScrollPane for
-- scrolling, GUIParagraph for the text. Nothing here depends on any other mod.
--
-- A plain, always-available reference window: no "seen this version" tracking, no attention
-- animation on the button. Open it whenever you want to check what the mod changes.

Script.Load("lua/GUI/GUIObject.lua")
Script.Load("lua/menu2/GUIMenuTabbedBox.lua")
Script.Load("lua/menu2/widgets/GUIMenuTabButtonWidget.lua")
Script.Load("lua/menu2/widgets/GUIMenuScrollPane.lua")
Script.Load("lua/GUI/GUIText.lua")
Script.Load("lua/GUI/GUIParagraph.lua")
Script.Load("lua/menu2/MenuStyles.lua")

Script.Load("lua/B2TP/Changelog/Shared/ChangelogData.lua")

-- Each change-list line is prefixed with this many '#' to mark its heading level. 0 = body text.
-- Splits a leading run of '#' characters off a changelog line and returns the heading level
-- (0 for a plain line) plus the remaining text. Deliberately only LEADING '#'s count, matching
-- ordinary Markdown heading syntax -- CBM's original implementation instead used
-- string.gsub(rawLine, "#", "") to count every '#' anywhere in the line, which misreads any line
-- that happens to mention something like "Medtech #1" as a level-1 heading (the biggest style),
-- since that line contains exactly one '#'. This version does not have that failure mode.
local function SplitHeadingLevel(rawLine)
    local hashes = string.match(rawLine, "^#*")
    local level = string.len(hashes)
    local rest = string.sub(rawLine, level + 1)
    return rest, level
end

local kInnerBackgroundSideSpacing = 32
local kInnerBackgroundTopSpacing = 212
local kInnerBackgroundBottomSpacing = 18
local kUnderlapYSize = 113

local kTabHeight = 94
local kTabMinWidth = 150
local kTabButtonFont = {family = "MicrogrammaBold", size = 48}

local kTitleFont = {family = "AgencyBold", size = 60}

local baseClass = GUIMenuTabbedBox
class "GUIB2TPChangelogWindow" (baseClass)

GUIB2TPChangelogWindow:AddClassProperty("IsOpen", false)

-- The whole menu is authored against a 3840x2160 canvas and scaled down to the real screen
-- resolution. Every top-level menu widget applies this scale to itself -- GUIMainMenu's own
-- corner/link buttons do it in their layoutButtons closure, and GUIMenuNavBar does the identical
-- calculation in its UpdateResolutionScaling. It is NOT inherited automatically from a parent;
-- each object is responsible for calling SetScale on itself.
--
-- This window is created with parent = nil (see GUIB2TPChangelogButton.lua), so it never picks up
-- this scale from an ancestor and must compute and apply it directly, or SetSize(2300, 1600) below
-- renders as 2300x1600 real screen pixels -- far larger than the window on anything under 4K.
local kMockupRes = Vector(3840, 2160, 0)

-- Pushes the window down clear of the top nav bar, without pushing it so far down that the
-- bottom runs into the nav bar's own newsFeed pullout tab strip anchored at the screen bottom
-- (GUIMenuNavBar.kNewsFeedSize).
--
-- 900, copied from CBM's SetY(900), overshot badly: cleared the top fine but pushed the bottom
-- behind that tab strip. GUIMenuNavBar.topEdge (271) was considered instead, but it's measured
-- in the nav bar's own coordinate space -- almost certainly top-anchored, Y=0 at the screen's
-- top edge -- while this window is center-anchored via AlignCenter(), Y=0 at screen centre.
-- Those are not the same space, so 271 here is not necessarily equivalent and risks undershooting
-- back into the original bug (title hidden entirely).
--
-- 450 is a deliberate middle value between the two known data points (0 undershoots, 900
-- overshoots), not a derived one -- there is no way to render this GUI framework outside the
-- actual game to compute the correct number directly. Paired with a shorter SetSize below so a
-- misjudged offset in either direction has more margin to still clear both edges.
local kYOffset = 450

local function UpdateResolutionScaling(self, newX, newY)
    local res = Vector(newX, newY, 0)
    local scale = res / kMockupRes
    scale = math.min(scale.x, scale.y)
    self:SetScale(scale, scale)
    self:SetY(kYOffset * scale)
end

function GUIB2TPChangelogWindow:Initialize(params, errorDepth)
    errorDepth = (errorDepth or 1) + 1

    baseClass.Initialize(self, params, errorDepth)

    self.contentObs = {}

    self:AlignCenter()
    self:SetLayer(999)

    UpdateResolutionScaling(self, Client.GetScreenWidth(), Client.GetScreenHeight())
    self:HookEvent(GetGlobalEventDispatcher(), "OnResolutionChanged", UpdateResolutionScaling)

    self.title = CreateGUIObject("title", GUIText, self)
    self.title:SetFont(kTitleFont)
    self.title:SetColor(Color(1, 1, 1, 1))
    self.title:SetText("B2TP CHANGELOG")
    self.title:AlignTop()
    self.title:SetY(-23)

    self:InitializeContentHolders()

    self.tabButton = CreateGUIObject("tabButton", GUIMenuTabButtonWidget, self)
    self.tabButton:SetTabHeight(kTabHeight)
    self.tabButton:SetTabMinWidth(kTabMinWidth)
    self.tabButton:AlignBottom()
    self.tabButton:SetFont(kTabButtonFont)
    self.tabButton:SetLabel("CLOSE")
    self:HookEvent(self.tabButton, "OnPressed", self.Close)
    self:HookEvent(self.tabButton, "OnTabSizeChanged", self.SetTabSize)
    self:SetTabSize(self.tabButton:GetTabSize())

    -- Height cut from CBM's original 1600 to 1150 so the box has real margin at both the top
    -- (nav bar) and bottom (newsFeed tab strip) instead of nearly spanning the full screen
    -- height, which left almost no slack for kYOffset to be even slightly wrong.
    self:SetSize(2300, 1150)
    self:Close()

    self:LoadChangelog(GetB2TPChangelogText())

end

function GUIB2TPChangelogWindow:InitializeContentHolders()

    self.innerBack = CreateGUIObject("innerBack", GUIMenuBasicBox, self)
    self.innerBack:SetPosition(kInnerBackgroundSideSpacing, kInnerBackgroundTopSpacing - kUnderlapYSize)
    self:HookEvent(self, "OnSizeChanged", self.UpdateInnerBackgroundSize)

    self.scrollPane = CreateGUIObject("scrollPane", GUIMenuScrollPane, self.innerBack)

    self.listLayout = CreateGUIObject("listLayout", GUIListLayout, self.scrollPane,
    {
        orientation = "vertical",
        spacing = 0,
    })

    self.scrollPane:HookEvent(self.listLayout, "OnSizeChanged", self.scrollPane.SetPaneSize)

end

-- Falls back to level 0 (body text) for anything outside the levels ChangelogData.lua actually
-- uses, so a typo with an extra '#' degrades gracefully instead of erroring on a nil font.
local kStyleToFontsMap =
{
    [1] = {family = "AgencyBold", size = 68},
    [2] = {family = "AgencyBold", size = 56},
    [3] = {family = "Agency", size = 50},
    [0] = {family = "Arial", size = 28},
}

local kStyleToColorMap =
{
    [1] = MenuStyle.kHighlight,
    [2] = MenuStyle.kOptionHeadingColor,
    [3] = MenuStyle.kOptionHeadingColor,
    [0] = Color(1, 1, 1, 1),
}

local function GetStyleFont(style)
    return kStyleToFontsMap[style] or kStyleToFontsMap[0]
end

local function GetStyleColor(style)
    return kStyleToColorMap[style] or kStyleToColorMap[0]
end

local function AddLineGroup(self, lineGroup, style, lineNumber)

    local lineGroupObj = CreateGUIObject(string.format("lineGroup_%d", lineNumber), GUIParagraph, self.listLayout,
    {
        justification = GUIItem.Align_Min,
        font = GetStyleFont(style),
        color = GetStyleColor(style),
        paragraphSize = Vector(self.scrollPane:GetSize().x, -1, 0),
        text = lineGroup
    })
    table.insert(self.contentObs, lineGroupObj)

end

function GUIB2TPChangelogWindow:LoadChangelog(changelogText)

    for i = 1, #self.contentObs do
        self.contentObs[i]:Destroy()
    end

    self.contentObs = {}

    local changelogLines = string.Explode(changelogText, "\n")

    -- Keep track of consecutive lines with the same style so we don't create one GUI object per
    -- line -- long changelogs would otherwise create hundreds of paragraph objects.
    local lineGroup = ""
    local lineGroupStyle = 0

    for i = 1, #changelogLines do

        local rawLine = changelogLines[i]
        local rest, numTokens = SplitHeadingLevel(rawLine)
        local processedLine = string.format("  %s", rest)

        if i == 1 then

            lineGroup = processedLine
            lineGroupStyle = numTokens

        else

            local groupLenIfAdded = string.len(lineGroup) + string.len(processedLine)
            if numTokens ~= lineGroupStyle or i == #changelogLines or groupLenIfAdded > 500 then

                AddLineGroup(self, lineGroup, lineGroupStyle, i)

                lineGroup = processedLine
                lineGroupStyle = numTokens

            else
                lineGroup = string.format("%s\n%s", lineGroup, processedLine)
            end

        end

    end

    AddLineGroup(self, lineGroup, lineGroupStyle, #changelogLines)

end

function GUIB2TPChangelogWindow:UpdateInnerBackgroundSize()
    self.innerBack:SetSize(self:GetSize() - Vector(kInnerBackgroundSideSpacing * 2, kInnerBackgroundBottomSpacing + kInnerBackgroundTopSpacing, 0))
    self.scrollPane:SetSize(self.innerBack:GetSize().x, self.innerBack:GetSize().y)
end

function GUIB2TPChangelogWindow:OnKey(key, down)
    if key == InputKey.Escape then
        self:Close()
    end
end

function GUIB2TPChangelogWindow:Close()
    self:StopListeningForKeyInteractions()
    self:SetVisible(false)
    self:ClearModal()
    self:SetIsOpen(false)
    self:FireEvent("Closed")
end

function GUIB2TPChangelogWindow:Open()
    self:ListenForKeyInteractions()
    self:SetVisible(true)
    self:SetModal()
    self:SetIsOpen(true)
    self:FireEvent("Opened")
end
