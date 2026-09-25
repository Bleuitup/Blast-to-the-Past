-- The alien research list: the techs whose research state is networked to clients, which is what
-- research overviews such as the spectator production panel (GUIProduction) show.
--
-- Add Advanced Swipe. Append only: replacing the list would drop every entry CBM adds. CBM's 64-bit
-- mask allows up to 62 entries; CBM uses 40.
if not table.icontains(TeamInfo.kRelevantTechIdsAlien, kTechId.AdvancedSwipe) then
    table.insert(TeamInfo.kRelevantTechIdsAlien, kTechId.AdvancedSwipe)
end

-- Drop Charge. It is registered as a passive Onos tech with no prerequisite, so it counts as owned
-- from the first second of the round and overviews built from this list show "Charge" as if the
-- Onos had it as an ability. It is not an Onos ability in B2TP, CBM or vanilla; live B2TP before
-- v2.0 left it out of this list too.
for i = #TeamInfo.kRelevantTechIdsAlien, 1, -1 do
    if TeamInfo.kRelevantTechIdsAlien[i] == kTechId.Charge then
        table.remove(TeamInfo.kRelevantTechIdsAlien, i)
    end
end
