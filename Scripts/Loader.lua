local Scripts = {
    BasketballLegends = {
        Script = "https://raw.githubusercontent.com/welomenchaina/Arsenic/refs/heads/main/Scripts/BasketballLegends.lua",
        GameId = 4931927012
    },
    Rivals = {
        Script = "https://raw.githubusercontent.com/welomenchaina/Arsenic/refs/heads/main/Scripts/Rivals.lua",
        GameId = 6035872082
    }
}

local StarterGui = game:GetService("StarterGui")

local function Notify(title, text, duration)
    duration = duration or 5

    task.spawn(function()
        repeat
            local success = pcall(function()
                StarterGui:SetCore("SendNotification", {
                    Title = title,
                    Text = text,
                    Duration = duration
                })
            end)

            if success then
                break
            end

            task.wait(1)
        until false
    end)
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

        task.wait(0.5)

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
