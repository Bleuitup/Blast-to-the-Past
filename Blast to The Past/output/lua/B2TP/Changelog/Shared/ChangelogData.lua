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
    "A vanilla-flavored balance mod for 6v6-8v8 play, the original size public NS2 servers ran at. Most changes either tweak some values or mechanics to what vanilla used to run years ago, or incorporate changes from CompMod or good ideas from CBM, with the goal of improving skill expression while still remaining valuable for a managed, coordinated public server experience.",
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
    "  - Stab energy cost reduced from 30 to 25.",
    "  - Stab research cost reduced from 25 to 20 Tres.",
    "",
    "## Onos",
    "  - Boneshield HP reduced from 1000 to 600 (1000 was balanced for 10v10).",
    "  - Stomp energy cost increased from 30 to 45, to curb stomp spam when the alien team has no adrenaline or a shift to sustain it.",
    "  - Stomp (CBM change) now slows marines caught in it instead of knocking them down. Same slow as being webbed, tapering off over 5 seconds.",
    "",
    "## Upgrades",
    "  - Aura no longer reveals enemy health.",
    "",
    "## Chamber hive passives",
    "Inspired by the CBM changes, but conditioned to be available only while the matching Hive is still alive.",
    "  - Shells regenerate themselves out of combat as long as the aliens have a Crag hive.",
    "  - Veils cloak themselves out of combat as long as the aliens have a Shade hive.",
    "  - Spurs can be picked up and moved by the commander as long as the aliens have a Shift hive.",
    "",
    "## Cysts",
    "  - Cyst build time increased from 3.33 to 6 seconds (CompMod value).",
    "  - Shift hive cyst build multiplier increased from x1.25 to x1.5 (CompMod value), since vanilla cysting is broken at normal player counts.",
    "  - Cyst flame damage now split by source (CompMod value): welders deal x4, down from x5, and flamethrowers deal x7, up from x5.",
    "  - Mature cyst health reduced from 400 to 300.",
    "  - Cyst detection range increased from 8m to 10m (CompMod value).",
    "  - Drifters ordered onto an unbuilt cyst now queue up the whole chain behind it, instead of one cyst at a time.",
    "",
    "## Tunnels",
    "  - Tunnel entrances and exits dropped by the commander are unchanged.",
    "  - Tunnel relocate cost reduced from 6 to 5 Tres (CompMod value).",
    "  - Tunnel entrances now show on the map as Entry 1-4 and Exit 1-4.",
    "",
    "## Hallucinations",
    "  - Hallucinations no longer gain health as biomass rises (CompMod change).",
    "  - Hallucinated Lerks can no longer use Umbra or Spores (CompMod change).",
    "  - Hallucinated Onos can no longer Stomp (B2TP's own extension of the same idea).",
    "",
    "# MARINES",
    "",
    "## Round start",
    "  - Marines start with 1 IP, same as vanilla, but now get +5 Tres on 7v7 and +10 Tres on 8v8 to compensate. This interpolates between 1 IP for 6v6 and the effective +1 IP for 10v10.",
    "",
    "## Structures and units",
    "  - ARC health reduced from 2600 to 2100, interpolated from CompMod's own value of 1800.",
    "  - ARC armor increased from 400 to 500 (CompMod value), and ARCs are limited to 4 (CompMod value).",
    "  - MACs now move 15% faster while out of combat (CompMod value).",
    "  - MAC rollout speed from the Robotics Factory increased from 2 to 5 (CBM fix).",
    "  - Sentry cost increased from 5 to 6 Tres (CompMod value).",
    "  - Sentry Battery cost increased from 10 to 12 Tres (CompMod value).",
    "",
    "## Drops",
    "  - Welder drop cost reduced from 3 to 2 Tres.",
    "  - Mine drop cost reduced from 7 to 5 Tres.",
    "  - Dropped weapons now stay on the ground for 20 seconds, instead of 16.",
    "",
    "## Medpack Tech",
    "  - Ported from ENSL CompMod seasons 13 and 14.",
    "  - New Medtech #1 upgrade (Command Station + Armory): medpacks heal 30 instantly and 20 over time.",
    "  - New Medtech #2 upgrade (Command Station + Advanced Armory + Medtech #1): medpacks heal 40 instantly and 10 over time.",
    "Medpacks scale as the round goes on, since vanilla meds fall behind in the end game.",
    "",
    "## Weapons",
    "  - Weapon upgrade scaling increased from 7.84% to 10% per level, for all weapons including shotgun, flamethrower and grenade launcher.",
    "  - Shotgun damage falloff now starts at 7.5m, up from 5m.",
    "  - Shotgun damage falloff now ends at 17.5m, up from 15m.",
    "  - This is half of the CompMod change, which moves falloff to 10m and 20m. The 50% damage floor past the falloff end range is unchanged vanilla and CompMod behavior; only where the falloff starts and ends has moved.",
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
    "Um mod de balanceamento similar ao vanilla NS2 para partidas 6v6-8v8, o tamanho original em que rodavam os servidores públicos de NS2. A maioria das mudanças ajusta valores ou mecânicas de volta ao que o vanilla usava anos atrás, ou incorpora mudanças do CompMod e boas ideias do CBM, com o objetivo de melhorar a expressão de habilidade sem deixar de servir para uma experiência de servidor público organizada e coordenada.",
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
    "  - Custo de energia de Stab reduzido de 30 para 25.",
    "  - Custo de pesquisa de Stab reduzido de 25 para 20 Tres.",
    "",
    "## Onos",
    "  - HP de Boneshield reduzido de 1000 para 600 (1000 era balanceado para 10v10).",
    "  - Custo de energia de Stomp aumentado de 30 para 45, para conter o spam de stomp quando o time alien não tem adrenaline nem um shift para sustentá-lo.",
    "  - O Stomp (mudança do CBM) agora deixa lentos os marines atingidos em vez de derrubá-los. A mesma lentidão de estar preso na web, diminuindo ao longo de 5 segundos.",
    "",
    "## Melhorias",
    "  - Aura não revela mais a vida dos inimigos.",
    "",
    "## Passivas de chambers por hive",
    "Inspiradas nas mudanças do CBM, mas condicionadas a só estarem disponíveis enquanto a Hive correspondente continuar viva.",
    "  - As Shells se regeneram fora de combate enquanto os aliens tiverem uma Crag hive.",
    "  - Os Veils ficam camuflados fora de combate enquanto os aliens tiverem uma Shade hive.",
    "  - As Spurs podem ser pegas e movidas pelo comandante enquanto os aliens tiverem uma Shift hive.",
    "",
    "## Cysts",
    "  - Tempo de construção do cyst aumentado de 3,33 para 6 segundos (valor do CompMod).",
    "  - Multiplicador de construção de cyst com Shift hive aumentado de x1,25 para x1,5 (valor do CompMod), já que o sistema de cysts do vanilla é quebrado em contagens normais de jogadores.",
    "  - O dano de fogo nos cysts agora é separado por fonte (valor do CompMod): os welders causam x4, antes x5, e os flamethrowers causam x7, antes x5.",
    "  - Vida do cyst maduro reduzida de 400 para 300.",
    "  - Alcance de detecção do cyst aumentado de 8m para 10m (valor do CompMod).",
    "  - Os Drifters enviados a um cyst não construído agora enfileiram toda a cadeia atrás dele, em vez de um cyst por vez.",
    "",
    "## Túneis",
    "  - As entradas e saídas de túnel colocadas pelo comandante não mudaram.",
    "  - Custo de realocar túnel reduzido de 6 para 5 Tres (valor do CompMod).",
    "  - As entradas de túnel agora aparecem no mapa como Entry 1-4 e Exit 1-4.",
    "",
    "## Alucinações",
    "  - As alucinações não ganham mais vida conforme a biomass sobe (mudança do CompMod).",
    "  - Os Lerks alucinados não podem mais usar Umbra nem Spores (mudança do CompMod).",
    "  - Os Onos alucinados não podem mais usar Stomp (extensão própria do B2TP para a mesma ideia).",
    "",
    "# MARINES",
    "",
    "## Início de round",
    "  - Os marines começam com 1 IP, igual ao vanilla, mas agora recebem +5 Tres no 7v7 e +10 Tres no 8v8 para compensar. Isso interpola entre 1 IP para 6v6 e o efetivo +1 IP do 10v10.",
    "",
    "## Estruturas e unidades",
    "  - Vida do ARC reduzida de 2600 para 2100, interpolada a partir do valor 1800 do CompMod.",
    "  - Armor do ARC aumentado de 400 para 500 (valor do CompMod), e os ARCs são limitados a 4 (valor do CompMod).",
    "  - Os MACs agora se movem 15% mais rápido fora de combate (valor do CompMod).",
    "  - Velocidade de saída do MAC da Robotics Factory aumentada de 2 para 5 (correção do CBM).",
    "  - Custo da Sentry aumentado de 5 para 6 Tres (valor do CompMod).",
    "  - Custo da Sentry Battery aumentado de 10 para 12 Tres (valor do CompMod).",
    "",
    "## Drops",
    "  - Custo de dropar welder reduzido de 3 para 2 Tres.",
    "  - Custo de dropar minas reduzido de 7 para 5 Tres.",
    "  - As armas dropadas agora ficam no chão por 20 segundos, em vez de 16.",
    "",
    "## Tecnologia de Medpacks",
    "  - Portado das temporadas 13 e 14 do ENSL CompMod.",
    "  - Nova melhoria Medtech #1 (Command Station + Armory): os medpacks curam 30 na hora e 20 ao longo do tempo.",
    "  - Nova melhoria Medtech #2 (Command Station + Advanced Armory + Medtech #1): os medpacks curam 40 na hora e 10 ao longo do tempo.",
    "Os medpacks escalam conforme a partida avança, já que os meds do vanilla ficam para trás no fim de jogo.",
    "",
    "## Armas",
    "  - Escalonamento das melhorias de arma aumentado de 7,84% para 10% por nível, para todas as armas incluindo shotgun, flamethrower e grenade launcher.",
    "  - A queda de dano da shotgun agora começa em 7,5m, antes 5m.",
    "  - A queda de dano da shotgun agora termina em 17,5m, antes 15m.",
    "  - Isso é metade da mudança do CompMod, que move a queda para 10m e 20m. O piso de 50% de dano além do fim do alcance de queda continua igual ao vanilla e ao CompMod; apenas onde a queda começa e termina foi alterado.",
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
    "Un mod de balance similar a vanilla NS2 para partidas 6v6-8v8, el tamaño original con el que funcionaban los servidores públicos de NS2. La mayoría de los cambios ajustan valores o mecánicas de vuelta a lo que el vanilla usaba años atrás, o incorporan cambios de CompMod y buenas ideas de CBM, con el objetivo de mejorar la expresión de habilidad sin dejar de servir para una experiencia de servidor público organizada y coordinada.",
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
    "  - Costo de energía de Stab reducido de 30 a 25.",
    "  - Costo de investigación de Stab reducido de 25 a 20 Tres.",
    "",
    "## Onos",
    "  - HP de Boneshield reducido de 1000 a 600 (1000 estaba balanceado para 10v10).",
    "  - Costo de energía de Stomp aumentado de 30 a 45, para frenar el spam de stomp cuando el equipo alien no tiene adrenaline ni un shift para sostenerlo.",
    "  - El Stomp (cambio de CBM) ahora ralentiza a los marines alcanzados en vez de tirarlos al piso. La misma ralentización que estar en una web, disminuyendo a lo largo de 5 segundos.",
    "",
    "## Mejoras",
    "  - Aura ya no revela la vida de los enemigos.",
    "",
    "## Pasivas de chambers por hive",
    "Inspiradas en los cambios de CBM, pero condicionadas a estar disponibles solo mientras la Hive correspondiente siga viva.",
    "  - Las Shells se regeneran fuera de combate mientras los aliens tengan una Crag hive.",
    "  - Los Veils se camuflan fuera de combate mientras los aliens tengan una Shade hive.",
    "  - Las Spurs pueden ser levantadas y movidas por el comandante mientras los aliens tengan una Shift hive.",
    "",
    "## Cysts",
    "  - Tiempo de construcción del cyst aumentado de 3,33 a 6 segundos (valor de CompMod).",
    "  - Multiplicador de construcción de cyst con Shift hive aumentado de x1,25 a x1,5 (valor de CompMod), ya que el sistema de cysts del vanilla está roto en cantidades normales de jugadores.",
    "  - El daño de fuego a los cysts ahora se separa por fuente (valor de CompMod): los welders hacen x4, antes x5, y los flamethrowers hacen x7, antes x5.",
    "  - Vida del cyst maduro reducida de 400 a 300.",
    "  - Rango de detección del cyst aumentado de 8m a 10m (valor de CompMod).",
    "  - Los Drifters enviados a un cyst sin construir ahora encolan toda la cadena detrás de él, en vez de un cyst por vez.",
    "",
    "## Túneles",
    "  - Las entradas y salidas de túnel puestas por el comandante no cambiaron.",
    "  - Costo de reubicar túnel reducido de 6 a 5 Tres (valor de CompMod).",
    "  - Las entradas de túnel ahora aparecen en el mapa como Entry 1-4 y Exit 1-4.",
    "",
    "## Alucinaciones",
    "  - Las alucinaciones ya no ganan vida a medida que sube la biomass (cambio de CompMod).",
    "  - Los Lerks alucinados ya no pueden usar Umbra ni Spores (cambio de CompMod).",
    "  - Los Onos alucinados ya no pueden usar Stomp (extensión propia de B2TP para la misma idea).",
    "",
    "# MARINES",
    "",
    "## Inicio de ronda",
    "  - Los marines empiezan con 1 IP, igual que en vanilla, pero ahora reciben +5 Tres en 7v7 y +10 Tres en 8v8 para compensar. Esto interpola entre 1 IP para 6v6 y el efectivo +1 IP del 10v10.",
    "",
    "## Estructuras y unidades",
    "  - Vida del ARC reducida de 2600 a 2100, interpolada a partir del valor 1800 de CompMod.",
    "  - Armor del ARC aumentado de 400 a 500 (valor de CompMod), y los ARCs están limitados a 4 (valor de CompMod).",
    "  - Los MACs ahora se mueven 15% más rápido fuera de combate (valor de CompMod).",
    "  - Velocidad de salida del MAC desde la Robotics Factory aumentada de 2 a 5 (arreglo de CBM).",
    "  - Costo de la Sentry aumentado de 5 a 6 Tres (valor de CompMod).",
    "  - Costo de la Sentry Battery aumentado de 10 a 12 Tres (valor de CompMod).",
    "",
    "## Drops",
    "  - Costo de dropear welder reducido de 3 a 2 Tres.",
    "  - Costo de dropear minas reducido de 7 a 5 Tres.",
    "  - Las armas dropeadas ahora quedan en el piso 20 segundos, en vez de 16.",
    "",
    "## Tecnología de Medpacks",
    "  - Portado de las temporadas 13 y 14 de ENSL CompMod.",
    "  - Nueva mejora Medtech #1 (Command Station + Armory): los medpacks curan 30 al instante y 20 a lo largo del tiempo.",
    "  - Nueva mejora Medtech #2 (Command Station + Advanced Armory + Medtech #1): los medpacks curan 40 al instante y 10 a lo largo del tiempo.",
    "Los medpacks escalan a medida que avanza la partida, ya que los meds del vanilla se quedan cortos en el juego tardío.",
    "",
    "## Armas",
    "  - Escalado de las mejoras de arma aumentado de 7,84% a 10% por nivel, para todas las armas incluyendo shotgun, flamethrower y grenade launcher.",
    "  - La caída de daño de la shotgun ahora empieza en 7,5m, antes 5m.",
    "  - La caída de daño de la shotgun ahora termina en 17,5m, antes 15m.",
    "  - Esto es la mitad del cambio de CompMod, que mueve la caída a 10m y 20m. El piso de 50% de daño más allá del fin del rango de caída sigue igual que en vanilla y CompMod; solo se movió dónde empieza y termina la caída.",
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
