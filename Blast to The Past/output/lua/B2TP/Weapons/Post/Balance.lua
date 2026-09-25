-- Weapon upgrade scaling
--
-- Target: every marine weapon gets the same bonus per weapons level. 10% vs players and 20% vs
-- structures, i.e. CBM's "structures take double the upgrade bonus" rule applied uniformly.
--
-- Grenade launcher, flamethrower and every other weapon already get exactly that from CBM. CBM
-- comments GL and FT out of BOTH upgradedDamageScalars tables in DamageTypes.lua (see its note at
-- Balance.lua:885), so they fall through to the "Default" entries: kWeapons*DamageScalar (10%) and
-- kWeapons*DamageScalarStructure (20%). Nothing to set for them; kGrenadeLauncher*/kFlamethrower*
-- are never read under CBM.
--
-- The shotgun is the one exception, because CBM keeps a dedicated shotgun entry in both tables,
-- built from vanilla's 7.84% (and 7.84% * 2 = 15.68% vs structures). So B2TP overrides both sets to
-- bring it in line with every other weapon.
--
-- Timing: DamageTypes builds those tables lazily on the first damage event, long after this Post
-- hook has run, so these are the values it captures.

local kShotgunDamagePerUpgradeScalar = 0.1 -- was 0.0784 lol uwe why
kShotgunWeapons1DamageScalar = 1 + kShotgunDamagePerUpgradeScalar
kShotgunWeapons2DamageScalar = 1 + kShotgunDamagePerUpgradeScalar * 2
kShotgunWeapons3DamageScalar = 1 + kShotgunDamagePerUpgradeScalar * 3

-- CBM's structure rule: double the per-level bonus. 20% per level, same as every other weapon.
local kShotgunDamagePerUpgradeScalarStructure = kShotgunDamagePerUpgradeScalar * 2
kShotgunWeapons1DamageScalarStructure = 1 + kShotgunDamagePerUpgradeScalarStructure
kShotgunWeapons2DamageScalarStructure = 1 + kShotgunDamagePerUpgradeScalarStructure * 2
kShotgunWeapons3DamageScalarStructure = 1 + kShotgunDamagePerUpgradeScalarStructure * 3
