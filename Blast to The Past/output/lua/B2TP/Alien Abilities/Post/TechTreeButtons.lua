local kTechIdToMaterialOffset = debug.getupvaluex(GetMaterialXYOffset, "kTechIdToMaterialOffset")

if kTechIdToMaterialOffset and not kTechIdToMaterialOffset[kTechId.Neurotoxin] then
    kTechIdToMaterialOffset[kTechId.Neurotoxin] = 174
end