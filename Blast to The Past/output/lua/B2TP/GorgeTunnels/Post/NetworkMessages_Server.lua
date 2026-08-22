-- Re-hook the gorge build handler so it forwards the tunnel network from the widened message.
-- Ported from ENSL CompMod (lua/CompMod/Network/NetworkMessages_Server.lua).
--
-- The position itself is not trusted: DropStructureAbility:DropStructure re-runs
-- GetPositionForStructure server-side, which re-evaluates the B2TP power/infestation gate.

function OnCommandGorgeBuildStructure(client, message)

    local player = client:GetControllingPlayer()
    local origin, direction, structureIndex, lastClickedPosition, lastClickedPositionNormal, tunnelNetwork = ParseGorgeBuildMessage(message)

    local dropStructureAbility = player:GetWeapon(DropStructureAbility.kMapName)

    -- The player may not have an active weapon if the message arrives after they have gone back
    -- to the ready room, for example.
    if dropStructureAbility then
        dropStructureAbility:OnDropStructure(origin, direction, structureIndex, lastClickedPosition, lastClickedPositionNormal, tunnelNetwork)
    end

end
Server.HookNetworkMessage("GorgeBuildStructure", OnCommandGorgeBuildStructure)
