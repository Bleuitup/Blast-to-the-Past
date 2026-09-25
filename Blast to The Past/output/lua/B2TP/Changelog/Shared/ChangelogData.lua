-- The B2TP in-game changelog text, in English, Portuguese and Spanish.
--
-- MAINTENANCE: this is a hand-maintained copy of the change list in mod.settings, updated
-- deliberately as part of each release rather than read from that file at runtime. When you
-- change the Workshop description, mirror the change here too, IN ALL THREE LANGUAGES. The
-- Workshop description uses terse "X -> Y" notation, which reads fine as a quick-reference list
-- on the Steam page; this popup instead writes each change as a full sentence (CBM's balance
-- changelog convention), which reads better in a scrollable in-game window. Translate, don't
-- copy verbatim.
--
-- The three language tables must stay line-for-line parallel: same sections in the same order,
-- same number of entries. Nothing enforces that at runtime, so it is on whoever edits them.
--
-- WHAT GETS TRANSLATED, and what does not:
--   Translated: infestation, tunnels, mines, and all ordinary prose.
--   Left in English: lifeform names (Skulk, Gorge, Lerk, Fade, Onos), structure and chamber names
--   (Crag, Shade, Shift, Hive, Veil, Shell, Spur, Cyst, chamber, ARC, MAC, Sentry, Armory), ability
--   and upgrade names (Leap, Stab, Stomp, Swipe, Vampirism, Aura, Umbra, Spores, Boneshield,
--   Medtech), the resource shorthands (Tres, Pres), and the literal in-game map labels
--   Entry 1-4 / Exit 1-4. Those are what Spanish and Portuguese speaking NS2 players actually say
--   in game and on voice, so translating them would make the text harder to use, not easier.
--
-- Note the Medpack Tech section: the closing sentence about medpacks scaling through the round is
-- NOT a bullet. It is a conclusion drawn from the two Medtech entries above it, so it is written
-- as a plain trailing line rather than as a change of its own. Keep it that way in all three.
--
-- Markup, matching kStyleToFontsMap in GUIB2TPChangelogWindow.lua. Heading markers only count
-- when LEADING the line (see SplitHeadingLevel in GUIB2TPChangelogWindow.lua) -- a '#' anywhere
-- else, such as in "Medtech #1", is just a character:
--   # line    -> section heading    (ALIENS / MARINES / CREDITS), largest, highlight colour
--   ## line   -> subsection heading (Skulk, Gorge, Lerk, Fade, Onos, ...)
--   plain line, prefixed "  - "     -> a change
--   plain line, no prefix           -> body prose (section intro or conclusion)
--
-- One double-quoted string per line, joined with table.concat, rather than a single [[ ]] long
-- string. NS2's own script preprocessor -- separate from the Lua compiler -- appears to scan for
-- "--" comment markers without tracking that it is inside a multi-line long string, so a literal
-- "--" anywhere in changelog prose corrupted a [[ ]] block and produced "unfinished long string
-- near '<eof>'" at runtime. Plain quoted strings are not susceptible to that: NS2 ships hundreds
-- of them containing "--" with no issue. Avoid reintroducing a long-bracket string here.
--
-- This file is saved as UTF-8. The accented characters in the Portuguese and Spanish tables rely
-- on that; NS2 ships official ptBR and esES localisations, so the menu fonts cover them.

local kChangelogs = {}

