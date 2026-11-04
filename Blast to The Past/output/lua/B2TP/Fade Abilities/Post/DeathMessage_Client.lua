-- The Advanced Swipe killfeed icon lives in a fixed cell of ui/inventory_icons.dds (cell 52, i.e.
-- the 53rd row, added directly after vanilla's last row, cell 51). Its enum number is taken
-- dynamically in Globals.lua, so pin the texture row here rather than trusting the number.
-- When vanilla adds killfeed icons, its sheet grows: rebuild ours on top of it and move this cell.
local kAdvancedSwipeIconCell = 52
local kSubImageHeight = 64

local oldGetTechOffsetY = DeathMsgUI_GetTechOffsetY
function DeathMsgUI_GetTechOffsetY(iconIndex)
    if iconIndex and iconIndex == kDeathMessageIcon.AdvancedSwipe then
        return kAdvancedSwipeIconCell * kSubImageHeight
    end
    return oldGetTechOffsetY(iconIndex)
end
