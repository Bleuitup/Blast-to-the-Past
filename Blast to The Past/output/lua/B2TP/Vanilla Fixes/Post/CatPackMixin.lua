-- HUD timer fix. Vanilla wraps the remaining time in math.abs(), so once the boost expires
-- the value goes negative, gets flipped positive, and the bar refills instead of staying empty.
function CatPackMixin:GetCatPackTimeRemaining()

    local percentLeft = 0

    if self.catpackboost then
        percentLeft = Clamp(((self.timeCatpackboost + kCatPackDuration) - Shared.GetTime()) / kCatPackDuration, 0.0, 1.0)
    end

    return percentLeft

end
