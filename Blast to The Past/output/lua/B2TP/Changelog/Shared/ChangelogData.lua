-- The B2TP in-game changelog text.
--
-- MAINTENANCE: this is a hand-maintained copy of the change list in mod.settings, updated
-- deliberately as part of each release rather than read from that file at runtime. When you
-- change the Workshop description, mirror the change here too. The Workshop description uses
-- terse "X -> Y" notation, which reads fine as a quick-reference list on the Steam page; this
-- popup instead writes each change as a full sentence (CBM's balance changelog convention),
-- which reads better in a scrollable in-game window. Translate, don't copy verbatim.
--
-- The two texts are also organised differently on the alien side: mod.settings groups by
-- category (Lifeforms / Fade / Upgrades / ...), this groups alien changes by lifeform (Skulk /
-- Gorge / Lerk / Fade / Onos), since that's the more useful lookup when a player wants to know
-- "what changed about the thing I'm about to play."
--
-- Markup, matching kStyleToFontsMap in GUIB2TPChangelogWindow.lua. Heading markers only count
-- when LEADING the line (see SplitHeadingLevel in GUIB2TPChangelogWindow.lua) -- a '#' anywhere
-- else, such as in "Medtech #1", is just a character:
--   ## line   -> section heading   (ALIENS / MARINES)
--   ### line  -> subsection heading (Skulk, Gorge, Lerk, Fade, Onos, ...)
--   plain line, prefixed "  - "    -> a change
--
-- One double-quoted string per line, joined with table.concat, rather than a single [[ ]] long
-- string. NS2's own script preprocessor -- separate from the Lua compiler -- appears to scan for
-- "--" comment markers without tracking that it is inside a multi-line long string, so a literal
-- "--" anywhere in changelog prose corrupted a [[ ]] block and produced "unfinished long string
-- near '<eof>'" at runtime. Plain quoted strings are not susceptible to that: NS2 ships hundreds
-- of them containing "--" with no issue. Avoid reintroducing a long-bracket string here.

local kChangelogLines =
{
    "A vanilla-flavored balance mod aimed at 6v6-8v8 play, the original size public NS2 servers ran at.",
    "",
    "## ALIENS",
    "",
    "### Skulk",
    "  - Leap energy cost increased from 45 to 55.",
    "  - Vampirism reduced from 4.66% to 3.77% per shell (compmod change). Vampirism now also works on Exos.",
    "",
    "### Gorge",
    "  - Gorges can now drop tunnels themselves for 5 Pres per end (compmod change), but only into a room whose power node is down, or onto infestation. This keeps tunnels out of a powered marine base, or right next to one. Gorge-dropped tunnels come up fully mature and spread infestation immediately.",
    "",
    "### Lerk",
    "  - Lerk health reduced from 180 to 170.",
    "  - Lerk spike damage increased from 10 to 11.",
    "",
    "### Fade",
    "  - New Advanced Swipe upgrade at Biomass 8: +8% swipe damage, costs 30 Tres, 90 second research. Exists to give Armor 3 a reason to exist: without it, a Fade's plain Swipe already three-hit-kills an Armor 2 marine, so the extra armor point barely mattered.",
    "  - Stab energy cost reduced from 30 to 25.",
    "  - Stab research cost reduced from 25 to 20 Tres.",
    "",
    "### Onos",
    "  - Boneshield HP reduced from 1000 to 600 (1000 was balanced for 10v10).",
    "  - Stomp energy cost increased from 30 to 45, to curb stomp spam when the alien team has no adrenaline or a shift to sustain it.",
    "",
    "### Upgrades",
    "  - Aura no longer reveals enemy health.",
    "",
    "### Chamber hive passives",
    "  - Shells regenerate themselves out of combat with a Crag hive.",
    "  - Veils cloak themselves out of combat with a Shade hive.",
    "  - Spurs can be picked up and moved by the commander with a Shift hive.",
    "",
    "### Cysts",
    "  - Cyst build time increased from 3.33 to 6 seconds.",
    "  - Shift hive cyst build multiplier increased from x1.25 to x1.5 (compmod change, since vanilla cysting is broken at normal player counts).",
    "  - Cyst flame damage now split by source (compmod change): welders deal x4, down from x5, and flamethrowers deal x7, up from x5.",
    "  - Mature cyst health reduced from 400 to 300.",
    "  - Cyst detection range increased from 8m to 10m.",
    "  - Drifters ordered onto an unbuilt cyst now queue up the whole chain behind it, instead of one cyst at a time.",
    "",
    "### Tunnels",
    "  - Commander-dropped tunnel entrances and exits are unchanged.",
    "  - Tunnel relocate cost reduced from 6 to 5 Tres.",
    "  - Tunnel entrances are now labelled Entry 1-4 and Exit 1-4 on the map.",
    "",
    "### Hallucinations",
    "  - Hallucinations no longer gain health as biomass rises.",
    "  - Hallucinations can no longer use Umbra, Spores or Stomp.",
    "",
    "## MARINES",
    "",
    "### Round start",
    "  - Marines start with 1 IP, same as vanilla, but now get +5 Tres on 7v7 and +10 Tres on 8v8 to compensate. This interpolates between 1 IP for 6v6 and the effective +1 IP for 10v10.",
    "",
    "### Structures and units",
    "  - ARC health and armor changed from 2600/400 to 2100/500, and ARCs are limited to 4.",
    "  - MACs now move 15% faster while out of combat.",
    "  - MAC rollout speed from the Robotics Factory increased from 2 to 5.",
    "  - Sentry cost increased from 5 to 6 Tres.",
    "  - Sentry Battery cost increased from 10 to 12 Tres.",
    "",
    "### Drops",
    "  - Welder drop cost reduced from 3 to 2 Tres.",
    "  - Mine drop cost reduced from 7 to 5 Tres.",
    "  - Dropped weapons now stay on the ground for 20 seconds, up from 16.",
    "",
    "### Medpack Tech",
    "  - Ported from ENSL CompMod seasons 13 and 14.",
    "  - New Medtech #1 upgrade (Command Station + Armory): medpacks heal 30 instantly and 20 over time.",
    "  - New Medtech #2 upgrade (Command Station + Advanced Armory + Medtech #1): medpacks heal 40 instantly and 10 over time.",
    "  - Medpacks scale as the round goes on, since vanilla meds fall behind in the end game.",
    "",
    "### Weapons",
    "  - Weapon upgrade scaling increased from 7.84% to 10% per level, for all weapons including shotgun, flamethrower and grenade launcher.",
    "  - Shotgun damage falloff now starts at 7.5m, up from 5m.",
    "  - Shotgun damage falloff now ends at 17.5m, up from 15m, where it does 50% damage.",
}

function GetB2TPChangelogText()
    return table.concat(kChangelogLines, "\n")
end
