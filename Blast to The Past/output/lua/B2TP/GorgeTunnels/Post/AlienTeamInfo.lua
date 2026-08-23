-- Make the tunnel manager relevant to the whole alien team, not just the commander.
-- Ported from ENSL CompMod (lua/CompMod/Entities/Alien/AlienTeamInfo.lua).
--
-- Vanilla only replicates the tunnel manager to the commander, because in vanilla only the
-- commander places tunnels. Gorges need it too: TunnelAbility:IsAllowed and the build menu
-- both ask the manager which networks are free, and without replication those reads return
-- nothing on a gorge's client.

function AlienTeamInfo:SetWatchTeam(team)

    if team == self.team or not team then return end

    TeamInfo.SetWatchTeam(self, team)

    if Server then

        local teamNumber = self:GetTeamNumber()
        local tunnelManager = CreateEntity( "alientunnelmanager", Vector(100,100,100), teamNumber)
        tunnelManager:SetParent(self)

        tunnelManager:SetRelevancyDistance(Math.infinity)

        -- vanilla: kRelevantToTeam1Commander / kRelevantToTeam2Commander
        local mask = 0
        if teamNumber == kTeam1Index then
            mask = kRelevantToTeam1
        elseif teamNumber == kTeam2Index then
            mask = kRelevantToTeam2
        end
        tunnelManager:SetExcludeRelevancyMask(mask)

        self.tunnelManagerId = tunnelManager:GetId()

    end

end
