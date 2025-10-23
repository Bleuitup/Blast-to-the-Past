if Server then
    -- Minimal change: keep the amount parameter, but clamp like vanilla.
    function RegenerationMixin:AddRegeneration(RegenAmount)
        local missing = self:GetMaxHealth() - self:GetHealth()     -- current missing HP
        local pool    = self.regenerationHealth or 0               -- queued HoT so far
        local add     = math.max(RegenAmount or 0, 0)              -- be safe vs nil/negatives

        -- Clamp total queued HoT to what’s missing right now (vanilla behavior)
        self.regenerationHealth = math.min(pool + add, math.max(missing, 0))

        -- Only tick if there’s something to heal
        self.regenerating = self.regenerationHealth > 0
    end	

    function RegenerationMixin:OnProcessMove(input)
        if not self.regenerating then return end

        local deltaTime = input.time

        local amount = deltaTime * self.regenerationValue

        self.regenerationHealth = math.max(self.regenerationHealth - amount, 0)

        --returns false if entity is allready fully healed
        self:Heal(amount)
        if self.regenerationHealth == 0 then-- or not self:Heal(amount) then
            self.regenerating = false
            self.regenerationHealth = 0
        end
    end
end
