-- Keep marines on one starting IP up to 8v8. Besides the round-start spawn (replaced in
-- MarineTeam.lua), MarineTeam:CheckForFreeInfantryPortal gives a free second IP whenever a player
-- joins and the team reaches this count. Vanilla has 9 (10v10); CBM lowers it to 7, which handed
-- 7v7 and 8v8 a second IP on top of B2TP's +5 / +10 Tres. Back to vanilla's 9.
kSecondInitialInfantryPortalMinPlayerCount = 9
