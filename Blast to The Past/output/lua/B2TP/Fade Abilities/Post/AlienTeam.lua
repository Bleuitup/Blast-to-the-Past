local oldAlienTeamInitTechTree = AlienTeam.InitTechTree

function AlienTeam:InitTechTree()

    oldAlienTeamInitTechTree(self)

    if not self.techTree:GetTechNode(kTechId.AdvancedSwipe) then
        self.techTree:AddResearchNode(kTechId.AdvancedSwipe, kTechId.BioMassEight, kTechId.None, kTechId.AllAliens)

        -- Vanilla AlienTeam already called SetComplete(), so force a rebuild.
        self.techTree.complete = false
        self.techTree:SetComplete()
        self.techTree:SetTechChanged()
    end

end