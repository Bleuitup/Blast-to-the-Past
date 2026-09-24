-- Aura no longer reveals enemy health, and says so visually: every aura icon is the flat white
-- Thunderdome heart. White rather than yellow, because yellow is the vanilla colour that turns red
-- as the enemy is hurt, and players would expect it to.
--
-- Two steps, because CBM versions draw it differently:
--
--   1. Force self.isThunderdomeEnabled = true. Every version picks the icon texture from this flag
--      (kTDTexture, the white heart), and vanilla / CBM 3.6 also derive the tint from it,
--      Color(1, healthScalar, blue, 1) -> Color(1, 1, 1, 1).
--   2. Recolour every icon white after each Update. CBM 3.5 ignores the flag for the tint and
--      hardcodes Color(1, 1, 0, 1) (yellow), so step 1 alone would leave it yellow there.
--
-- Hooks only, never a Replace: CBM ships its own GUIAuraDisplay.lua and a Replace would discard it.
-- CreateAuaIcon is called lazily from Update, so the flag is already true before any icon picks
-- its texture.

local kAuraColor = Color(1, 1, 1, 1)

local oldInitialize = GUIAuraDisplay.Initialize
function GUIAuraDisplay:Initialize()

    oldInitialize(self)

    self.isThunderdomeEnabled = true

end

local oldUpdate = GUIAuraDisplay.Update
function GUIAuraDisplay:Update(deltaTime)

    oldUpdate(self, deltaTime)

    if self.icons then
        for i = 1, #self.icons do
            self.icons[i]:SetColor(kAuraColor)
        end
    end

end
