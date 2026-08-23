-- Hallucinations gain no health from biomass. Ported from ENSL CompMod.
-- Vanilla scales hallucination health with the alien team's biomass level, so late-game
-- hallucinations take noticeably more shots than the lifeform they imitate did earlier.

if not Server then return end

function PlayerHallucinationMixin:GetHealthPerBioMass()
    return 0
end
