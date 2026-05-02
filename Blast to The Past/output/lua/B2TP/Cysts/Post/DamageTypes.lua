local oldBuildDamageTypeRules = debug.getupvaluex(GetDamageByType, "BuildDamageTypeRules")

local function MultiplyFlameAble(target, attacker, doer, damage, armorFractionUsed, healthPerArmor, damageType)

    if target.GetIsFlameAble and target:GetIsFlameAble(damageType) then

        local multi = kFlameableMultiplier

        if target.GetIsFlameableMultiplier then
            multi = target:GetIsFlameableMultiplier(doer)
        end

        damage = damage * multi

    end

    return damage, armorFractionUsed, healthPerArmor

end

local function BuildDamageTypeRules()

    oldBuildDamageTypeRules()

    if kDamageTypeRules
        and kDamageTypeRules[kDamageType.Flame]
        and kDamageTypeRules[kDamageType.Flame][1] then
        kDamageTypeRules[kDamageType.Flame][1] = MultiplyFlameAble
    end

end

debug.setupvaluex(GetDamageByType, "BuildDamageTypeRules", BuildDamageTypeRules)

-- Safety in case rules were already built before this Post file ran.
if kDamageTypeRules
    and kDamageTypeRules[kDamageType.Flame]
    and kDamageTypeRules[kDamageType.Flame][1] then
    kDamageTypeRules[kDamageType.Flame][1] = MultiplyFlameAble
end