local oldShellOnUpdate = Shell.OnUpdate

Shell.kRegenHealRate = Shell.kRegenHealRate or 0.01

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

function Shell:OnUpdate(deltaTime)

    if oldShellOnUpdate then
        oldShellOnUpdate(self, deltaTime)
    end

    if Server then

        local hasCragHive = B2TP_TeamHasTech(self, kTechId.CragHive)

        self.hasRegeneration =
            hasCragHive
            and self:GetIsBuilt()
            and not self:GetIsInCombat()

        if self.hasRegeneration then

            if self:GetIsHealable()
                    and (not self.timeLastAlienAutoHeal
                    or self.timeLastAlienAutoHeal + kAlienRegenerationTime <= Shared.GetTime()) then

                self:AddHealth(Shell.kRegenHealRate * self:GetMaxHealth())
                self.timeLastAlienAutoHeal = Shared.GetTime()

            end

        end

    end

end