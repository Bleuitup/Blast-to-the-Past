local oldBuildTechData = BuildTechData

function BuildTechData()

    local techData = oldBuildTechData()

    local advancedSwipe = {
        [kTechDataId] = kTechId.AdvancedSwipe,
        [kTechDataDisplayName] = "Advanced Swipe",
        [kTechDataTooltipInfo] = "Increase Swipe damage by 8%",
        [kTechDataCostKey] = kAdvancedSwipeCost,
        [kTechDataResearchTimeKey] = kAdvancedSwipeResearchTime,
        [kTechDataCategory] = kTechId.Fade
    }

    table.insert(techData, advancedSwipe)

    return techData

end