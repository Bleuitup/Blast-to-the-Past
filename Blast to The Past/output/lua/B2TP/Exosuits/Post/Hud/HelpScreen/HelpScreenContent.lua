-- The Exosuit eject help card. CBM replaces its text for every language with English ending in
-- "Exosuit unlocks after %{unlockTime}d seconds if you're not back inside!" (30 s). B2TP frees an
-- ejected suit at once (Exosuits/Post/Exosuit.lua), so that line would be false; this keeps
-- CBM's wording and replaces only the last sentence. Same mechanism and scope as CBM: a
-- Locale substitution, set after CBM's (its Locale.lua loads long before the help screen).

if not Client then return end
if not Locale or not Locale.substitutions then return end

Locale.substitutions["HELP_SCREEN_EXO_EJECT_DESCRIPTION"] =
    "When you gotta go, you gotta go!  Hold to eject.  Can save your life, or simply allow you to make repairs.  Beware of carjacking marines: any Marine can climb into an empty Exosuit right away!"
