-- Add Medpack Tech to the marine research list (the techs whose research state is networked to
-- clients, e.g. for the tech map). Append only: replacing the list would drop every entry CBM adds
-- (Exo Prototype Lab, modular exos, SMG, Advanced Observatory, ...). CBM's 64-bit mask allows up
-- to 62 entries; CBM uses 33, so there is room.
for _, techId in ipairs({ kTechId.MedTech1, kTechId.MedTech2 }) do
    if not table.icontains(TeamInfo.kRelevantTechIdsMarine, techId) then
        table.insert(TeamInfo.kRelevantTechIdsMarine, techId)
    end
end
