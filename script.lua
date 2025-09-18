local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/weakhoes/Roblox-UI-Libs/refs/heads/main/Vanis%20Lib/Vanis%20Lib%20Source.lua"))()
local Window = Library:CreateWindow("Speed Hack", "Default")
local MainTab = Window:CreateTab("Main")
local SpeedSection = MainTab:CreateSection("Speed Controls")

local Player = game.Players.LocalPlayer
local currentSpeed = 16

local function applySpeed(newSpeed)
    local Character = Player.Character
    if Character and Character:FindFirstChild("Humanoid") then
        Character.Humanoid.WalkSpeed = newSpeed
    end
end

SpeedSection:CreateSlider({
    Name = "Walk Speed",
    Min = 16,
    Max = 200,
    Default = 16,
    Callback = function(Value)
        currentSpeed = Value
        applySpeed(Value)
    end
})

Player.CharacterAdded:Connect(function(newCharacter)
    local Humanoid = newCharacter:WaitForChild("Humanoid")
    applySpeed(currentSpeed)
end)

applySpeed(16)
