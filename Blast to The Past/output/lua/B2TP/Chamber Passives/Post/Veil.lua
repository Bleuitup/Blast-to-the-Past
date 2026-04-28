local oldVeilOnUpdate = Veil.OnUpdate

local function B2TP_TeamHasTech(entity, techId)

    if not Server then
        return false
    end

    local team = entity.GetTeam and entity:GetTeam() or nil

    if not team and entity.GetTeamNumber then
        team = GetGamerules():GetTeam(entity:GetTeamNumber())
    end

    if not team then
        return false
    end

    local techTree = team.GetTechTree and team:GetTechTree() or team.techTree

    return techTree ~= nil and techTree:GetHasTech(techId)

end

function Veil:OnUpdate(deltaTime)

    if oldVeilOnUpdate then
        oldVeilOnUpdate(self, deltaTime)
    end

    if Server then

        self.camouflaged =
            B2TP_TeamHasTech(self, kTechId.ShadeHive)
            and self:GetIsBuilt()
            and not self:GetIsInCombat()

    end

end

function Veil:GetIsCamouflaged()

    return self.camouflaged == true and self:GetIsBuilt()

end