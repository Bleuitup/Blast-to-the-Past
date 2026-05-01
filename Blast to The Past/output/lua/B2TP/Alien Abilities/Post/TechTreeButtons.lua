local kTechIdToMaterialOffset = debug.getupvaluex(GetMaterialXYOffset, "kTechIdToMaterialOffset")

if kTechIdToMaterialOffset and not kTechIdToMaterialOffset[kTechId.AdvancedSwipe] then

    kTechIdToMaterialOffset[kTechId.AdvancedSwipe] = 105
	
end