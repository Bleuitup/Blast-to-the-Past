Script.Load("lua/B2TP/GorgeTunnels/Shared/TunnelAbility.lua")

class 'TunnelEntranceAbility' (TunnelAbility)

function TunnelEntranceAbility:GetDropStructureId()
    return kTechId.GorgeTunnelMenuEntrance
end

local techIds = {
    kTechId.BuildTunnelEntryOne,
    kTechId.BuildTunnelEntryTwo,
    kTechId.BuildTunnelEntryThree,
    kTechId.BuildTunnelEntryFour,
}
function TunnelEntranceAbility:GetTechIds()
    return techIds
end

local selectTechIds = {
    kTechId.SelectTunnelEntryOne,
    kTechId.SelectTunnelEntryTwo,
    kTechId.SelectTunnelEntryThree,
    kTechId.SelectTunnelEntryFour,
}
function TunnelEntranceAbility:GetSelectTechIds()
    return selectTechIds
end
