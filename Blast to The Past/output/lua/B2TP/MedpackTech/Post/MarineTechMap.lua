-- Medpack Tech on CBM's marine tech map. Coordinates are CBM's, which are the same with the Core
-- Toggle on or off:
--
--   Armory (5.75, 3) --blue--> Medtech #1 (4.75, 5.5) --blue--> Medtech #2 (4.75, 7)
--   Advanced Armory (5.75, 7) --purple--> Medtech #2          (#2 also requires an Advanced Armory)
--   Advanced Armory (5.75, 7) --purple--> Advanced Weaponry (5.75, 8.5)
--
-- Medtech #2 takes Advanced Weaponry's old spot, so Advanced Weaponry moves south of the Advanced
-- Armory and CBM's original Advanced Armory -> Advanced Weaponry line is removed. A 5th field on a
-- line draws it in CBM's purple "also requires" color.

local function FindEntry(techId)
    for _, entry in ipairs(kMarineTechMap) do
        if entry[1] == techId then
            return entry
        end
    end
end

local advancedArmory = FindEntry(kTechId.AdvancedArmory)
local advancedWeaponry = FindEntry(kTechId.AdvancedWeaponry)

if advancedArmory and advancedWeaponry then

    -- Remove CBM's line from the Advanced Armory to Advanced Weaponry's old position.
    for i = #kMarineLines, 1, -1 do
        local line = kMarineLines[i]
        if line[1] == advancedArmory[2] and line[2] == advancedArmory[3]
        and line[3] == advancedWeaponry[2] and line[4] == advancedWeaponry[3] then
            table.remove(kMarineLines, i)
        end
    end

    advancedWeaponry[2], advancedWeaponry[3] = 5.75, 8.5

end

table.insert(kMarineTechMap, { kTechId.MedTech1, 4.75, 5.5 })
table.insert(kMarineTechMap, { kTechId.MedTech2, 4.75, 7 })

local function PurpleLine(fromTechId, toTechId)
    local line = GetLinePositionForTechMap(kMarineTechMap, fromTechId, toTechId)
    line[5] = 0
    return line
end

table.insert(kMarineLines, GetLinePositionForTechMap(kMarineTechMap, kTechId.Armory, kTechId.MedTech1))
table.insert(kMarineLines, GetLinePositionForTechMap(kMarineTechMap, kTechId.MedTech1, kTechId.MedTech2))
table.insert(kMarineLines, PurpleLine(kTechId.AdvancedArmory, kTechId.MedTech2))
table.insert(kMarineLines, PurpleLine(kTechId.AdvancedArmory, kTechId.AdvancedWeaponry))
