local function B2TP_AppendToEnum(enumTable, name)

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

B2TP_AppendToEnum(kTechId, "AdvancedSwipe")