kChangelogs.en =
{
    "Blast to the Past, built on top of the Community Balance Mod with the CBM Core Toggle on. Everything CBM changes still applies; this list is only what B2TP changes on top of it.",
    "The aim is unchanged: tune NS2 for 6v6-8v8, the original size public servers ran at. Most changes either return values or mechanics to what vanilla used to run years ago, or come from ENSL CompMod, to improve skill expression while staying suited to a managed, coordinated public server.",
    "",
    "# ALIENS",
    "",
    "## Skulk",
    "  - Leap energy cost increased from 45 to 55 (CompMod value).",
    "  - Vampirism reduced from 4.66% to 3.77% per shell (CompMod value). Vampirism now also works on Exos.",
    "",
    "## Gorge",
    "  - Gorges can now drop tunnels themselves for 5 Pres per entrance, adapted from CompMod (whose own cost is 4), but only into a room with no working power node (unbuilt, destroyed or damaged), or onto infestation. This keeps Gorge tunnels out of a powered marine base, or right next to one. Tunnels dropped by Gorges come up fully mature and spread infestation immediately.",
    "",
    "## Lerk",
    "  - Lerk health reduced from 180 to 170 (CompMod value).",
    "  - Lerk spike damage increased from 5 to 5.5, interpolated from CompMod's own value of 6.",
    "",
    "## Fade",
    "  - New Advanced Swipe upgrade at Biomass 8: +8% swipe damage, which is CompMod's own damage scalar exactly. Costs 30 Tres with 90 second research, tuned for B2TP from CompMod's own 25 Tres and 60 seconds. This will kill a marine on armor 2 in three swipes. Countered by armor 3.",
    "",
    "## Onos",
    "  - Boneshield HP reduced from 1000 to 600 (1000 was balanced for 10v10). CBM's Boneshield regeneration and damage reduction still apply.",
    "  - Stomp energy cost increased from 30 to 45, to curb stomp spam when the alien team has no adrenaline or a shift to sustain it.",
    "",
    "## Upgrades",
    "  - Aura no longer reveals enemy health: Aura icons are always plain white, so their color says nothing about how hurt an enemy is.",
    "",
    "## Structures",
    "  - Crag, Shift, Shade and Whip all cost 10 Tres.",
    "",
    "## Cysts",
    "  - Cyst build time increased from 3.33 to 6 seconds (CompMod value).",
    "  - Shift hive cyst build multiplier increased from x1.25 to x1.5 (CompMod value), since vanilla cysting is broken at normal player counts.",
    "  - Cyst flame damage now split by source (CompMod value): welders deal x4, down from x5, and flamethrowers deal x7, up from x5.",
    "  - Cyst detection range increased from 8m to 10m (CompMod value).",
    "",
    "## Tunnels",
    "  - Tunnel relocate cost reduced from 6 to 5 Tres (CompMod value).",
    "  - Tunnel entrances now show on the map as Entry 1-4 and Exit 1-4.",
    "",
    "# MARINES",
    "",
    "## Round start",
    "  - Marines start with 1 IP, same as vanilla and CBM, but now get +5 Tres on 7v7 and +10 Tres on 8v8 to compensate. This interpolates between 1 IP for 6v6 and the effective +1 IP for 10v10.",
    "",
    "## ARCs",
    "  - ARC health reduced from 2600 to 2100, interpolated from CompMod's own value of 1800.",
    "  - ARC armor increased from 400 to 500 (CompMod value), and ARCs are limited to 4 (CompMod value).",
    "",
    "## Medpack Tech",
    "  - Ported from ENSL CompMod seasons 13 and 14.",
    "  - New Medtech #1 upgrade (Command Station + Armory): medpacks heal 30 instantly and 20 over time.",
    "  - New Medtech #2 upgrade (Command Station + Advanced Armory + Medtech #1): medpacks heal 40 instantly and 10 over time.",
    "Medpacks scale as the round goes on, since vanilla meds fall behind in the end game.",
    "",
    "## Weapons",
    "  - Shotgun weapon upgrades increased from 7.84% to 10% per level against players, and from 15.68% to 20% against structures, the same as every other weapon.",
    "  - Shotgun damage falloff now starts at 7.5m, up from 5m.",
    "  - Shotgun damage falloff now ends at 17.5m, up from 15m.",
    "  - This is half of the CompMod change, which moves falloff to 10m and 20m. The 50% damage floor past the falloff end range is unchanged vanilla and CompMod behavior; only where the falloff starts and ends has moved.",
    "  - Dropped weapons now stay on the ground for 20 seconds, instead of 16.",
    "",
    "# CREDITS",
    "",
    "Author: Bleu",
    "",
    "Developed for the NS2 Sudamerica community. Join us at discord.gg/NS2-Sudamerica",
    "",
    "Several changes here are ported or adapted from ENSL CompMod / CBM, with permission from their respective authors.",
}

