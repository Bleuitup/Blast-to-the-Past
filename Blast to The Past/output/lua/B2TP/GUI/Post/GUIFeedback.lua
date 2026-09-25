local oldInitialize = GUIFeedback.Initialize
function GUIFeedback:Initialize()
    oldInitialize(self)

    local oldText = self.buildText:GetText()
    local newText = oldText .. " - B2TP v2.00b"
    
    self.buildText:SetText(newText)
end
