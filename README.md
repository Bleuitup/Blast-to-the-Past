# Blast to the Past (B2TP)

A Natural Selection 2 balance mod for 6v6 to 8v8 games, the size public servers originally ran at.
Most of its changes either bring back values or mechanics that vanilla used years ago, or come from
ENSL CompMod. The goal is more room for skill while staying suited to a managed, coordinated public
server.

- **Steam Workshop:** [Blast to the Past, mod id 3426836832](https://steamcommunity.com/sharedfiles/filedetails/?id=3426836832)
- **Whitelisted:** yes
- **Developed for:** the NS2 Sudamerica community, [discord.gg/NS2-Sudamerica](https://discord.gg/NS2-Sudamerica)

## What it runs on

| Versions | Base game | Requires |
|---|---|---|
| **v2.0 and later** | Community Balance Mod (CBM), Core Edition | CBM **and** the CBM Core Edition Toggle, loaded alongside B2TP |
| v1.22 to v1.37 | Vanilla NS2, Build 344 | Nothing else |

Up to v1.37, B2TP was a set of changes on top of vanilla Build 344.

From v2.0, B2TP runs on top of CBM with the Core Toggle on, which turns off CBM's Content Edition
additions. CBM Core Edition is set to become the base game, so v2.0 moves B2TP onto what will be the
new vanilla. Everything CBM Core changes still applies, and B2TP's changes sit on top of it.

The version tags in this repository mark what was published to the Workshop: `v1.22` to `v1.37` are
the Build 344 versions, `v2.0` onwards the CBM ones.

## What it changes

The full list for the current version is in two places:

- the Workshop page, whose text is kept in [`docs/workshop-description.bbcode`](docs/workshop-description.bbcode)
- the in-game changelog (in English, Spanish and Brazilian Portuguese), from
  [`ChangelogData.lua`](<Blast to The Past/output/lua/B2TP/Changelog/Shared/ChangelogData.lua>)

In short, it touches:

- **Aliens:** skulk, lerk, fade (Advanced Swipe research), onos, Aura, support structure costs,
  cysts, and gorge-dropped tunnels
- **Marines:** round start (1 Infantry Portal, with extra team resources at 7v7 and 8v8), ARCs,
  Medpack Tech #1 and #2, shotgun upgrades and falloff, and how long dropped weapons stay

## Repository layout

```
Blast to The Past/
  mod.settings             Launchpad publish settings (Workshop id 3426836832)
  preview.jpg              Workshop preview image
  output/                  the mod as published
    lua/entry/B2TP.entry   ModLoader entry, Priority 28
    lua/B2TP/FileHooks.lua registers every hook
    lua/B2TP/<Piece>/...   one folder per piece of the mod
    ui/                    icon sheets, changelog icon and language flags
docs/
  workshop-description.bbcode
```

### How the hooks work

B2TP is a ModLoader mod. `FileHooks.lua` holds a list of pieces (`ARCs`, `MedpackTech`,
`PlayerCount`, and so on), and each piece has up to four folders named after the hook type:

```
lua/B2TP/<Piece>/{Halt,Pre,Post,Replace}/<game path>
```

The game file a hook targets is its path with `B2TP/<Piece>/<HookType>/` removed. For example,
`lua/B2TP/Costs/Post/Balance.lua` is a post hook on `lua/Balance.lua`. A hook on a file in a
subfolder repeats that path, as in `Fade Abilities/Post/Weapons/Alien/SwipeBlink.lua`.

When adding a piece, add its name to the `pieces` list in `FileHooks.lua` as well; folders that are
not listed are not loaded.

B2TP's entry priority (28) is lower than CBM's and the Core Toggle's (100). ModLoader runs higher
priorities first, so B2TP's post hooks run after CBM's and B2TP's values are the ones that stay.

## Publishing

The mod is published with Launchpad from a local folder, not from a git checkout. After a publish,
the published files are compared with the repository and the release is tagged (`v2.00d` and so on).

## Credits

**Author:** Bleu

Several changes here are ported or adapted from ENSL CompMod / CBM, with permission from their
respective authors.

## License

[MIT](LICENSE)
