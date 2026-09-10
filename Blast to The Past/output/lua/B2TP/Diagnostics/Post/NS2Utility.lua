-- TEMPORARY load-order diagnostic for the CBM integration. Delete before release.
--
-- The whole integration rests on one assumption: that B2TP's Post hooks run AFTER CBM's
-- replacement files, so B2TP's constants win. Reading a constant at hook time would only prove when
-- B2TP ran, not who ended up last, so this registers a console command that reads the live globals
-- at runtime instead, long after every load-time hook has finished.
--
-- Type  b2tp_check  in console with CBM + CBM Core Toggle + B2TP all loaded.

local function Report()

    local rows =
    {
        -- name,                                  B2TP wants,  CBM value
        { "kLeapEnergyCost",                       55,   45,     kLeapEnergyCost },
        { "kSentryCost",                           6,    9,      kSentryCost },
        { "kMatureCystHealth",                     350,  450,    kMatureCystHealth },
        { "kBoneShieldHitpoints",                  600,  1000,   kBoneShieldHitpoints },
        { "kARCHealth",                            2100, 2600,   kARCHealth },
        { "kMaxARCs",                              4,    5,      kMaxARCs },
        { "kCystBuildTime",                        6,    3.33,   kCystBuildTime },
        { "kLerkHealth",                           170,  180,    kLerkHealth },
        { "kShotgunWeapons3DamageScalar",          1.3,  1.2352, kShotgunWeapons3DamageScalar },
        { "kShotgunWeapons3DamageScalarStructure", 1.6,  1.4704, kShotgunWeapons3DamageScalarStructure },
    }

    Shared.Message("=== B2TP load-order check ===")

    local b2tpWins, cbmWins, neither = 0, 0, 0

    for i = 1, #rows do

        local name, want, cbm, actual = rows[i][1], rows[i][2], rows[i][3], rows[i][4]
        local verdict

        if actual == nil then
            verdict = "UNSET"
            neither = neither + 1
        elseif math.abs(actual - want) < 0.001 then
            verdict = "B2TP"
            b2tpWins = b2tpWins + 1
        elseif math.abs(actual - cbm) < 0.001 then
            verdict = "CBM"
            cbmWins = cbmWins + 1
        else
            verdict = "OTHER"
            neither = neither + 1
        end

        Shared.Message(string.format("  %-38s live=%-8s b2tp=%-8s cbm=%-8s -> %s",
            name, tostring(actual), tostring(want), tostring(cbm), verdict))

    end

    -- Core Toggle sets this false; CBM sets it true. Confirms the toggle is actually loaded.
    Shared.Message(string.format("  %-38s live=%s (Core Toggle ON means false)",
        "kCBMaddon", tostring(kCBMaddon)))

    Shared.Message(string.format("=== B2TP:%d  CBM:%d  other:%d ===", b2tpWins, cbmWins, neither))

end

Event.Hook("Console_b2tp_check", Report)
