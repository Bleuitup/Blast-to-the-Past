-- Hallucinated Onos cannot stomp.
--
-- CompMod disables Umbra and Spores by stripping entries out of the Lerk bot action table,
-- because those are separate top-level actions. Stomp cannot be handled that way -- in
-- bots/OnosBrain_Data.lua it lives inside the single "attack" action, so removing the entry
-- would stop hallucinated Onos attacking at all.
--
-- Instead this gates the check the brain actually reads:
--     local hasStomp = goreWeapon ~= nil and
--         goreWeapon:GetSecondaryTechId() == kTechId.Stomp and
--         goreWeapon:GetHasSecondary(onosPlayer)
-- Returning false for a hallucination leaves hasStomp false, so every stomp branch is skipped.
-- Real players are unaffected. BoneShield is a separate weapon and is not touched.

local oldGetHasSecondary = StompMixin.GetHasSecondary

function StompMixin:GetHasSecondary(player)

    if player and player.isHallucination then
        return false
    end

    return oldGetHasSecondary(self, player)

end
