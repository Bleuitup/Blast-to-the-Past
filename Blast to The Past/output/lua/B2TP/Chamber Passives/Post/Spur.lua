-- B2TP Style Spur movement passive
-- Simplified Post-hook version.
-- Uses vanilla PathingMixin + OrdersMixin directly.
-- Does NOT use AlienStructureMoveMixin network vars.

Script.Load("lua/PathingMixin.lua")
Script.Load("lua/OrdersMixin.lua")

local kB2TPSpurMoveSpeed = 2.9 / 2

local oldSpurOnCreate = Spur.OnCreate
local oldSpurOnUpdate = Spur.OnUpdate
local oldSpurGetTechButtons = Spur.GetTechButtons
local oldSpurPerformAction = Spur.PerformAction
local oldSpurOnValidateOrder = Spur.OnValidateOrder
local oldSpurOnOrderChanged = Spur.OnOrderChanged

local function B2TP_SpurHasShiftHiveTech(self)

    return GetHasTech(self, kTechId.ShiftHive)

end

local function B2TP_SpurCanMove(self)

    return self:GetIsBuilt()
        and GetIsUnitActive(self)
        and B2TP_SpurHasShiftHiveTech(self)

end

local function B2TP_SpurRemoveFromMesh(self)

    if HasMixin(self, "Obstacle")
            and self.RemoveFromMesh
            and not self.b2tpRemovedFromMesh then

        self:RemoveFromMesh()

        if self.OnObstacleChanged then
            self:OnObstacleChanged()
        end

        self.b2tpRemovedFromMesh = true

    end

end

local function B2TP_SpurAddToMesh(self)

    if HasMixin(self, "Obstacle")
            and self.AddToMesh
            and self.b2tpRemovedFromMesh then

        self:AddToMesh()
        self.b2tpRemovedFromMesh = false

    end

end

function Spur:OnCreate()

    if oldSpurOnCreate then
        oldSpurOnCreate(self)
    end

    -- PathingMixin has no network vars, so this is relatively safe in Post.
    if not HasMixin(self, "Pathing") then
        InitMixin(self, PathingMixin)
    end

    -- OrdersMixin does have network vars in a full implementation, but its
    -- server-side order list can still be useful for a lightweight movement port.
    if not HasMixin(self, "Orders") then
        InitMixin(self, OrdersMixin, { kMoveOrderCompleteDistance = kAIMoveOrderCompleteDistance })
    end

    self.b2tpMoving = false
    self.b2tpRemovedFromMesh = false

end

function Spur:GetIsFlying()

    return false

end

function Spur:GetMaxSpeed()

    return kB2TPSpurMoveSpeed

end

function Spur:GetStructureMoveable()

    return B2TP_SpurCanMove(self)

end

function Spur:OnValidateOrder(order)

    if oldSpurOnValidateOrder and not oldSpurOnValidateOrder(self, order) then
        return false
    end

    if order:GetType() == kTechId.Move then
        return B2TP_SpurCanMove(self)
    end

    return true

end

function Spur:OnOrderChanged()

    if oldSpurOnOrderChanged then
        oldSpurOnOrderChanged(self)
    end

    if self.GetIsConsuming and self:GetIsConsuming() then
        self:CancelResearch()
    end

    local currentOrder = self.GetCurrentOrder and self:GetCurrentOrder() or nil

    if Server
            and GetIsUnitActive(self)
            and currentOrder
            and currentOrder:GetType() == kTechId.Move then

        self:SetUpdateRate(kRealTimeUpdateRate)

    end

end

local function B2TP_UpdateSpurMovement(self, deltaTime)

    if not self.GetCurrentOrder then
        return
    end

    local currentOrder = self:GetCurrentOrder()

    if currentOrder and currentOrder:GetType() == kTechId.Move then

        if B2TP_SpurCanMove(self) then

            self.b2tpMoving = true

            local target = currentOrder:GetLocation()

            B2TP_SpurRemoveFromMesh(self)

            self:MoveToTarget(
                PhysicsMask.AIMovement,
                target,
                kB2TPSpurMoveSpeed,
                deltaTime
            )

            if self:IsTargetReached(target, kAIMoveOrderCompleteDistance) then

                self:CompletedCurrentOrder()
                self.b2tpMoving = false
                B2TP_SpurAddToMesh(self)

            end

        else

            self.b2tpMoving = false
            B2TP_SpurAddToMesh(self)

        end

    else

        self.b2tpMoving = false
        B2TP_SpurAddToMesh(self)

    end

end

function Spur:OnUpdate(deltaTime)

    if oldSpurOnUpdate then
        oldSpurOnUpdate(self, deltaTime)
    end

    if Server then
        B2TP_UpdateSpurMovement(self, deltaTime)
    end

end

function Spur:GetTechButtons(techId)

    if B2TP_SpurCanMove(self) then

        return {
            kTechId.Move, kTechId.Stop, kTechId.None, kTechId.None,
            kTechId.None, kTechId.None, kTechId.None, kTechId.Consume
        }

    end

    if oldSpurGetTechButtons then
        return oldSpurGetTechButtons(self, techId)
    end

    return {
        kTechId.None, kTechId.None, kTechId.None, kTechId.None,
        kTechId.None, kTechId.None, kTechId.None, kTechId.Consume
    }

end

function Spur:PerformAction(techNode, position)

    if techNode:GetTechId() == kTechId.Stop then

        if self.ClearOrders then
            self:ClearOrders()
        end

        self.b2tpMoving = false

        if Server then
            B2TP_SpurAddToMesh(self)
        end

        return true

    end

    if oldSpurPerformAction then
        return oldSpurPerformAction(self, techNode, position)
    end

end