-- Ejected Exosuits are free for any Marine right away, so a Marine can buy an Exo and hand it
-- to a teammate.
--
-- Vanilla and CBM reserve an ejected suit for the pilot who left it: Exo:PerformEject calls
-- exosuit:SetOwner(marine), and Exosuit:OnOwnerChanged then keeps that owner for kItemStayTime
-- (30 s). While an owner is set, Exosuit:GetIsValidRecipient only lets the owner back in.
-- kItemStayTime itself is left alone, because it also times dropped Med packs, Ammo packs and
-- Catalyst packs.
--
-- Here the owner is cleared on the suit's next server update instead (Exosuit:OnUpdate clears it
-- once resetOwnerTime has passed). An Ejection Seat eject destroys the suit in CBM 3.6, so only
-- a voluntary eject, which needs the pilot out of combat, leaves a suit to hand over.

local oldOnOwnerChanged = Exosuit.OnOwnerChanged
function Exosuit:OnOwnerChanged(prevOwner, newOwner, ...)

    if oldOnOwnerChanged then
        oldOnOwnerChanged(self, prevOwner, newOwner, ...)
    end

    if newOwner then
        self.resetOwnerTime = Shared.GetTime()
    end

end
