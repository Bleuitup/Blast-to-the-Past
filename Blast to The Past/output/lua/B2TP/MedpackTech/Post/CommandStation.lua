-- Medpack Tech is researched at the Command Station. Medtech #1 requires an Armory, Medtech #2
-- requires an Advanced Armory and Medtech #1 (see MarineTeam.lua). The buttons go in slots 2 and 3,
-- next to Advanced Marine Support; both are empty on CBM's Command Station (3.5 and 3.6).
--
-- Wraps rather than replaces, so anything CBM puts on the Command Station is kept. CommandStation
-- has no subclasses, so wrapping it alone is enough.

local kMedTechButtonSlots =
{
    { kTechId.MedTech1, 2 },
    { kTechId.MedTech2, 3 },
}

local oldGetTechButtons = CommandStation.GetTechButtons

function CommandStation:GetTechButtons(techId)

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

end
