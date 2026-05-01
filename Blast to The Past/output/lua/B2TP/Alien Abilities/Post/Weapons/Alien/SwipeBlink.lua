function SwipeBlink:GetDeathIconIndex()
    if self:GetParent():GetHasThreeHives() then
        return kDeathMessageIcon.Stab
    else
        return kDeathMessageIcon.Swipe
    end
end