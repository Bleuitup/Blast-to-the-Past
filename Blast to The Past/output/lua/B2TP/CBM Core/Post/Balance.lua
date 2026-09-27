-- Runs B2TP on CBM's Core Edition without the separate CBM Core Toggle mod.
--
-- CBM's Balance.lua sets kCBMaddon = true, which switches on the Content Edition (AMAC, SPARC, SMG,
-- Advanced Observatory and Gate, Bio 5, Advanced structures). This post hook runs right after that
-- file, before anything reads the flag: every other CBM file that checks it loads later, and their
-- file-scope checks (tech maps, buy menu, exo module list) see false.
--
-- This replaces the Core Toggle, as requested by CBM's lead for the v3.6 beta. The Toggle's other
-- part, rebuilding kTraitsInChamberMap with Carapace, is not needed: CBM 3.5 and 3.6 already build
-- it with Carapace. Loading the Toggle as well is harmless, since both set the same value.

kCBMaddon = false
