local oldInitialize = GUIFeedback.Initialize
function GUIFeedback:Initialize()
    oldInitialize(self)

    local oldText = self.buildText:GetText()
    local newText = oldText .. " - B2TP v1.34 +CHANGELOG (test)" 
    
    self.buildText:SetText(newText)
end
