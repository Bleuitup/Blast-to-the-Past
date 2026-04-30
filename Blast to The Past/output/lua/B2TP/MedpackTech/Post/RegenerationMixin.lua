if Server then

    function RegenerationMixin:AddRegeneration(RegenAmount)

        local missing = self:GetMaxHealth() - self:GetHealth()
        local pool = self.regenerationHealth or 0
        local add = math.max(RegenAmount or 0, 0)

        -- Clamp total queued HoT to current missing health.
        self.regenerationHealth = math.min(pool + add, math.max(missing, 0))
        self.regenerating = self.regenerationHealth > 0

    end

end
