-- Corrects the ARC build tooltip in the Robotics Factory menu.
--
-- Vanilla's ARC_TOOLTIP ends with "Limited to 5!", which is vanilla's cap. B2TP sets
-- kMaxARCs = 4 (ARCs/Post/Balance.lua), so that sentence is wrong under this mod.
--
-- Only the ENGLISH string carries the claim. Every other locale NS2 ships stops the tooltip at
-- "Can fire through walls." with no limit mentioned at all, so there is nothing to correct in
-- those languages, and substituting would replace their translated text with English. Hence the
-- enUS gate: fix the one string that is actually wrong, leave the rest alone.
--
-- Substitution mechanism: core/lua/Locale.lua wraps Locale.ResolveString so it looks up
-- Locale.substitutions[key] and resolves THAT instead. A key with no entry in the string tables
-- resolves to itself, which is what allows a literal replacement string here rather than a key.
-- CBM's own Locale.lua relies on the same behaviour throughout.
--
-- Hooked onto TechData rather than Locale because TechData is a file the mod already hooks in
-- several places, and it only stores the tooltip KEY at load time; the string is not resolved
-- until the tooltip is actually drawn, so setting the substitution here is early enough.

if not Client then return end
if not Locale or not Locale.substitutions then return end

if Client.GetOptionString("locale", "enUS") == "enUS" then

    Locale.substitutions["ARC_TOOLTIP"] =
        "Commander controlled AI tanks that do high damage to structures. Can fire through walls. Limited to 4!"

end
