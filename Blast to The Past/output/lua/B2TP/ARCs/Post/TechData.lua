-- Corrects the ARC build tooltip in the Robotics Factory menu.
--
-- B2TP sets kMaxARCs = 4 (ARCs/Post/Balance.lua) in every game mode. Vanilla's ARC_TOOLTIP ends
-- "Limited to 5 total, including variants!", which is wrong under B2TP, so this replaces it for
-- every language with the same wording and B2TP's cap. Vanilla's Thunderdome tooltip
-- (ARC_THUNDERDOME_TOOLTIP) already says "Limited to 4!" and is left alone. "Including variants"
-- is accurate: the SPARC counts toward the same cap.
--
-- Substitution mechanism: core/lua/Locale.lua wraps Locale.ResolveString so it looks up
-- Locale.substitutions[key] and resolves THAT instead. A key with no entry in the string tables
-- resolves to itself, which is what allows a literal replacement string here rather than a key.
--
-- Load order: this runs when TechData.lua loads, after Locale.lua, so B2TP's text is the one left
-- in place.

if not Client then return end
if not Locale or not Locale.substitutions then return end

Locale.substitutions["ARC_TOOLTIP"] =
    "Commander controlled AI tanks that do high damage to structures. Can fire through walls. Limited to 4 total, including variants!"
