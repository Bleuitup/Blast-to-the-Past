-- Medpack Tech is researched at the Armory: Medtech #1 needs an Armory, Medtech #2 also needs an
-- Advanced Armory (see MarineTeam.lua). The buttons go in slots 6 and 7, which are empty on CBM's
-- Armory with the Core Toggle on or off (slot 5 is the Advanced Armory upgrade).
--
-- AdvancedArmory is declared inside Armory.lua itself (class 'AdvancedArmory' (Armory)), so it
-- already exists when this post hook runs. Depending on how the engine resolves inherited methods it
-- may hold its own copy of GetTechButtons, so both classes are wrapped explicitly, each around the
-- method it had before this file touched anything. Filling a slot only when it is still empty makes
-- a double wrap harmless if AdvancedArmory actually looks the method up through Armory.
--
-- Not Class_ReplaceMethod: that lives in core/lua/Class.lua, which PostLoadMod.lua loads only after
-- all game files, so it does not exist yet when this hook runs.

local kMedTechButtonSlots =
{
    { kTechId.MedTech1, 6 },
    { kTechId.MedTech2, 7 },
}

local function AddMedTechButtons(techButtons)

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

local oldArmoryGetTechButtons = Armory.GetTechButtons
local oldAdvancedArmoryGetTechButtons = AdvancedArmory and AdvancedArmory.GetTechButtons

function Armory:GetTechButtons(techId)
    return AddMedTechButtons(oldArmoryGetTechButtons(self, techId))
end

if oldAdvancedArmoryGetTechButtons then
    function AdvancedArmory:GetTechButtons(techId)
        return AddMedTechButtons(oldAdvancedArmoryGetTechButtons(self, techId))
    end
end
