local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/gislle/libary-ui-vinasv2/refs/heads/main/libary%20ui%20copy.lua"))()
-- Create window
local Window = Library:CreateWindow("Speed Control")

-- Add speed slider
Window:AddSlider("WalkSpeed", {
    min = 16,
    max = 100,
    default = 16,
    callback = function(value)
        if game.Players.LocalPlayer.Character then
            local humanoid = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
            if humanoid then
                humanoid.WalkSpeed = value
            end
        end
    end
})
