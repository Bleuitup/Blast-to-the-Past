-- Weapon upgrade scaling
--
-- Shotgun: 10% per weapons level vs players, up from CBM's (and vanilla's) 7.84%. This is the one
-- weapon B2TP still has to special-case, because CBM keeps a dedicated shotgun entry in the player
-- scalar table in DamageTypes.lua.
--
-- Grenade launcher and flamethrower are NOT set here, and must not be. CBM comments both out of
-- upgradedDamageScalars in DamageTypes.lua (see its note at Balance.lua:885), so they fall through
-- to the "Default" entry, kWeapons*DamageScalar, which CBM already puts at 10% per level. Setting
-- kGrenadeLauncher*/kFlamethrower* here would change nothing under CBM, since nothing reads them.
local kShotgunDamagePerUpgradeScalar = 0.1 -- was 0.0784 lol uwe why
kShotgunWeapons1DamageScalar = 1 + kShotgunDamagePerUpgradeScalar
kShotgunWeapons2DamageScalar = 1 + kShotgunDamagePerUpgradeScalar * 2
kShotgunWeapons3DamageScalar = 1 + kShotgunDamagePerUpgradeScalar * 3
