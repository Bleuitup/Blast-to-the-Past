-- Medpack Tech is researched at the Armory: Medtech #1 needs an Armory, Medtech #2 also needs an
-- Advanced Armory (see MarineTeam.lua). The buttons go in slots 6 and 7, which are empty on CBM's
-- Armory with the Core Toggle on or off (slot 5 is the Advanced Armory upgrade).
--
-- Class_ReplaceMethod, not a plain assignment: NS2 copies methods into derived classes, so replacing
-- Armory.GetTechButtons alone would leave AdvancedArmory with the old list.

local kMedTechButtonSlots =
{
    { kTechId.MedTech1, 6 },
    { kTechId.MedTech2, 7 },
}

local oldGetTechButtons
oldGetTechButtons = Class_ReplaceMethod("Armory", "GetTechButtons", function(self, techId)

    local techButtons = oldGetTechButtons(self, techId)

    if techButtons then
        for _, entry in ipairs(kMedTechButtonSlots) do
            local medTechId, slot = entry[1], entry[2]
            if techButtons[slot] == kTechId.None then
                techButtons[slot] = medTechId
            end
        end
    end

    return techButtons

end)
