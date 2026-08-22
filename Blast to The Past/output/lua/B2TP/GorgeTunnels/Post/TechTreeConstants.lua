Script.Load("lua/B2TP/GorgeTunnels/Shared/EnumUtils.lua")

-- Menu-only tech ids for the gorge tunnel submenu. The actual tunnel structures reuse the
-- existing vanilla BuildTunnelEntry/Exit ids, so nothing here touches the commander tech tree.
local newTechIds = {
    "GorgeTunnelMenu",
    "GorgeTunnelMenuBack",
    "GorgeTunnelMenuNetwork1",
    "GorgeTunnelMenuNetwork2",
    "GorgeTunnelMenuNetwork3",
    "GorgeTunnelMenuNetwork4",
    "GorgeTunnelMenuEntrance",
    "GorgeTunnelMenuExit",
}

for i = 1, #newTechIds do
    B2TP_AppendToEnum(kTechId, newTechIds[i])
end
