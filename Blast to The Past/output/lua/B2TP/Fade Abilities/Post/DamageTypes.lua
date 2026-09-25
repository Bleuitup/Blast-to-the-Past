-- Advanced Swipe: +kAdvancedSwipeDamageScalar on swipe damage once the tech is researched.
--
-- Every argument after damage is passed through untouched with "...". CBM's version of this
-- function takes a 6th argument, target, and applies weapon upgrades only when target is not nil
-- (it needs the target for its x2-vs-structures rule). An earlier version of this wrapper forwarded
-- only vanilla's five arguments, which silently switched off W1-W3 for every marine weapon.

local oldGetUpgradedDamage = NS2Gamerules_GetUpgradedDamage

function NS2Gamerules_GetUpgradedDamage(attacker, doer, damage, ...)

    if doer
    and doer.kMapName == "swipe"
    and attacker
    and GetHasTech(attacker, kTechId.AdvancedSwipe, true) then
        return damage * kAdvancedSwipeDamageScalar
    end

    return oldGetUpgradedDamage(attacker, doer, damage, ...)

end
