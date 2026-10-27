function Cyst:GetIsFlameableMultiplier(doer)
    if doer and doer.isa and doer:isa("Welder") then
        return 4
    else
        return 7
    end
end

function Cyst:GetAutoBuildRateMultiplier()
    if GetHasTech(self, kTechId.ShiftHive) then
        -- return 1.25
        return 1.4 -- 5 / (0.5 * 1.4) = 7.1 s with a Shift hive, between vanilla (5.33 s) and CompMod (8 s)
    end

    return 1
end
