-- The alien research list: the techs whose research state is networked to clients, which is what
-- research overviews such as the spectator production panel (GUIProduction) show.
--
-- Add Advanced Swipe. Append only: replacing the list would drop every entry vanilla has. The 64-bit
-- mask allows up to 62 entries; vanilla (build 345) uses 32.
--
-- Charge stays in the list, as in vanilla: it is the Onos movement special, and the
-- overview listing it is correct. (v2.00c removed it; v2.00d puts it back.)
if not table.icontains(TeamInfo.kRelevantTechIdsAlien, kTechId.AdvancedSwipe) then
    table.insert(TeamInfo.kRelevantTechIdsAlien, kTechId.AdvancedSwipe)
end
