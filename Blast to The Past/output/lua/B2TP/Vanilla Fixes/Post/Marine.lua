-- Vanilla has the two female sprint sounds assigned to each other's constants:
-- kSprintStartFemale points at "sprint_tired_female" and kSprintTiredEndFemale points at
-- "sprint_start_female". Swap them back.
local kSprintStartFemale = Marine.kSprintStartFemale
Marine.kSprintStartFemale = Marine.kSprintTiredEndFemale
Marine.kSprintTiredEndFemale = kSprintStartFemale
