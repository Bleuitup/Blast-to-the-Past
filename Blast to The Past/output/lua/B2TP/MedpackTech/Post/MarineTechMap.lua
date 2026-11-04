-- Medpack Tech on vanilla's marine tech map. Both Medtechs are researched at the Command Station, so
-- they hang off it, in the top row beside Advanced Marine Support (the row for Command Station
-- research). Vanilla (build 345) puts the Command Station at (7, 1) and Advanced Marine Support at
-- (7, 0), with the two cells to its left free:
--
--   Medtech #2 (5, 0) <-- Medtech #1 (6, 0)     Advanced Marine Support (7, 0)
--                               |                        |
--                               +------------------------+  (fork halfway up)
--                                                        |
--                                               Command Station (7, 1)
--
-- The fork is drawn as an elbow off the midpoint of vanilla's own Command Station -> Advanced Marine
-- Support line. All three lines are the default research color. Nothing of vanilla's is moved: earlier
-- versions moved Advanced Weaponry, whose spot later tech maps changed.
--
-- The Armory and Advanced Armory requirements are not drawn: from the top row those lines would
-- cross the Command Station's own. (A line's 5th field is a Color, not a flag; the old flag is what
-- made the old purple requirement lines invisible.)

local function FindEntry(techId)
    for _, entry in ipairs(kMarineTechMap) do
        if entry[1] == techId then
            return entry
        end
    end
end

local commandStation = FindEntry(kTechId.CommandStation)
local marineSupport = FindEntry(kTechId.AdvancedMarineSupport)

if commandStation and marineSupport then

    local x, y = marineSupport[2], marineSupport[3]
    local forkY = (y + commandStation[3]) * 0.5

    table.insert(kMarineTechMap, { kTechId.MedTech1, x - 1, y })
    table.insert(kMarineTechMap, { kTechId.MedTech2, x - 2, y })

    table.insert(kMarineLines, { x, forkY, x - 1, forkY })
    table.insert(kMarineLines, { x - 1, forkY, x - 1, y })
    table.insert(kMarineLines, GetLinePositionForTechMap(kMarineTechMap, kTechId.MedTech1, kTechId.MedTech2))

end
