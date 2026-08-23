-- Time-scaled Lerk air friction, ported from ENSL CompMod.
--
-- Vanilla is a flat `return 0.08`. This ramps friction up the longer the Lerk goes without
-- flapping, so sustained gliding bleeds speed while normal flapping flight is unaffected.

Lerk.kMinAirFriction = 0.08          -- vanilla value; applies during the grace period
Lerk.kMaxAirFriction = 0.5           -- reached after timeToFullFriction
Lerk.timeToFullFriction = 3.25       -- seconds to reach max friction
Lerk.flapGracePeriod = 0.75          -- seconds before friction exceeds vanilla at all

function Lerk:GetAirFriction()

    local timeSinceLastFlap = Shared.GetTime() - self:GetTimeOfLastFlap()

    return Clamp(
        (Lerk.kMaxAirFriction / Lerk.timeToFullFriction) * (timeSinceLastFlap - Lerk.flapGracePeriod),
        Lerk.kMinAirFriction,
        Lerk.kMaxAirFriction
    )

end
