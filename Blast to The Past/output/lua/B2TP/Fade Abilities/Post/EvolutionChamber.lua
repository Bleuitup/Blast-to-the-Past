-- Add Advanced Swipe to the Fade upgrade menu, in the first empty slot (slot 4 in vanilla).
-- Only this one entry is touched: replacing the whole kUpgradeButtons table would silently undo
-- whatever vanilla puts in the other lifeform menus (e.g. Babbler Bomb on the Gorge menu).
local fadeButtons = EvolutionChamber.kUpgradeButtons[kTechId.FadeMenu]

if fadeButtons and not table.icontains(fadeButtons, kTechId.AdvancedSwipe) then
    for i = 1, #fadeButtons do
        if fadeButtons[i] == kTechId.None then
            fadeButtons[i] = kTechId.AdvancedSwipe
            break
        end
    end
end
