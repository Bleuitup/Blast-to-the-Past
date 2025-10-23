local origGetMaterialXYOffset = GetMaterialXYOffset
function GetMaterialXYOffset(techId)
    if techId == kTechId.MedTech1 then
        return 0, 16 -- index 192
    end
    if techId == kTechId.MedTech2 then
        return 1, 16 -- index 193
    end
    return origGetMaterialXYOffset(techId)
end