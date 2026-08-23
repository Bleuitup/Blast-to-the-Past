-- A dedicated map blip class for tunnel entrances, so the minimap can label them
-- "Entry 2" / "Exit 3". Ported from ENSL CompMod (lua/CompMod/GUI/MapBlip.lua).
--
-- Deviation from CompMod: CompMod also rewrites MapBlip:UpdateMinimapItemHook to comment out
-- vanilla's `if self.OnSameMinimapBlipTeam(...) or minimap.spectating then` guard. That guard
-- also wraps PlayerMapBlip:UpdateHook, which draws player names, so removing it risks drawing
-- enemy names on the minimap. It is left intact here -- TunnelMapBlip:UpdateHook does its own
-- team check before drawing anything, so the labels still work.

class 'TunnelMapBlip' (MapBlip)

TunnelMapBlip.kMapName = "TunnelMapBlip"

if Client then

    function TunnelMapBlip:UpdateMinimapActivity(minimap, item)

        if self.combatActivity == nil then
            self:InitActivityDefaults()
        end

        -- the blipTeam can change if power changes
        local blipTeam = self:GetMapBlipTeam(minimap)

        -- NB: `blipType` is an undefined global here. That is copied verbatim from vanilla
        -- MapBlip:UpdateMinimapActivity, which has the same quirk -- keeping it means tunnel
        -- blips reset on the same schedule as every other blip type rather than diverging.
        if blipType ~= item.blipType or blipTeam ~= item.blipTeam then
            item.resetMinimapItem = true
        end

        return kMinimapActivity.High

    end

    -- Show a label for tunnels on the minimap
    function TunnelMapBlip:UpdateHook(minimap, item)

        local ownerId = self.ownerEntityId
        local blipTeam = self:GetMapBlipTeam(minimap)

        if ownerId and self.OnSameMinimapBlipTeam(minimap.playerTeam, blipTeam) then
            minimap:DrawMinimapNameTunnel(item, blipTeam, ownerId)
        end

    end

end

Shared.LinkClassToMap("TunnelMapBlip", TunnelMapBlip.kMapName, {})
