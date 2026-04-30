local oldBuildDamageTypeRules = debug.getupvaluex(GetDamageByType, "BuildDamageTypeRules")

local function ApplyNeurotoxinHit(attacker, target, tickDamage, neuroLevel)
    local dotMarker = CreateEntity(DotMarker.kMapName, target:GetOrigin(), attacker:GetTeamNumber())
    dotMarker:SetTechId(kTechId.Neurotoxin)
    dotMarker:SetDamageType(kDamageType.Gas)
    dotMarker:SetLifeTime(1 + (kNeurotoxinLifetimePerChamber * neuroLevel))
    dotMarker:SetDamage(tickDamage)
    dotMarker:SetRadius(0)
    dotMarker:SetDamageIntervall(kNeurotoxinDamageInterval)
    dotMarker:SetDotMarkerType(DotMarker.kType.SingleTarget)
    dotMarker:SetTargetEffectName("poison_dart_trail")
    dotMarker:SetDeathIconIndex(kDeathMessageIcon.Neurotoxin)
    dotMarker:SetIsAffectedByCrush(false)
    dotMarker:SetOwner(attacker)
    dotMarker:SetAttachToTarget(target, target:GetOrigin())

    dotMarker:SetDestroyCondition(
        function(self, target)
            return not target:GetIsAlive()
        end
    )
end