-- The Advanced Swipe killfeed icon lives in a fixed cell of ui/inventory_icons.dds (cell 54,
-- i.e. 55th row, directly after CBM's last row plus one empty row). Its enum number is taken
-- dynamically in Globals.lua, so pin the texture row here rather than trusting the number.
local kAdvancedSwipeIconCell = 54
local kSubImageHeight = 64

local oldGetTechOffsetY = DeathMsgUI_GetTechOffsetY
function DeathMsgUI_GetTechOffsetY(iconIndex)
    if iconIndex and iconIndex == kDeathMessageIcon.AdvancedSwipe then
        return kAdvancedSwipeIconCell * kSubImageHeight
    end
    return oldGetTechOffsetY(iconIndex)
end
