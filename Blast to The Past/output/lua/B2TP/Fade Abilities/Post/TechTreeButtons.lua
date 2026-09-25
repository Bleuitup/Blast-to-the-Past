
local kTechIdToMaterialOffset = debug.getupvaluex(GetMaterialXYOffset, "kTechIdToMaterialOffset")

-- ui/buildmenu.dds is CBM's sheet with B2TP's icons added in free cells (CBM uses up to 207).
-- 210 = row 17, column 6.
if kTechIdToMaterialOffset then
    kTechIdToMaterialOffset[kTechId.AdvancedSwipe] = 210
end
