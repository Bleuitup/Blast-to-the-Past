-- Route tunnel entrances to the TunnelMapBlip class so they get minimap labels.
-- Ported from ENSL CompMod (lua/CompMod/Mixins/MapBlipMixin.lua).
--
-- Identical to CBM's CreateMapBlip apart from the TunnelEntrance branch. Keep it in step with
-- CBM's copy: this replaces it outright, so anything CBM adds there is lost unless repeated here.

local function CreateMapBlip(self, blipType, blipTeam, _)

    local mapName = MapBlip.kMapName

    --special mapblips
    if self:isa("Player") then
        mapName = PlayerMapBlip.kMapName
    elseif self:isa("Scan") then
        mapName = ScanMapBlip.kMapName
    elseif self:isa("TunnelEntrance") then
        mapName = TunnelMapBlip.kMapName
    end

    local mapBlip = Server.CreateEntity(mapName)

    -- This may fail if there are too many entities.
    if mapBlip then
        -- CBM fog of war: mark a ghost's blip as one, so it fades and grays and the client
        -- option to hide ghosts applies to it. False for every other entity.
        mapBlip.isFogOfWarMapBlip = self:isa("FogOfWarEntity")
        mapBlip:SetOwner(self:GetId(), blipType, blipTeam)
        self.mapBlipId = mapBlip:GetId()
    end

end

debug.setupvaluex(MapBlipMixin.__initmixin, "CreateMapBlip", CreateMapBlip)
