-- Medtech icon on the marine HUD, under the armor and weapon upgrade icons on the right.
--
-- Shows the highest Medtech researched (#1 or #2) and nothing with default medpacks, the same way
-- the armor and weapon icons show nothing at level 0. The level uses the same rule as the medpacks
-- themselves (Marine:GetMedpackLevel): once researched, Medtech stays for the round. It is Command
-- Station research, so unlike the Arms Lab upgrades it is never shown lost (red). During warmup
-- nothing is researched, so no icon shows; medpacks heal the default amount there too.
--
-- Same texture, size, spacing and color as CBM's armorLevel / weaponLevel items.

local function GetMedtechLevel()

    local techTree = GetTechTree()
    if not techTree then
        return 0
    end

    local med2Node = techTree:GetTechNode(kTechId.MedTech2)
    if med2Node and med2Node:GetResearched() then
        return 2
    end

    local med1Node = techTree:GetTechNode(kTechId.MedTech1)
    if med1Node and med1Node:GetResearched() then
        return 1
    end

    return 0

end

local kMedtechTechIds = { kTechId.MedTech1, kTechId.MedTech2 }

local function EnsureMedtechItem(self)

    if not self.b2tpMedtechLevel and self.background then
        self.b2tpMedtechLevel = GetGUIManager():CreateGraphicItem()
        self.b2tpMedtechLevel:SetTexture(GUIMarineHUD.kUpgradesTexture)
        self.b2tpMedtechLevel:SetAnchor(GUIItem.Right, GUIItem.Center)
        self.background:AddChild(self.b2tpMedtechLevel)
    end

    return self.b2tpMedtechLevel

end

local oldReset = GUIMarineHUD.Reset
function GUIMarineHUD:Reset(...)

    oldReset(self, ...)

    local item = EnsureMedtechItem(self)
    if item then
        -- Third slot: the weapon icon sits one icon height plus 8 below the armor icon.
        local step = GUIMarineHUD.kUpgradeSize.y + 8
        item:SetPosition(Vector(GUIMarineHUD.kUpgradePos.x, GUIMarineHUD.kUpgradePos.y + step * 2, 0) * self.scale)
        item:SetSize(GUIMarineHUD.kUpgradeSize * self.scale)
        GUI_SetIsVisible(item, false)
        self.b2tpLastMedtechLevel = nil -- re-apply texture coords after a reset
    end

end

local oldUpdate = GUIMarineHUD.Update
function GUIMarineHUD:Update(deltaTime, ...)

    oldUpdate(self, deltaTime, ...)

    local item = EnsureMedtechItem(self)
    if not item then
        return
    end

    local level = GetMedtechLevel()
    GUI_SetIsVisible(item, level ~= 0)

    if level ~= self.b2tpLastMedtechLevel then
        if level ~= 0 then
            item:SetTexturePixelCoordinates(GUIUnpackCoords(GetTextureCoordinatesForIcon(kMedtechTechIds[level], true)))
        end
        self.b2tpLastMedtechLevel = level
    end

    item:SetColor(kIconColors[kMarineTeamType])

end
