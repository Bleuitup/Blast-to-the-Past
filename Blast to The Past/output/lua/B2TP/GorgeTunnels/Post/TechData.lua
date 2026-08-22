local oldBuildTechData = BuildTechData

-- Ghost-model extents for tunnel ends. Vanilla never needed these because only the commander
-- placed tunnels; the gorge ghost uses them to size its placement box.
local kTunnelExtents = Vector(1.2, 0.3, 1.2)

local kExtentsOverrides = {
    [kTechId.BuildTunnelEntryOne] = true,
    [kTechId.BuildTunnelEntryTwo] = true,
    [kTechId.BuildTunnelEntryThree] = true,
    [kTechId.BuildTunnelEntryFour] = true,
    [kTechId.BuildTunnelExitOne] = true,
    [kTechId.BuildTunnelExitTwo] = true,
    [kTechId.BuildTunnelExitThree] = true,
    [kTechId.BuildTunnelExitFour] = true,
    [kTechId.Tunnel] = true,
    [kTechId.TunnelExit] = true,
    [kTechId.TunnelRelocate] = true,
}

function BuildTechData()

    local techData = oldBuildTechData()

    for i = 1, #techData do
        local entry = techData[i]
        if entry[kTechDataId] and kExtentsOverrides[entry[kTechDataId]] then
            entry[kTechDataMaxExtents] = kTunnelExtents
        end
    end

    local menuEntries = {
        {
            [kTechDataId] = kTechId.GorgeTunnelMenu,
            [kTechDataDisplayName] = "Tunnel Menu",
        },

        {
            [kTechDataId] = kTechId.GorgeTunnelMenuBack,
            [kTechDataDisplayName] = "Back",
        },

        {
            [kTechDataId] = kTechId.GorgeTunnelMenuNetwork1,
            [kTechDataDisplayName] = "Network 1",
            [kTechDataMaxAmount] = 2,
        },

        {
            [kTechDataId] = kTechId.GorgeTunnelMenuNetwork2,
            [kTechDataDisplayName] = "Network 2",
            [kTechDataMaxAmount] = 2,
        },

        {
            [kTechDataId] = kTechId.GorgeTunnelMenuNetwork3,
            [kTechDataDisplayName] = "Network 3",
            [kTechDataMaxAmount] = 2,
        },

        {
            [kTechDataId] = kTechId.GorgeTunnelMenuNetwork4,
            [kTechDataDisplayName] = "Network 4",
            [kTechDataMaxAmount] = 2,
        },

        {
            [kTechDataId] = kTechId.GorgeTunnelMenuEntrance,
            [kTechDataDisplayName] = "Tunnel Entry",
            [kTechDataMaxAmount] = 1,
            [kTechDataCostKey] = kGorgeTunnelDropCost,
            [kTechDataAllowConsumeDrop] = true,
            [kTechDataMaxExtents] = kTunnelExtents,
        },

        {
            [kTechDataId] = kTechId.GorgeTunnelMenuExit,
            [kTechDataDisplayName] = "Tunnel Exit",
            [kTechDataMaxAmount] = 1,
            [kTechDataCostKey] = kGorgeTunnelDropCost,
            [kTechDataAllowConsumeDrop] = true,
            [kTechDataMaxExtents] = kTunnelExtents,
        },
    }

    for i = 1, #menuEntries do
        table.insert(techData, menuEntries[i])
    end

    return techData

end