kChangelogs.pt =
{
    "Blast to the Past, construído sobre o Community Balance Mod com o CBM Core Toggle ativado. Tudo o que o CBM muda continua valendo; esta lista traz apenas o que o B2TP muda por cima dele.",
    "O objetivo continua o mesmo: ajustar o NS2 para 6v6-8v8, o tamanho original em que rodavam os servidores públicos. A maioria das mudanças devolve valores ou mecânicas ao que o vanilla usava anos atrás, ou vem do ENSL CompMod, para melhorar a expressão de habilidade sem deixar de servir para um servidor público organizado e coordenado.",
    "",
    "# ALIENS",
    "",
    "## Skulk",
    "  - Custo de energia do Leap aumentado de 45 para 55 (valor do CompMod).",
    "  - Vampirism reduzido de 4,66% para 3,77% por shell (valor do CompMod). O Vampirism agora também funciona em Exos.",
    "",
    "## Gorge",
    "  - Os Gorges agora podem colocar túneis por conta própria por 5 Pres cada entrada, adaptado do CompMod (cujo custo é 4), mas apenas em salas sem um power node funcionando (não construído, destruído ou danificado), ou sobre infestação. Isso mantém os túneis de Gorge fora de uma base marine com energia, ou logo ao lado dela. Os túneis colocados por Gorges já nascem maduros e espalham infestação imediatamente.",
    "",
    "## Lerk",
    "  - Vida do Lerk reduzida de 180 para 170 (valor do CompMod).",
    "  - Dano dos spikes do Lerk aumentado de 5 para 5,5, interpolado a partir do valor 6 do CompMod.",
    "",
    "## Fade",
    "  - Nova melhoria Advanced Swipe na Biomass 8: +8% de dano de swipe, exatamente o mesmo multiplicador do CompMod. Custa 30 Tres com 90 segundos de pesquisa, ajustado para o B2TP a partir dos 25 Tres e 60 segundos do CompMod. Isso mata um marine com armor 2 em três swipes. Contornado por armor 3.",
    "",
    "## Onos",
    "  - HP de Boneshield reduzido de 1000 para 600 (1000 era balanceado para 10v10). A regeneração e a redução de dano do Boneshield do CBM continuam valendo.",
    "  - Custo de energia de Stomp aumentado de 30 para 45, para conter o spam de stomp quando o time alien não tem adrenaline nem um shift para sustentá-lo.",
    "",
    "## Melhorias",
    "  - Aura não revela mais a vida dos inimigos: os ícones da Aura são sempre brancos, então a cor não diz nada sobre o quanto o inimigo está ferido.",
    "",
    "## Estruturas",
    "  - Crag, Shift, Shade e Whip custam todos 10 Tres.",
    "",
    "## Cysts",
    "  - Tempo de construção do cyst aumentado de 3,33 para 6 segundos (valor do CompMod).",
    "  - Multiplicador de construção de cyst com Shift hive aumentado de x1,25 para x1,5 (valor do CompMod), já que o sistema de cysts do vanilla é quebrado em contagens normais de jogadores.",
    "  - O dano de fogo nos cysts agora é separado por fonte (valor do CompMod): os welders causam x4, antes x5, e os flamethrowers causam x7, antes x5.",
    "  - Alcance de detecção do cyst aumentado de 8m para 10m (valor do CompMod).",
    "",
    "## Túneis",
    "  - Custo de realocar túnel reduzido de 6 para 5 Tres (valor do CompMod).",
    "  - As entradas de túnel agora aparecem no mapa como Entry 1-4 e Exit 1-4.",
    "",
    "# MARINES",
    "",
    "## Início de round",
    "  - Os marines começam com 1 IP, igual ao vanilla e ao CBM, mas agora recebem +5 Tres no 7v7 e +10 Tres no 8v8 para compensar. Isso interpola entre 1 IP para 6v6 e o efetivo +1 IP do 10v10.",
    "",
    "## ARCs",
    "  - Vida do ARC reduzida de 2600 para 2100, interpolada a partir do valor 1800 do CompMod.",
    "  - Armor do ARC aumentado de 400 para 500 (valor do CompMod), e os ARCs são limitados a 4 (valor do CompMod).",
    "",
    "## Tecnologia de Medpacks",
    "  - Portado das temporadas 13 e 14 do ENSL CompMod.",
    "  - Nova melhoria Medtech #1 (Command Station + Armory): os medpacks curam 30 na hora e 20 ao longo do tempo.",
    "  - Nova melhoria Medtech #2 (Command Station + Advanced Armory + Medtech #1): os medpacks curam 40 na hora e 10 ao longo do tempo.",
    "Os medpacks escalam conforme a partida avança, já que os meds do vanilla ficam para trás no fim de jogo.",
    "",
    "## Armas",
    "  - Melhorias de arma da shotgun aumentadas de 7,84% para 10% por nível contra jogadores, e de 15,68% para 20% contra estruturas, igual a todas as outras armas.",
    "  - A queda de dano da shotgun agora começa em 7,5m, antes 5m.",
    "  - A queda de dano da shotgun agora termina em 17,5m, antes 15m.",
    "  - Isso é metade da mudança do CompMod, que move a queda para 10m e 20m. O piso de 50% de dano além do fim do alcance de queda continua igual ao vanilla e ao CompMod; apenas onde a queda começa e termina foi alterado.",
    "  - As armas dropadas agora ficam no chão por 20 segundos, em vez de 16.",
    "",
    "# CRÉDITOS",
    "",
    "Autor: Bleu",
    "",
    "Desenvolvido para a comunidade NS2 Sudamerica. Entre com a gente em discord.gg/NS2-Sudamerica",
    "",
    "Várias mudanças aqui são portadas ou adaptadas do ENSL CompMod / CBM, com permissão de seus respectivos autores.",
}

