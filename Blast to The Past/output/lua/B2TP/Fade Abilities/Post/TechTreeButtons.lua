local kTechIdToMaterialOffset = debug.getupvaluex(GetMaterialXYOffset, "kTechIdToMaterialOffset")

if kTechIdToMaterialOffset then
    kTechIdToMaterialOffset[kTechId.AdvancedSwipe] = 194
end