-- HUD timer fix; same math.abs() problem as CatPackMixin.
function NanoShieldMixin:GetNanoShieldTimeRemaining()

    local percentLeft = 0

    if self.nanoShielded then

        local duration
        if self:isa("Player") then
            duration = kNanoShieldPlayerDuration
        else
            duration = kNanoShieldStructureDuration
        end

        percentLeft = Clamp(((self.timeNanoShieldInit + duration) - Shared.GetTime()) / duration, 0.0, 1.0)

    end

    return percentLeft

end
