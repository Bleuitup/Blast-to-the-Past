-- Aura no longer reveals enemy health.
--
-- Vanilla tints each aura icon by the target's health: Color(1, healthScalar, blue, 1) goes red as
-- the enemy is hurt, which hands the alien team a free health readout. Thunderdome already turns
-- that off, and both of vanilla's branches key off one flag set in Initialize:
--
--     self.isThunderdomeEnabled = Shared.GetThunderdomeEnabled()
--     icon:SetTexture(self.isThunderdomeEnabled and kTDTexture or kTexture)
--     local healthScalar = self.isThunderdomeEnabled and 1 or enemy:GetHealthScalar()
--     local blue        = self.isThunderdomeEnabled and 1 or 0
--
-- So forcing the flag true reproduces exactly what B2TP wants: the flat white thunderdome icon and
-- Color(1, 1, 1, 1) regardless of enemy health.
--
-- This replaces an earlier approach that shipped a whole modified copy of GUIAuraDisplay.lua as a
-- Replace hook. CBM ships its own copy of that file, so a Replace would have silently discarded
-- CBM's version. Hooking the one flag leaves CBM's file intact and is far less to keep in sync.
--
-- Timing is safe: CreateAuaIcon is called lazily from Update when an icon is first needed, not from
-- Initialize, so the flag is already true before any icon picks its texture.

local oldInitialize = GUIAuraDisplay.Initialize

function GUIAuraDisplay:Initialize()

    oldInitialize(self)

    self.isThunderdomeEnabled = true

end
