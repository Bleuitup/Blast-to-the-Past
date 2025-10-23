local oldInitTechTree = MarineTeam.InitTechTree
function MarineTeam:InitTechTree()

	local disable = function() end
	local oldPlayingTeamInitTechTree = PlayingTeam.InitTechTree

	PlayingTeam.InitTechTree(self)
	self.techTree:AddResearchNode(kTechId.MedTech1,    kTechId.Armory, kTechId.None)
	self.techTree:AddResearchNode(kTechId.MedTech2,    kTechId.MedTech1, kTechId.AdvancedArmory)

	PlayingTeam.InitTechTree = disable
	oldInitTechTree(self)
	PlayingTeam.InitTechTree = oldPlayingTeamInitTechTree
end