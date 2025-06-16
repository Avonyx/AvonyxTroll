local plr = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", plr.PlayerGui)
gui.Name = "AvonyXkarpuzHup"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 400, 0, 300)
frame.Position = UDim2.new(0.5, -200, 0.5, -150)
frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "🌈 AvonyXkarpuzHup 🌈"
title.TextScaled = true
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundColor3 = Color3.fromRGB(60,60,60)

local y = 50

local function createButton(text, action)
    local btn = Instance.new("TextButton", frame)
    btn.Size = UDim2.new(1, -20, 0, 40)
    btn.Position = UDim2.new(0, 10, 0, y)
    btn.Text = text
    btn.TextScaled = true
    btn.TextColor3 = Color3.new(1,1,1)
    btn.BackgroundColor3 = Color3.fromRGB(math.random(80,200), math.random(80,200), math.random(80,200))
    y = y + 45
    btn.MouseButton1Click:Connect(action)
end

-- Fly
createButton("🚀 Fly", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/yL8iP7C4"))()
end)

-- Araç renk değiştir
createButton("🚗 Araç Renk", function()
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("VehicleSeat") and v.Occupant == plr.Character:FindFirstChildWhichIsA("Humanoid") then
            for _, p in pairs(v.Parent:GetDescendants()) do
                if p:IsA("BasePart") then
                    p.BrickColor = BrickColor.Random()
                end
            end
        end
    end
end)

-- Troll ses (örnek)
createButton("💀 Troll Ses (Joker Kahkaha)", function()
    local s = Instance.new("Sound", workspace)
    s.SoundId = "rbxassetid://5410086218"
    s.Volume = 10
    s:Play()
end)

-- Panel kapat
createButton("❌ Kapat", function()
    gui:Destroy()
end)

-- Rainbow isim
spawn(function()
    local colors = {
        Color3.new(1,0,0),
        Color3.new(1,0.5,0),
        Color3.new(1,1,0),
        Color3.new(0,1,0),
        Color3.new(0,1,1),
        Color3.new(0,0,1),
        Color3.new(1,0,1),
    }
    while gui.Parent do
        for _, c in pairs(colors) do
            pcall(function()
                plr.DisplayName = "🌈 AvonyXkarpuzHup 🌈"
                game:GetService("Players").LocalPlayer.Character.Head.BrickColor = BrickColor.new(c)
            end)
            wait(0.3)
        end
    end
end)

-- Açılışta ses
local openSound = Instance.new("Sound", workspace)
openSound.SoundId = "rbxassetid://9118828567" -- iPhone bildirim sesi
openSound.Volume = 5
openSound:Play()
