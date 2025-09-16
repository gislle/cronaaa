local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow("Universal Speed Hack", "By Twin")

local Tab = Window:CreateTab("Main")

-- Speed Slider
Tab:CreateSlider({
    Name = "WalkSpeed",
    Range = {16, 500},
    Increment = 1,
    Suffix = " studs/s",
    CurrentValue = 16,
    Callback = function(Value)
        if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
        end
    end,
})

-- JumpPower Slider (Bonus)
Tab:CreateSlider({
    Name = "JumpPower",
    Range = {50, 500},
    Increment = 1,
    Suffix = " power",
    CurrentValue = 50,
    Callback = function(Value)
        if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
        end
    end,
})

-- Toggle for Auto-Sprint (Optional)
Tab:CreateToggle({
    Name = "Auto Sprint",
    CurrentValue = false,
    Callback = function(Value)
        if Value then
            _G.Sprint = true
            while _G.Sprint and task.wait() do
                if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100 -- Set sprint speed
                end
            end
        else
            _G.Sprint = false
            -- Reset to normal speed if needed
            if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
            end
        end
    end,
})
