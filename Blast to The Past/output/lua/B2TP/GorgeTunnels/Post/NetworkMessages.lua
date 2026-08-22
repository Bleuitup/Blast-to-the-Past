-- Widen the gorge build message so it can carry the two tunnel pseudo-indexes (-1 entrance,
-- -2 exit) and the target tunnel network. Re-registering the message replaces the vanilla
-- definition; the field list is otherwise identical to vanilla.
--
-- Ported from ENSL CompMod (lua/CompMod/Network/NetworkMessages.lua).

local kGorgeBuildStructureMessage =
{
    origin = "vector",
    direction = "vector",
    -- vanilla: "integer (1 to 5)" -- negative indexes select tunnel entrance/exit
    structureIndex = "integer (-2 to 5)",
    lastClickedPosition = "vector",
    lastClickedPositionNormal = "vector",
    tunnelNetwork = "integer (0 to 4)"
}

function BuildGorgeDropStructureMessage(origin, direction, structureIndex, lastClickedPosition, lastClickedPositionNormal, tunnelNetwork)
    local t = {}

    t.origin = origin
    t.direction = direction
    t.structureIndex = structureIndex
    t.lastClickedPosition = lastClickedPosition or Vector(0,0,0)
    t.lastClickedPositionNormal = lastClickedPositionNormal or Vector(0,0,0)
    t.tunnelNetwork = tunnelNetwork or 0

    return t
end

function ParseGorgeBuildMessage(t)
    return t.origin, t.direction, t.structureIndex, t.lastClickedPosition, t.lastClickedPositionNormal, t.tunnelNetwork
end

Shared.RegisterNetworkMessage("GorgeBuildStructure", kGorgeBuildStructureMessage)
