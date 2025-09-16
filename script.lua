-- real_script.lua
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow("Twin's Ink Hacks", "Teleport & Speed")

local Tab = Window:CreateTab("Movement")

-- Teleport to Position
Tab:CreateButton({
    Name = "Teleport to Goal",
    Callback = function()
        local goal = workspace:FindFirstChild("Goal") or workspace:FindFirstChild("Finish") -- Change to your target part name
        if goal and game.Players.LocalPlayer.Character then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = goal.CFrame
        end
    end,
})

-- Speed Hack
Tab:CreateSlider({
    Name = "Speed Hack",
    Range = {16, 500},
    Increment = 10,
    Suffix = " studs/s",
    CurrentValue = 16,
    Flag = "SpeedHack",
    Callback = function(Value)
        if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
        end
    end,
})

-- Auto-Teleport Loop (for grinding or escaping)
Tab:CreateToggle({
    Name = "Loop Teleport to Position",
    CurrentValue = false,
    Flag = "AutoTP",
    Callback = function(Value)
        if Value then
            _G.AutoTP = true
            while _G.AutoTP and task.wait(1) do
                local target = workspace:FindFirstChild("SafeSpot") -- Change to your desired part name
                if target and game.Players.LocalPlayer.Character then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = target.CFrame
                end
            end
        else
            _G.AutoTP = false
        end
    end,
})