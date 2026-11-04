-- Add Medpack Tech to the marine research list (the techs whose research state is networked to
-- clients, e.g. for the tech map). Append only: replacing the list would drop every entry vanilla
-- has. The 64-bit mask allows up to 62 entries; vanilla (build 345) uses 29, so there is room.
for _, techId in ipairs({ kTechId.MedTech1, kTechId.MedTech2 }) do
    if not table.icontains(TeamInfo.kRelevantTechIdsMarine, techId) then
        table.insert(TeamInfo.kRelevantTechIdsMarine, techId)
    end
end
