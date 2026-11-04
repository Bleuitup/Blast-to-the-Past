-- Weapon upgrade scaling
--
-- Target: every marine weapon gets the same bonus per weapons level. Vanilla (build 345) gives every
-- weapon 10% per level against players and 15% against structures (kDamagePerUpgradeScalarStructure
-- is 0.1 * 1.5), through the "Default" entries of DamageTypes.lua's upgradedDamageScalars tables.
--
-- The shotgun is the one exception, because vanilla keeps a dedicated shotgun entry in both tables,
-- built from the old 7.84% per level (and 7.84% * 2 = 15.68% against structures). So B2TP overrides
-- both sets to bring it in line with every other weapon.
--
-- Timing: DamageTypes builds those tables lazily on the first damage event, long after this Post
-- hook has run, so these are the values it captures.

local kShotgunDamagePerUpgradeScalar = 0.1 -- was 0.0784
kShotgunWeapons1DamageScalar = 1 + kShotgunDamagePerUpgradeScalar
kShotgunWeapons2DamageScalar = 1 + kShotgunDamagePerUpgradeScalar * 2
kShotgunWeapons3DamageScalar = 1 + kShotgunDamagePerUpgradeScalar * 3

-- Vanilla's structure rule for every other weapon: 1.5x the per-level bonus, 15% per level.
local kShotgunDamagePerUpgradeScalarStructure = kShotgunDamagePerUpgradeScalar * 1.5 -- was 0.0784 * 2
kShotgunWeapons1DamageScalarStructure = 1 + kShotgunDamagePerUpgradeScalarStructure
kShotgunWeapons2DamageScalarStructure = 1 + kShotgunDamagePerUpgradeScalarStructure * 2
kShotgunWeapons3DamageScalarStructure = 1 + kShotgunDamagePerUpgradeScalarStructure * 3
