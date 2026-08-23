-- B2TP gorge tunnel placement rules.
--
-- A gorge may drop a tunnel end only where the room's power node is not powering, OR where the
-- position is on infestation. Commander-dropped tunnels are unaffected -- this file is only
-- consulted by TunnelAbility.
--
-- "Powering" is exactly the state vanilla uses to decide whether marine structures in a room
-- receive power (PowerSourceMixin). It is false while the node is unbuilt, false once destroyed,
-- and only returns to true when a destroyed node is welded back to full health
-- (PowerPoint:OnWeldOverride requires GetHealthScalar() == 1 before calling PowerUp).
--
-- PowerSourceMixin declares `powering` as a network var, so this predicate is safe to evaluate on
-- the client for the placement ghost. Vanilla does the same thing for the marine commander's ghost
-- in lua/Hud/Commander/MarineGhostModel.lua.

function B2TP_GetIsRoomPowered(position)

    local location = GetLocationForPoint(position)

    if not location then
        return false
    end

    local powerPoint = GetPowerPointForLocation(location:GetName())

    return powerPoint ~= nil and powerPoint:GetIsPowering()

end

function B2TP_GetIsGorgeTunnelPositionAllowed(position)

    -- Infestation always permits a drop, regardless of room power.
    if GetIsPointOnInfestation(position) then
        return true
    end

    return not B2TP_GetIsRoomPowered(position)

end
