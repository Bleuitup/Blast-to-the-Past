-- Add Advanced Swipe to the alien research list (the techs whose research state is networked to
-- clients, e.g. for the tech map). Append only: replacing the list would drop every entry CBM adds.
-- The vanilla-era version of this file swapped Charge out to fit vanilla's 32-bit mask; CBM's
-- 64-bit mask allows up to 62 entries and CBM uses 40, so nothing needs to give way.
if not table.icontains(TeamInfo.kRelevantTechIdsAlien, kTechId.AdvancedSwipe) then
    table.insert(TeamInfo.kRelevantTechIdsAlien, kTechId.AdvancedSwipe)
end
