-- Main menu button that opens the B2TP changelog. Sits alongside the vanilla wiki/discord link
-- buttons in the corner of the main menu -- no server connection or map load needed to see it,
-- so this is the cheapest thing in the whole mod to test: launch the mod and look at the menu.
--
-- Icon is the mod's own 8v8 logo (ui/b2tp_changelog_icon.dds), letterboxed onto a transparent
-- 160x160 canvas. Same format as vanilla's own menu link buttons (uncompressed RGBA, 8 mipmaps),
-- converted from the source PNG with the nvcompress.exe that ships in the game's own utils
-- folder. Was briefly swapped for a plain white square while chasing an unrelated script-load
-- crash, to rule out the icon as a variable; restored now that the real bug is fixed.
--
-- Regular and hover use the same texture. GUIMenuPowerButton draws the hover graphic as a
-- second layer that fades in over the normal one, so an identical texture still reads as a
-- brightening on mouse-over; a distinct hover variant can be added later by pointing
-- kTextureHover at a second file.

Script.Load("lua/menu2/GUIMenuExitButton.lua")
Script.Load("lua/menu2/wrappers/Tooltip.lua")

Script.Load("lua/B2TP/Changelog/Shared/GUIB2TPChangelogWindow.lua")

local baseClass = GUIMenuExitButton
baseClass = GetTooltipWrappedClass(baseClass)
class "GUIB2TPChangelogButton" (baseClass)

GUIB2TPChangelogButton.kTextureRegular = PrecacheAsset("ui/b2tp_changelog_icon.dds")
GUIB2TPChangelogButton.kTextureHover   = PrecacheAsset("ui/b2tp_changelog_icon.dds")

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
