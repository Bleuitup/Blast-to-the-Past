-- Take the next free killfeed icon number instead of hardcoding one. Vanilla's list ends at 51
-- (HeavyMachineGun), so this is 52 today. Where the icon is drawn from is pinned separately in
-- DeathMessage_Client.lua, so this number is free to move.
debug.appendtoenum(kDeathMessageIcon, "AdvancedSwipe")
