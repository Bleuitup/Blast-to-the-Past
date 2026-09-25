-- Corrects the ARC build tooltip in the Robotics Factory menu.
--
-- B2TP sets kMaxARCs = 4 (ARCs/Post/Balance.lua). CBM's Locale.lua replaces ARC_TOOLTIP for EVERY
-- language with English text ending "Limited to 5 total, including variants!", which is wrong under
-- B2TP. So this replaces it for every language too, with the same wording and B2TP's cap. (In
-- vanilla only the English string mentioned a cap, which is why an earlier version of this file
-- only touched enUS; under CBM that left Portuguese and Spanish players reading "Limited to 5".)
-- "Including variants" stays accurate either way: the ARC variants exist only with the Core Toggle
-- off, and count toward the same cap.
--
-- Substitution mechanism: core/lua/Locale.lua wraps Locale.ResolveString so it looks up
-- Locale.substitutions[key] and resolves THAT instead. A key with no entry in the string tables
-- resolves to itself, which is what allows a literal replacement string here rather than a key.
--
-- Load order: CBM sets its substitution when Locale.lua loads (Shared.lua line 20); this runs when
-- TechData.lua loads (line 38), so B2TP's text is the one left in place.

if not Client then return end
if not Locale or not Locale.substitutions then return end

Locale.substitutions["ARC_TOOLTIP"] =
    "Commander controlled AI tanks that do high damage to structures. Can fire through walls. Limited to 4 total, including variants!"
