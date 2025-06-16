local sg = Instance.new("ScreenGui")
sg.Name = "AvonyxTrollPanel"
sg.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 200)
frame.Position = UDim2.new(0.5, -150, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
frame.BorderSizePixel = 4
frame.BorderColor3 = Color3.fromRGB(255, 0, 0)
frame.Parent = sg

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 50)
title.Position = UDim2.new(0, 0, 0, 0)
title.Text = "🌈 Avonyx Troll Panel 🌈"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
title.Parent = frame

local button = Instance.new("TextButton")
button.Size = UDim2.new(0.8, 0, 0, 50)
button.Position = UDim2.new(0.1, 0, 0.5, -25)
button.Text = "Troll Ses Çal"
button.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.Parent = frame

button.MouseButton1Click:Connect(function()
    local sound = Instance.new("Sound", game.Workspace)
    sound.SoundId = "rbxassetid://142376088" -- funny sound id
    sound.Volume = 5
    sound:Play()
end)

print("✅ Avonyx Troll Panel açıldı!")
