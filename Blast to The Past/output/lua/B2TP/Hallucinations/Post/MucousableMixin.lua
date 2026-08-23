-- Hallucinations get no mucous shield. Ported from ENSL CompMod.
-- Without this a hallucination absorbs damage like a real lifeform, which both wastes
-- marine ammo convincingly and makes hallucinations tankier than intended.

local oldGetMaxShieldAmount = MucousableMixin.GetMaxShieldAmount

function MucousableMixin:GetMaxShieldAmount()

    if self.isHallucination then
        return 0
    end

    return oldGetMaxShieldAmount(self)

end
