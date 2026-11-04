-- Advanced Swipe on the alien tech map, in the Biomass 8 column, one slot below the lowest ability
-- already there. Earlier tech maps moved abilities between biomass columns, so the slot is found
-- rather than fixed. In vanilla build 345: Stomp (9.5, 8) -> Advanced Swipe (9.5, 9).

local function B2TP_HasTechMapEntry(techMap, techId)
    for i = 1, #techMap do
        if techMap[i][1] == techId then
            return true
        end
    end
    return false
end

local function B2TP_GetBelowBioMassColumn(techMap, bioMassTechId)
    local x, lowest
    for i = 1, #techMap do
        if techMap[i][1] == bioMassTechId then
            x, lowest = techMap[i][2], techMap[i][3]
        end
    end
    if not x then
        return nil
    end
    for i = 1, #techMap do
        local entry = techMap[i]
        if entry[2] == x and entry[3] > lowest then
            lowest = entry[3]
        end
    end
    return x, lowest + 1
end

if kAlienTechMap and not B2TP_HasTechMapEntry(kAlienTechMap, kTechId.AdvancedSwipe) then

    local x, y = B2TP_GetBelowBioMassColumn(kAlienTechMap, kTechId.BioMassEight)
    if x then
        table.insert(kAlienTechMap, { kTechId.AdvancedSwipe, x, y })
    end

end
