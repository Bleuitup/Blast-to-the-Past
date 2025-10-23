function Cyst:GetIsFlameableMultiplier()
    return kCystFlameableMultiplier
end

function Cyst:GetAutoBuildRateMultiplier()
    if GetHasTech(self, kTechId.ShiftHive) then
        return kCystBuildShiftMultiplier
    end

    return 1
end
