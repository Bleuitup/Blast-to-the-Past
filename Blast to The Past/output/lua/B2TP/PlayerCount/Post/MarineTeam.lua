-- Starting resources by team size.
--
-- Vanilla decides the starting Infantry Portals (GetInitialInfantryPortalCount in NS2Utility.lua:
-- 1 IP up to 8 players, 2 from 9, 3 from 15). B2TP adds Tres for the team sizes where vanilla still
-- gives 1 IP but a team is big enough to want more: +5 Tres with 7 players, +10 Tres with 8. This
-- interpolates between 1 IP for 6v6 and the second IP vanilla gives from 9 players.
--
-- Wraps vanilla's function, so its IP count, warmup structures and sandbox setup all stay as they are.
local oldSpawnInitialStructures = MarineTeam.SpawnInitialStructures

function MarineTeam:SpawnInitialStructures(techPoint)

    local tower, commandStation = oldSpawnInitialStructures(self, techPoint)

    local numPlayers = GetNumPlayersForTeamNumber(self:GetTeamNumber())
    if numPlayers == 7 then
        self:AddTeamResources(5)
    elseif numPlayers == 8 then
        self:AddTeamResources(10)
    end

    return tower, commandStation

end
