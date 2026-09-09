-- ## ALIENS

-- PvE structure costs (Crag/Shift/Shade/Whip at 10) are CBM's and are inherited, not set here.
kTunnelEntranceCost = 8 -- vanilla; gorges can now drop tunnels for pres instead
kTunnelExitCost = 8 -- vanilla; gorges can now drop tunnels for pres instead
kTunnelRelocateCost = 5 -- was 6 (CBM leaves this at 6)

-- ## MARINES
-- Welder drop (2) and mine drop (5) are CBM's values already; nothing to set.
kWelderCost = 2 -- was 2

-- Marine structures
-- CBM raises sentries to 9. B2TP keeps the gentler 6 for now; deleting these two lines is all
-- that is needed to fall back to CBM's numbers.
kSentryCost = 6
kSentryBatteryCost = 12
