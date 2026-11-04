-- The Exosuit eject help card. Vanilla's text ends in
-- "Exosuit unlocks after %{unlockTime}d seconds if you're not back inside!" (30 s). B2TP frees an
-- ejected suit at once (Exosuits/Post/Exosuit.lua), so that line would be false; this keeps
-- vanilla's English wording and replaces only the last sentence, for every language: a Locale
-- substitution (Locale.lua loads long before the help screen).

if not Client then return end
if not Locale or not Locale.substitutions then return end

Locale.substitutions["HELP_SCREEN_EXO_EJECT_DESCRIPTION"] =
    "When you gotta go, you gotta go!  Hold to eject.  Can save your life, or simply allow you to make repairs.  Beware of carjacking marines: any Marine can climb into an empty Exosuit right away!"
