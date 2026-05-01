local kTechIdToMaterialOffset = debug.getupvaluex(GetMaterialXYOffset, "kTechIdToMaterialOffset")

if kTechIdToMaterialOffset then
    kTechIdToMaterialOffset[kTechId.AdvancedSwipe] = 105
    kTechIdToMaterialOffset[kTechId.Stab] = 194
end