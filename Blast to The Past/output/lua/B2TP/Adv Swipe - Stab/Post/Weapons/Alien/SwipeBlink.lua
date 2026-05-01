function SwipeBlink:GetDeathIconIndex()
    if GetHasTech(self:GetParent(), kTechId.AdvancedSwipe) then
        return kDeathMessageIcon.AdvancedSwipe
    else
        return kDeathMessageIcon.Swipe
    end
end