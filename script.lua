local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/gislle/cronaaa/refs/heads/main/script.lua"))()
local Window = Library:CreateWindow("Speed Hack")
local MainTab = Window:AddTab("Main")

local Player = game.Players.LocalPlayer

-- Function to apply the speed. We'll call this every time the slider changes AND when a new character loads.
local function applySpeed(newSpeed)
    local Character = Player.Character
    if Character and Character:FindFirstChild("Humanoid") then
        Character.Humanoid.WalkSpeed = newSpeed
    end
end

-- Store the current slider value so we can apply it to new characters
local currentSpeed = 16
local SpeedSlider = MainTab:AddSlider("WalkSpeed", {
    Text = "Walk Speed",
    Default = currentSpeed,
    Min = 16,
    Max = 200,
    Rounding = 0,
})

-- When the slider changes, update the current speed and apply it
SpeedSlider:OnChanged(function(Value)
    currentSpeed = Value
    applySpeed(Value)
end)

-- This event fires every time the player's character respawns.
Player.CharacterAdded:Connect(function(newCharacter)
    -- Wait for the Humanoid to exist in the new character
    local Humanoid = newCharacter:WaitForChild("Humanoid")
    -- Apply the last chosen speed to the new character
    applySpeed(currentSpeed)
end)
