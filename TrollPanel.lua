local plr = game.Players.LocalPlayer

-- GUI
local gui = Instance.new("ScreenGui", plr.PlayerGui)
gui.Name = "AvonyXkarpuzHup"

local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 400, 0, 300)
main.Position = UDim2.new(0.5, -200, 0.5, -150)
main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
main.BorderSizePixel = 0

local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "🌈 AvonyXkarpuzHup 🌈"
title.TextScaled = true
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundColor3 = Color3.fromRGB(50,50,50)

local buttonY = 50
local function butonOlustur(yazi, callback)
    local btn = Instance.new("TextButton", main)
    btn.Size = UDim2.new(1, -20, 0, 40)
    btn.Position = UDim2.new(0, 10, 0, buttonY)
    btn.Text = yazi
    btn.TextScaled = true
    btn.TextColor3 = Color3.new(1,1,1)
    btn.BackgroundColor3 = Color3.fromRGB(math.random(80,200), math.random(80,200), math.random(80,200))
    buttonY = buttonY + 45
    btn.MouseButton1Click:Connect(callback)
end

-- Troll Sesler
butonOlustur("💀 Joker Kahkaha", function()
    local s = Instance.new("Sound", workspace)
    s.SoundId = "rbxassetid://5410086218"
    s:Play()
end)

butonOlustur("🔥 Bass Patlat", function()
    local s = Instance.new("Sound", workspace)
    s.SoundId = "rbxassetid://1843522394"
    s:Play()
end)

butonOlustur("⚠️ Jumpscare", function()
    local s = Instance.new("Sound", workspace)
    s.SoundId = "rbxassetid://1843522394"
    s:Play()
end)

-- Fly
butonOlustur("🚀 Fly Aç", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxHackerYT/FlyScript/main/Fly.lua"))()
end)

-- Araç renk
butonOlustur("🚗 Araç Renk Değiştir", function()
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("VehicleSeat") and v.Occupant == plr.Character:FindFirstChildWhichIsA("Humanoid") then
            local car = v.Parent
            for _, p in pairs(car:GetDescendants()) do
                if p:IsA("BasePart") then
                    p.BrickColor = BrickColor.Random()
                end
            end
        end
    end
end)

-- Paneli kapat
butonOlustur("❌ Paneli Kapat", function()
    gui:Destroy()
end)

-- Açılışta rainbow isim
pcall(function()
    plr.DisplayName = "🌈 AvonyXkarpuzHup 🌈"
end)

-- Açılışta ses
local s = Instance.new("Sound", workspace)
s.SoundId = "rbxassetid://9118828567" -- iPhone bildirimi
s:Play()
