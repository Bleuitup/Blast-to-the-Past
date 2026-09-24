local origGetMaterialXYOffset = GetMaterialXYOffset
function GetMaterialXYOffset(techId)
    if techId == kTechId.MedTech1 then
        return 4, 17 -- index 208
    end
    if techId == kTechId.MedTech2 then
        return 5, 17 -- index 209
    end
    return origGetMaterialXYOffset(techId)
end
