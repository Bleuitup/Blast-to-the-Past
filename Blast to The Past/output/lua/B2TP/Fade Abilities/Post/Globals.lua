-- Take the next free killfeed icon number instead of hardcoding one. CBM's list ends at 54
-- (Submachinegun 52, ScanGrenade 53, BabblerBombAbility 54), so this is 55 today. The old
-- hardcoded 53 collided with CBM's ScanGrenade. Where the icon is drawn from is pinned
-- separately in DeathMessage_Client.lua, so this number is free to move.
debug.appendtoenum(kDeathMessageIcon, "AdvancedSwipe")
