local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/gislle/cronaaa/refs/heads/main/script.lua"))()
local Window = Library:CreateWindow("Speed Hack")
local MainTab = Window:AddTab("Main")

local Player = game.Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")

local SpeedSlider = MainTab:AddSlider("WalkSpeed", {
    Text = "Walk Speed",
    Default = 16,
    Min = 16,
    Max = 200,
    Rounding = 0,
})

SpeedSlider:OnChanged(function(Value)
    Humanoid.WalkSpeed = Value
end)

