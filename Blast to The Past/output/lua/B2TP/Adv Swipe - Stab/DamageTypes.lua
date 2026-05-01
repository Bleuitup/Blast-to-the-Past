--local oldGetUpgradedDamage = NS2Gamerules_GetUpgradedDamage

--function NS2Gamerules_GetUpgradedDamage(attacker, doer, damage, damageType, hitPoint)

--    if doer
--    and doer.kMapName == "swipe"
--    and attacker
--    and GetHasTech(attacker, kTechId.AdvancedSwipe) then
--        return damage * kAdvancedSwipeDamageScalar
--    end

--    return oldGetUpgradedDamage(attacker, doer, damage, damageType, hitPoint)
--
--end

local oldGetUpgradedDamage = NS2Gamerules_GetUpgradedDamage

function NS2Gamerules_GetUpgradedDamage(attacker, doer, damage, damageType, hitPoint)

    local hasAdvancedSwipe = attacker and GetHasTech(attacker, kTechId.AdvancedSwipe, true) or false
    local hasStab = attacker and GetHasTech(attacker, kTechId.Stab, true) or false

    local doerMapName = doer and doer.kMapName or "nil"
    local doerClassName = "nil"

    if doer and doer.GetClassName then
        doerClassName = doer:GetClassName()
    end

--    if Server and attacker and doer and (doerClassName == "SwipeBlink" or doerClassName == "StabBlink" or doerMapName == "swipe") then
--        Print(string.format(
--            "[ADVSWIPE DEBUG] class=%s map=%s adv=%s stab=%s baseDamage=%.2f",
--            tostring(doerClassName),
--            tostring(doerMapName),
--            tostring(hasAdvancedSwipe),
--            tostring(hasStab),
--            damage
--        ))
--    end

    if doer
    and doer.kMapName == "swipe"
    and attacker
    and hasAdvancedSwipe then

--        if Server then
--            Print(string.format(
--                "[ADVSWIPE APPLIED] class=%s map=%s scalar=%.3f finalDamage=%.2f",
--                tostring(doerClassName),
--                tostring(doerMapName),
--                kAdvancedSwipeDamageScalar,
--                damage * kAdvancedSwipeDamageScalar
--            ))
--        end

        return damage * kAdvancedSwipeDamageScalar
    end

    return oldGetUpgradedDamage(attacker, doer, damage, damageType, hitPoint)

end