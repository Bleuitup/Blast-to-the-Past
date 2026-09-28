-- Advanced Swipe on the alien tech map, in the Biomass 8 column, one slot below the lowest ability
-- already there. CBM 3.6 moved Stab to Biomass 8, under Stomp, which is where B2TP used to put
-- Advanced Swipe, so the slot is found rather than fixed:
--   CBM 3.6: Stomp (9.5, 8), Stab (9.5, 9)  -> Advanced Swipe (9.5, 10)
--   CBM 3.5: Stomp (9.5, 8)                 -> Advanced Swipe (9.5, 9)

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
