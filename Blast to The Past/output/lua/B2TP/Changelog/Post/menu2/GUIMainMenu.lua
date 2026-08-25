-- Adds the B2TP changelog button to the main menu.
--
-- Hooks GUIMainMenu:CreateLinksButtons rather than :Initialize. Vanilla's own comment on that
-- method is "Method so that mods can easily add their own buttons. :)" -- it already exists
-- specifically for this, is called once self.linkButtonsHolder is guaranteed to exist, and is a
-- much smaller surface to keep working across NS2 patches than the whole Initialize function.

Script.Load("lua/B2TP/Changelog/Shared/GUIB2TPChangelogButton.lua")

local oldCreateLinksButtons = GUIMainMenu.CreateLinksButtons

function GUIMainMenu:CreateLinksButtons()

    oldCreateLinksButtons(self)

    CreateGUIObject("b2tpChangelogButton", GUIB2TPChangelogButton, self.linkButtonsHolder)

end
