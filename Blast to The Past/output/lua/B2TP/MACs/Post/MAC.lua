-- MAC movement.
--
-- Speed model is CompMod's: vanilla base speed, scaled up while out of combat. CompMod's
-- accompanying change that blocks MAC orders before the round starts is deliberately NOT
-- included.
--
-- Rollout speed is CBM's value. Vanilla rolls a MAC out of the factory at 2, which is slow
-- enough to be a real delay on the first MAC.

MAC.kRolloutSpeed = 5 -- was 2

function MAC:GetMoveSpeed()

    local maxSpeedTable = { maxSpeed = MAC.kMoveSpeed }

    if self.rolloutSourceFactory then
        maxSpeedTable.maxSpeed = MAC.kRolloutSpeed
    elseif not self:GetIsInCombat() then
        maxSpeedTable.maxSpeed = maxSpeedTable.maxSpeed * kMACOutOfCombatSpeedScalar
    end

    self:ModifyMaxSpeed(maxSpeedTable)

    return maxSpeedTable.maxSpeed

end
