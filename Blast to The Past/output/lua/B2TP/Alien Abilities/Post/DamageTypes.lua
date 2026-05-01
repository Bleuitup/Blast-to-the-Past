local oldGetUpgradedDamage = NS2Gamerules_GetUpgradedDamage

function NS2Gamerules_GetUpgradedDamage(attacker, doer, damage, damageType, hitPoint)

    if doer
    and doer.kMapName == "swipe"
    and attacker
    and GetHasTech(attacker, kTechId.AdvancedSwipe) then
        return damage * kAdvancedSwipeDamageScalar
    end

    return oldGetUpgradedDamage(attacker, doer, damage, damageType, hitPoint)

end
