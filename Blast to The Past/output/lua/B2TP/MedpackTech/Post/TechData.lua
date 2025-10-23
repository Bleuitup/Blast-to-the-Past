local oldBuildTechData = BuildTechData

function BuildTechData()
    local techData = oldBuildTechData()
		
	local medtech1 = { 
        [kTechDataId] = kTechId.MedTech1,
        [kTechDataDisplayName] = "Medpack Upgrade #1", 
        [kTechDataTooltipInfo] = "Improves Medpacks to 30 instant heal and 20 regen", 
        [kTechDataCostKey] = kTechMed1ResearchCost,             
        [kTechDataResearchTimeKey] = kTechMed1ResearchTime
    }

	local medtech2 = { 
        [kTechDataId] = kTechId.MedTech2,       
        [kTechDataDisplayName] = "Medpack Upgrade #2", 
        [kTechDataTooltipInfo] = "Improves Medpacks to 40 instant heal and 10 regen", 
        [kTechDataCostKey] = kTechMed2ResearchCost,             
        [kTechDataResearchTimeKey] = kTechMed2ResearchTime
    }

	table.insert(techData, medtech1)
	table.insert(techData, medtech2)
    return techData
end