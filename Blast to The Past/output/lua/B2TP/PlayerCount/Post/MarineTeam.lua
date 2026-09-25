local SpawnInfantryPortal = debug.getupvaluex(MarineTeam.SpawnInitialStructures, "SpawnInfantryPortal")

function MarineTeam:SpawnInitialStructures(techPoint)

    self.warmupStructures = {}
    self.startTechPoint = techPoint
    self.spawnedInfantryPortal = 0
    takenInfantryPortalPoints = {}

    local tower, commandStation = PlayingTeam.SpawnInitialStructures(self, techPoint)

    self:SpawnInfantryPortal(techPoint)
   -- increase TRes to compensate for no IP
	if self:GetNumPlayers() == 7 then
		self:AddTeamResources(5)
	
	-- increase TRes to compensate for no IP
    elseif self:GetNumPlayers() >= 8 then
	
		self:AddTeamResources(10)
		
    end

    if Shared.GetCheatsEnabled() and MarineTeam.gSandboxMode then
        MakeTechEnt(techPoint, AdvancedArmory.kMapName, 3.5, -2, kMarineTeamType)
        -- CBM spawns its Exo Prototype Lab here; plain Prototype Lab when CBM is absent.
        MakeTechEnt(techPoint, (ExoPrototypeLab and ExoPrototypeLab.kMapName) or PrototypeLab.kMapName, -3.5, 2, kMarineTeamType)
    end

    return tower, commandStation

end