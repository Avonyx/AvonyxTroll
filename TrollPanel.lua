    -- 🌈 Avonyx Yeni Troll Panel V1
local plr = game.Players.LocalPlayer

-- İsim değiştir
plr.Name = "AvonyxKarpuzHup"

-- Basit GUI panel
local gui = Instance.new("ScreenGui", plr.PlayerGui)
gui.Name = "AvonyxTrollPanel"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 300, 0, 150)
frame.Position = UDim2.new(0.5, -150, 0.5, -75)
frame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)

local label = Instance.new("TextLabel", frame)
label.Size = UDim2.new(1, 0, 0.3, 0)
label.Text = "🔥 Avonyx Troll Panel"
label.TextScaled = true
label.BackgroundTransparency = 1

local btnKill = Instance.new("TextButton", frame)
btnKill.Size = UDim2.new(1, 0, 0.35, 0)
btnKill.Position = UDim2.new(0, 0, 0.3, 0)
btnKill.Text = "💀 Herkesi Öldür"
btnKill.TextScaled = true
btnKill.MouseButton1Click:Connect(function()
    for _,v in pairs(game.Players:GetPlayers()) do
        if v ~= plr and v.Character and v.Character:FindFirstChild("Humanoid") then
            v.Character.Humanoid.Health = 0
        end
    end
end)

local btnSound = Instance.new("TextButton", frame)
btnSound.Size = UDim2.new(1, 0, 0.35, 0)
btnSound.Position = UDim2.new(0, 0, 0.65, 0)
btnSound.Text = "🔊 Troll Ses Yay"
btnSound.TextScaled = true
btnSound.MouseButton1Click:Connect(function()
    local s = Instance.new("Sound", workspace)
    s.SoundId = "rbxassetid://142376088" -- troll scream
    s.Volume = 10
    s:Play()
end)
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.Name = "AvonyxTrollPanel"

Frame.Size = UDim2.new(0, 300, 0, 200)
Frame.Position = UDim2.new(0.5, -150, 0.5, -100)
Frame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Frame.Parent = ScreenGui

print("Avonyx Troll Panel açıldı!")

