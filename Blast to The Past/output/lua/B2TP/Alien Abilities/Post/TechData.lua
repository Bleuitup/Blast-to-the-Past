local function B2TP_GetTechToAdd()
    return {
        {
            [kTechDataId] = kTechId.Neurotoxin,
            [kTechDataCategory] = kTechId.ShadeHive,
            [kTechDataDisplayName] = "Neurotoxin",
            [kTechDataSponitorCode] = "N",
            [kTechDataTooltipInfo] = "Each hit inflicts a poison toxin, hurting Marines over time",
            [kTechDataCostKey] = 0,
        }
    }
end

local function B2TP_GetTechToRemove()
    return {
        [kTechId.Focus] = true
    }
end

local function B2TP_TechDataChanges(techData)

    local techToRemove = B2TP_GetTechToRemove()
    local indexToRemove = {}

    for techIndex, record in ipairs(techData) do
        local techDataId = record[kTechDataId]

        if techToRemove[techDataId] then
            table.insert(indexToRemove, techIndex)
        end
    end

    -- Remove old tech entries.
    local offset = 0
    for _, idx in ipairs(indexToRemove) do
        table.remove(techData, idx - offset)
        offset = offset + 1
    end

    -- Add new tech entries.
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