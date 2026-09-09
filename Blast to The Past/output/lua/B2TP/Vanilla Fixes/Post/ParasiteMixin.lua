-- HUD timer fix; same math.abs() problem as CatPackMixin.
function ParasiteMixin:GetParasitePercentageRemaining()

    local percentLeft = 0

    if self.parasited and self.parasiteDuration > 0 then
        percentLeft = Clamp(((self.timeParasited + self.parasiteDuration) - Shared.GetTime()) / self.parasiteDuration, 0.0, 1.0)
    end

    return percentLeft

end
