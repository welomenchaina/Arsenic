local UIS = game:GetService("UserInputService")
local GuiService = game:GetService("GuiService")

local function RequestDevice()
    if GuiService:IsTenFootInterface() then return "Console" end
    if UIS.TouchEnabled and not UIS.MouseEnabled and not UIS.KeyboardEnabled then return "Mobile" end
    if UIS.TouchEnabled and UIS.KeyboardEnabled then return "Tablet" end
    return "PC"
end

getgenv().HubInfo = {
    Name    = "Arsenic",
    Version = "1.00",
    Device  = RequestDevice(),
}
