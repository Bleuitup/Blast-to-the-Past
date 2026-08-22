-- Appends new entries to kTechId.
--
-- This matches the appender already used by the Fade Abilities piece: append above the true
-- highest value in the table, keeping the array part contiguous, and leave kTechId.Max alone.
--
-- Contiguity matters because MedpackTech/Post/TechTreeConstants.lua uses debug.appendtoenum(),
-- which picks its next value with #tbl. A hole in the array part would break that.
--
-- kTechId.Max is deliberately NOT moved. Vanilla never reads it, and B2TP's other two appenders
-- already leave it stale -- moving it here would collide with AdvancedSwipe, which Fade Abilities
-- has already parked one slot above Max by the time this runs.
-- TODO: unify all three appenders into one shared utility and fix kTechId.Max properly.

function B2TP_AppendToEnum(enumTable, name)

    local existing = rawget(enumTable, name)
    if existing ~= nil then
        return existing
    end

    local maxValue = -1

    for k, v in pairs(enumTable) do
        if type(k) == "number" and k > maxValue then
            maxValue = k
        end
        if type(v) == "number" and v > maxValue then
            maxValue = v
        end
    end

    local newValue = maxValue + 1

    rawset(enumTable, name, newValue)
    rawset(enumTable, newValue, name)

    return newValue

end
