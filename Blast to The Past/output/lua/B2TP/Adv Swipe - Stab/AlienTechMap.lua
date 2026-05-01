local function B2TP_HasTechMapEntry(techMap, techId)
    for i = 1, #techMap do
        if techMap[i][1] == techId then
            return true
        end
    end
    return false
end

if kAlienTechMap and not B2TP_HasTechMapEntry(kAlienTechMap, kTechId.AdvancedSwipe) then

    -- Place Advanced Swipe as a Biomass 8 option on the Fade row.
    table.insert(kAlienTechMap, { kTechId.AdvancedSwipe, 9.5, 9 })

end