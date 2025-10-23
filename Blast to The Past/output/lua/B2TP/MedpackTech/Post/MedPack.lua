function MedPack:OnTouch(recipient)

    if not recipient.timeLastMedpack or recipient.timeLastMedpack + self.kPickupDelay <= Shared.GetTime() then
    
		local oldHealth = recipient:GetHealth()
		local level = recipient:GetMedpackLevel()
		
		local heal = 25
		local regen = 25
		
		if level == 1 then
			heal = 30
			regen = 20
		elseif level == 2 then
			heal = 40
			regen = 10
		end
		
        recipient:AddHealth(heal, false, true)
        recipient:AddRegeneration(regen)
        recipient.timeLastMedpack = Shared.GetTime()

        self:TriggerEffects("medpack_pickup", { effecthostcoords = self:GetCoords() })
		
		-- Handle Stats
        if Server then

            local commanderStats = StatsUI_GetStatForCommander(StatsUI_GetMarineCommmaderSteamID())

            -- If the medpack hits immediatly expireTime is 0
            if ConditionalValue(self.expireTime == 0, Shared.GetTime(), self.expireTime - kItemStayTime) + 0.025 > Shared.GetTime() then
                commanderStats["medpack"].hitsAcc = commanderStats["medpack"].hitsAcc + 1
            end

            commanderStats["medpack"].misses = commanderStats["medpack"].misses - 1
            commanderStats["medpack"].picks = commanderStats["medpack"].picks + 1
            commanderStats["medpack"].refilled = commanderStats["medpack"].refilled + recipient:GetHealth() - oldHealth

        end

    end
    
end