local oldAlienTeamInitTechTree = AlienTeam.InitTechTree

function AlienTeam:InitTechTree()

    oldAlienTeamInitTechTree(self)

    if not self.techTree:GetTechNode(kTechId.AdvancedSwipe) then
        self.techTree:AddResearchNode(kTechId.AdvancedSwipe, kTechId.BioMassEight, kTechId.None, kTechId.AllAliens)
        self.techTree:SetComplete()
    end

end