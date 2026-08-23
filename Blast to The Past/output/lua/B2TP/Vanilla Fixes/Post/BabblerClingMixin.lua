-- Babbler shield friendly-fire feedback fix, ported from ENSL CompMod.
--
-- Vanilla fires hitsounds and damage numbers whenever a babbler shield absorbs damage, without
-- checking whether the attacker is actually an enemy. A teammate brushing a babbler-shielded
-- ally therefore gets hit feedback for damage that was never dealt to an enemy.
--
-- Only the GetAreEnemies guard is added; the rest is vanilla's function body.

function BabblerClingMixin:ModifyDamageTaken(damageTable, attacker, doer, damageType, hitPoint, weapon)

    local damage = damageTable.damage or 0

    if damage > 0 and self:GetApplyBabblerShield(damageType) then

        local amount = math.min(damage, self.babblerShieldRemaining)

        if Server then

            self.babblerShieldRemaining = self.babblerShieldRemaining - amount
            self:DestroyNumClingedBabbler(math.floor((self.numBabblers * self.babblerShieldPerBabbler - self.babblerShieldRemaining) / self.babblerShieldPerBabbler ))

            -- Only report the hit when the attacker is actually an enemy.
            if GetAreEnemies(self, attacker) then

                if HitSound_IsEnabledForWeapon( weapon ) then
                    -- Damage message will be sent at the end of OnProcessMove by the HitSound system
                    HitSound_RecordHit( attacker, self, amount, hitPoint, 0, weapon )
                else
                    SendDamageMessage( attacker, self:GetId(), amount, hitPoint, 0, weapon )
                end

            end

            SendMarkEnemyMessage( attacker, self, amount, weapon )

            if self.OnTakeDamage then
                self:OnTakeDamage(amount, attacker, doer, hitPoint, nil, damageType, false)
            end

        end

        damageTable.damage = damage - amount

    end

end
