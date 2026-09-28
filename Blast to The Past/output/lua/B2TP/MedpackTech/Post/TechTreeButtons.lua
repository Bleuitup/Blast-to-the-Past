local origGetMaterialXYOffset = GetMaterialXYOffset
function GetMaterialXYOffset(techId)
    if techId == kTechId.MedTech1 then
        return 9, 17 -- index 213
    end
    if techId == kTechId.MedTech2 then
        return 10, 17 -- index 214
    end
    return origGetMaterialXYOffset(techId)
end
