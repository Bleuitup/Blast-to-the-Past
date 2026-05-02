local function B2TP_SetEnumValue(enumTable, name, value)

    if rawget(enumTable, name) ~= nil then
        return
    end

    rawset(enumTable, name, value)
    rawset(enumTable, value, name)

end

B2TP_SetEnumValue(kDeathMessageIcon, "AdvancedSwipe", 53)