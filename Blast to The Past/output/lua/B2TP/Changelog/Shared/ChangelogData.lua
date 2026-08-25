-- The B2TP in-game changelog text.
--
-- MAINTENANCE: this is a hand-maintained copy of the change list in mod.settings, updated
-- deliberately as part of each release rather than read from that file at runtime. When you
-- change the Workshop description, mirror the change here too.
--
-- Deliberately drops the mod id line and the intro essay (winrate/hiveskill rationale): useful
-- on the Workshop page, not useful mid-game. Keeps every change and every inline justification.
--
-- Markup, matching kStyleToFontsMap in GUIB2TPChangelogWindow.lua:
--   ## line   -> section heading   (ALIENS / MARINES)
--   ### line  -> subsection heading (Lifeforms, Fade, Cysts, ...)
--   plain line, prefixed "  - "    -> a change
--
-- One double-quoted string per line, joined with table.concat, rather than a single [[ ]] long
-- string. NS2's own script preprocessor -- separate from the Lua compiler -- appears to scan for
-- "--" comment markers without tracking that it is inside a multi-line long string, so a literal
-- "--" anywhere in changelog prose (e.g. "Bio8 -- +8% swipe damage") corrupted a [[ ]] block and
-- produced "unfinished long string near '<eof>'" at runtime. Plain quoted strings are not
-- susceptible to that: NS2 ships hundreds of them containing "--" with no issue. Avoid
-- reintroducing a long-bracket string here.

local kChangelogLines =
{
    "A vanilla-flavored balance mod aimed at 6v6-8v8 play, the original size public NS2 servers ran at.",
    "",
    "## ALIENS",
    "",
    "### Lifeforms",
    "  - Lerk health 180 -> 170",
    "  - Lerk spike damage 10 -> 11",
    "  - Leap energy 45 -> 55",
    "  - Boneshield HP 1000 -> 600 (1000 was balanced for 10v10)",
    "  - Stomp energy 30 -> 45 (curbs stomp spam when the alien team has no adrenaline or a shift to sustain it)",
    "",
    "### Fade",
    "  - Advanced Swipe: new at Bio8, +8% swipe damage, 30 Tres, 90 second research",
    "  - Stab energy 30 -> 25",
    "  - Stab research 25 -> 20 Tres",
    "",
    "### Upgrades",
    "  - Skulk Vampirism 4.66% -> 3.77% per shell (compmod change). Vampirism also works on Exos now",
    "  - Aura no longer reveals health",
    "",
    "### Chamber hive passives",
    "  - Shells regenerate themselves out of combat with a Crag hive",
    "  - Veils cloak themselves out of combat with a Shade hive",
    "  - Spurs can be picked up and moved by the commander with a Shift hive",
    "",
    "### Cysts",
    "  - Build time 3.33 -> 6 seconds",
    "  - Shift hive build multiplier x1.25 -> x1.5 (compmod change, since vanilla cysting is broken in normal player counts)",
    "  - Flame damage split by source (compmod change): welders x5 -> x4, flamethrowers x5 -> x7",
    "  - Mature cyst health 400 -> 300",
    "  - Detection range 8m -> 10m",
    "  - Drifters ordered onto an unbuilt cyst now queue up the whole chain behind it, instead of one cyst at a time",
    "",
    "### Tunnels",
    "  - Gorges can drop tunnels for 5 Pres per end, but only into a room whose power node is down, or onto infestation. They come up fully mature and spread infestation immediately",
    "  - Relocating 6 -> 5 Tres",
    "  - Tunnel entrances are labelled Entry 1-4 and Exit 1-4 on the map",
    "",
    "### Hallucinations",
    "  - Biomass health removed, hallucinations no longer get tougher as biomass rises",
    "  - Can no longer use Umbra, Spores or Stomp",
    "",
    "## MARINES",
    "",
    "### Round start",
    "  - Marines start with 1 IP (vanilla!) but get +5 Tres on 7v7 and +10 Tres on 8v8, interpolating between 1IP for 6v6 and the effective +1IP for 10v10",
    "",
    "### Structures and units",
    "  - ARC health 2600/400 -> 2100/500, limited to 4",
    "  - MAC speed +15% out of combat",
    "  - MAC rollout speed 2 -> 5",
    "  - Sentry 5 -> 6 Tres",
    "  - Sentry Battery 10 -> 12 Tres",
    "",
    "### Drops",
    "  - Welder drop 3 -> 2 Tres",
    "  - Mine drop 7 -> 5 Tres",
    "  - Dropped weapon stay time 16 -> 20 seconds",
    "",
    "### Medpack Tech",
    "  - New Medtech #1 (Command Station + Armory): heal 30/20",
    "  - New Medtech #2 (Command Station + AA + Medtech #1): heal 40/10",
    "  - Meds scale as the round goes on, since vanilla meds fall behind in the end game",
    "",
    "### Weapons",
    "  - Weapon upgrade scaling 7.84% -> 10% per level, for all weapons including shotgun, FT and GL",
    "  - Shotgun falloff start 5m -> 7.5m",
    "  - Shotgun falloff end 15m -> 17.5m (where it does 50% damage)",
}

function GetB2TPChangelogText()
    return table.concat(kChangelogLines, "\n")
end
