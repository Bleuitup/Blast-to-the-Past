local function B2TP_GetTechToAdd()
    return {
        {
            [kTechDataId] = kTechId.AdvancedSwipe,
            [kTechDataCategory] = kTechId.Fade,
            [kTechDataCostKey] = kAdvancedSwipeCost,
            [kTechDataResearchTimeKey] = kAdvancedSwipeResearchTime,
            [kTechDataDisplayName] = "Advanced Swipe",
            [kTechDataTooltipInfo] = "Increase Swipe damage by 8%",
        }
    }
end

local function B2TP_TechDataChanges(techData)

    local techToAdd = B2TP_GetTechToAdd()

    for _, record in ipairs(techToAdd) do
        table.insert(techData, record)
    end

end

local oldBuildTechData = BuildTechData

function BuildTechData()

    local techData = oldBuildTechData()
    B2TP_TechDataChanges(techData)
    return techData

end