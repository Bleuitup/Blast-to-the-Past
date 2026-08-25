-- Main menu button that opens the B2TP changelog. Sits alongside the vanilla wiki/discord link
-- buttons in the corner of the main menu -- no server connection or map load needed to see it,
-- so this is the cheapest thing in the whole mod to test: launch the mod and look at the menu.
--
-- PLACEHOLDER ART: reuses vanilla's wiki button icon (ui/newMenu/wikiButton.dds /
-- wikiButtonOver.dds) rather than shipping new art. Swap kTextureRegular/kTextureHover for a
-- custom icon later; nothing else about this file needs to change to do that.

Script.Load("lua/menu2/GUIMenuExitButton.lua")
Script.Load("lua/menu2/wrappers/Tooltip.lua")

Script.Load("lua/B2TP/Changelog/Shared/GUIB2TPChangelogWindow.lua")

local baseClass = GUIMenuExitButton
baseClass = GetTooltipWrappedClass(baseClass)
class "GUIB2TPChangelogButton" (baseClass)

GUIB2TPChangelogButton.kTextureRegular = PrecacheAsset("ui/newMenu/wikiButton.dds")
GUIB2TPChangelogButton.kTextureHover   = PrecacheAsset("ui/newMenu/wikiButtonOver.dds")

GUIB2TPChangelogButton.kShadowScale = Vector(10, 5, 1)

function GUIB2TPChangelogButton:OnPressed()
    self.changelog:Open()
end

function GUIB2TPChangelogButton:Initialize(params, errorDepth)
    errorDepth = (errorDepth or 1) + 1
    baseClass.Initialize(self, params, errorDepth)

    self:SetTooltip("Blast to the Past Changelog")

    self.changelog = CreateGUIObject("b2tpChangelog", GUIB2TPChangelogWindow, nil)
    self:HookEvent(GetMainMenu(), "OnClosed", self.OnMainMenuClosed)

end

function GUIB2TPChangelogButton:OnMainMenuClosed()
    self.changelog:Close()
end