kChangelogs.es =
{
    "Blast to the Past, construido sobre el Community Balance Mod con el CBM Core Toggle activado. Todo lo que cambia CBM sigue aplicando; esta lista es solo lo que B2TP cambia por encima.",
    "El objetivo sigue siendo el mismo: ajustar NS2 para 6v6-8v8, el tamaño original con el que funcionaban los servidores públicos. La mayoría de los cambios devuelven valores o mecánicas a lo que el vanilla usaba años atrás, o vienen de ENSL CompMod, para mejorar la expresión de habilidad sin dejar de servir para un servidor público organizado y coordinado.",
    "",
    "# ALIENS",
    "",
    "## Skulk",
    "  - Costo de energía del Leap aumentado de 45 a 55 (valor de CompMod).",
    "  - Vampirism reducido de 4,66% a 3,77% por shell (valor de CompMod). El Vampirism ahora también funciona en Exos.",
    "",
    "## Gorge",
    "  - Los Gorges ahora pueden poner túneles por su cuenta por 5 Pres cada entrada, adaptado de CompMod (cuyo costo es 4), pero solo en cuartos sin un power node funcionando (sin construir, destruido o dañado), o sobre infestación. Esto mantiene los túneles de Gorge fuera de una base marine con energía, o justo al lado de ella. Los túneles puestos por Gorges nacen ya maduros y esparcen infestación de inmediato.",
    "",
    "## Lerk",
    "  - Vida del Lerk reducida de 180 a 170 (valor de CompMod).",
    "  - Daño de los spikes del Lerk aumentado de 5 a 5,5, interpolado a partir del valor 6 de CompMod.",
    "",
    "## Fade",
    "  - Nueva mejora Advanced Swipe en Biomass 8: +8% de daño de swipe, exactamente el mismo multiplicador de CompMod. Cuesta 30 Tres con 90 segundos de investigación, ajustado para B2TP desde los 25 Tres y 60 segundos de CompMod. Esto mata a un marine con armor 2 en tres swipes. Contrarrestado por armor 3.",
    "",
    "## Onos",
    "  - HP de Boneshield reducido de 1000 a 600 (1000 estaba balanceado para 10v10). La regeneración y la reducción de daño del Boneshield de CBM siguen aplicando.",
    "  - Costo de energía de Stomp aumentado de 30 a 45, para frenar el spam de stomp cuando el equipo alien no tiene adrenaline ni un shift para sostenerlo.",
    "",
    "## Mejoras",
    "  - Aura ya no revela la vida de los enemigos: los íconos de Aura son siempre blancos, así que su color no dice nada sobre cuán herido está un enemigo.",
    "",
    "## Estructuras",
    "  - Crag, Shift, Shade y Whip cuestan todos 10 Tres.",
    "",
    "## Cysts",
    "  - Tiempo de construcción del cyst aumentado de 3,33 a 6 segundos (valor de CompMod).",
    "  - Multiplicador de construcción de cyst con Shift hive aumentado de x1,25 a x1,5 (valor de CompMod), ya que el sistema de cysts del vanilla está roto en cantidades normales de jugadores.",
    "  - El daño de fuego a los cysts ahora se separa por fuente (valor de CompMod): los welders hacen x4, antes x5, y los flamethrowers hacen x7, antes x5.",
    "  - Rango de detección del cyst aumentado de 8m a 10m (valor de CompMod).",
    "",
    "## Túneles",
    "  - Costo de reubicar túnel reducido de 6 a 5 Tres (valor de CompMod).",
    "  - Las entradas de túnel ahora aparecen en el mapa como Entry 1-4 y Exit 1-4.",
    "",
    "# MARINES",
    "",
    "## Inicio de ronda",
    "  - Los marines empiezan con 1 IP, igual que en vanilla y CBM, pero ahora reciben +5 Tres en 7v7 y +10 Tres en 8v8 para compensar. Esto interpola entre 1 IP para 6v6 y el efectivo +1 IP del 10v10.",
    "",
    "## ARCs",
    "  - Vida del ARC reducida de 2600 a 2100, interpolada a partir del valor 1800 de CompMod.",
    "  - Armor del ARC aumentado de 400 a 500 (valor de CompMod), y los ARCs están limitados a 4 (valor de CompMod).",
    "",
    "## Tecnología de Medpacks",
    "  - Portado de las temporadas 13 y 14 de ENSL CompMod.",
    "  - Nueva mejora Medtech #1 (Command Station + Armory): los medpacks curan 30 al instante y 20 a lo largo del tiempo.",
    "  - Nueva mejora Medtech #2 (Command Station + Advanced Armory + Medtech #1): los medpacks curan 40 al instante y 10 a lo largo del tiempo.",
    "Los medpacks escalan a medida que avanza la partida, ya que los meds del vanilla se quedan cortos en el juego tardío.",
    "",
    "## Armas",
    "  - Mejoras de arma de la shotgun aumentadas de 7,84% a 10% por nivel contra jugadores, y de 15,68% a 20% contra estructuras, igual que todas las demás armas.",
    "  - La caída de daño de la shotgun ahora empieza en 7,5m, antes 5m.",
    "  - La caída de daño de la shotgun ahora termina en 17,5m, antes 15m.",
    "  - Esto es la mitad del cambio de CompMod, que mueve la caída a 10m y 20m. El piso de 50% de daño más allá del fin del rango de caída sigue igual que en vanilla y CompMod; solo se movió dónde empieza y termina la caída.",
    "  - Las armas dropeadas ahora quedan en el piso 20 segundos, en vez de 16.",
    "",
    "# CRÉDITOS",
    "",
    "Autor: Bleu",
    "",
    "Desarrollado para la comunidad NS2 Sudamerica. Sumate en discord.gg/NS2-Sudamerica",
    "",
    "Varios cambios acá son portados o adaptados de ENSL CompMod / CBM, con permiso de sus respectivos autores.",
}

kB2TPChangelogLanguages = { "en", "pt", "es" }

-- NS2's own language setting, as chosen in Options. Only the two locales we actually have
-- translations for are mapped; everything else (including all the locales NS2 supports that we
-- do not translate) falls through to English.
local kLocaleToLanguage =
{
    ptBR = "pt",
    esES = "es",
}

function GetB2TPDefaultChangelogLanguage()

    if not Client then return "en" end

    local locale = Client.GetOptionString("locale", "enUS")
    return kLocaleToLanguage[locale] or "en"

end

function GetB2TPChangelogText(language)
    return table.concat(kChangelogs[language] or kChangelogs.en, "\n")
end
