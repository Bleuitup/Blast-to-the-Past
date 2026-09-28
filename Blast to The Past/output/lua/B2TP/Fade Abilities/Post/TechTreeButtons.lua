
local kTechIdToMaterialOffset = debug.getupvaluex(GetMaterialXYOffset, "kTechIdToMaterialOffset")

-- ui/buildmenu.dds is CBM 3.6's sheet with B2TP's icons in the last free cells of row 17 (CBM uses up
-- to 209 and grows from the front, so B2TP fills from the back: 213 Medtech #1, 214 Medtech #2).
-- 215 = row 17, column 11.
if kTechIdToMaterialOffset then
    kTechIdToMaterialOffset[kTechId.AdvancedSwipe] = 215
end
