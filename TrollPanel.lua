local player = game.Players.LocalPlayer

-- Rainbow isim ve display name
pcall(function()
    player.Name = "AvonyXkarpuzHup"
    player.DisplayName = "🌈 AvonyXkarpuzHup 🌈"
end)

-- Hoşgeldin mesajı + iPhone sesi
local sg = Instance.new("ScreenGui", player.PlayerGui)
sg.Name = "AvonyXkarpuzHupPanel"

local msg = Instance.new("TextLabel", sg)
msg.Size = UDim2.new(1,0,0,50)
msg.Position = UDim2.new(0,0,0,0)
msg.BackgroundTransparency = 1
msg.Text = "Hoşgeldin Kardeşim!"
msg.TextColor3 = Color3.fromRGB(255,255,255)
msg.TextScaled = true

local sound = Instance.new("Sound", workspace)
sound.SoundId = "rbxassetid://9118828567" -- iPhone bildirimi sesi
sound:Play()

delay(5, function() 
    msg:Destroy() 
end)

-- Panel
local mainFrame = Instance.new("Frame", sg)
mainFrame.Size = UDim2.new(0, 400, 0, 500)
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -250)
mainFrame.BackgroundColor3 = Color3.fromRGB(40,40,40)

local layout = Instance.new("UIListLayout", mainFrame)
layout.Padding = UDim.new(0,5)

local function addButton(text, func)
    local b = Instance.new("TextButton", mainFrame)
    b.Size = UDim2.new(1, -10, 0, 40)
    b.Text = text
    b.TextColor3 = Color3.new(1,1,1)
    b.BackgroundColor3 = Color3.fromRGB(math.random(50,255), math.random(50,255), math.random(50,255))
    b.TextScaled = true
    b.MouseButton1Click:Connect(func)
end

-- Troll kutusu
addButton("🔊 Joker Kahkaha", function()
    local s = Instance.new("Sound", workspace)
    s.SoundId = "rbxassetid://5410086218"
    s:Play()
end)

addButton("🔊 Bass Patlat", function()
    local s = Instance.new("Sound", workspace)
    s.SoundId = "rbxassetid://1843522394"
    s:Play()
end)

addButton("🔊 Kefo Wanda Nara", function()
    local s = Instance.new("Sound", workspace)
    s.SoundId = "rbxassetid://8769819002"
    s:Play()
end)

-- Fly
addButton("🚀 Fly Aç", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxHackerYT/FlyScript/main/Fly.lua"))()
end)

-- Kapat
addButton("❌ Paneli Kapat", function()
    sg:Destroy()
end)
