local Scripts = {
    BasketballLegends = {
        Script = "https://raw.githubusercontent.com/welomenchaina/Arsenic/refs/heads/main/Scripts/BasketballLegends.lua",
        GameId = 14259168147
    }
}

local function Notify(title, text, duration)
    duration = duration or 5

    if typeof(StarterGui) == "Instance" then
        pcall(function()
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = title,
                Text = text,
                Duration = duration
            })
        end)
    end
end

local gameId = game.GameId
local found = false

for scriptName, data in pairs(Scripts) do
    if data.GameId == gameId then
        found = true

        Notify(
            "Arsenic",
            string.format("Detected %s. Loading script...", scriptName),
            5
        )

        loadstring(game:HttpGet(data.Script))()
        break
    end
end

if not found then
    Notify(
        "Arsenic",
        "Unsupported game detected!!",
        5
    )
end
