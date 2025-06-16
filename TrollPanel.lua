local player = game.Players.LocalPlayer

-- İsim değiştir
pcall(function()
    player.Name = "AvonyXkarpuzHup"
    player.DisplayName = "🌈 AvonyXkarpuzHup 🌈"
end)

-- Eski GUI'yi temizle
for _, v in pairs(player.PlayerGui:GetChildren()) do
    if v.Name == "AvonyXkarpuzHupPanel" then
        v:Destroy()
    end
end

-- GUI kur
local sg = Instance.new("ScreenGui", player.PlayerGui)
sg.Name = "AvonyXkarpuzHupPanel"

local mainFrame = Instance.new("Frame", sg)
mainFrame.Size = UDim2.new(0, 400, 0, 500)
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -250)
mainFrame.BackgroundColor3 = Color3.fromRGB(30,30,30)
mainFrame.BorderSizePixel = 0

local layout = Instance.new("UIListLayout", mainFrame)
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.Padding = UDim.new(0, 10)

local function createSection(titleText)
    local section = Instance.new("Frame", mainFrame)
    section.Size = UDim2.new(1, -10, 0, 150)
    section.BackgroundColor3 = Color3.fromRGB(45,45,45)
    
    local label = Instance.new("TextLabel", section)
    label.Size = UDim2.new(1, 0, 0, 30)
    label.Text = "🔹 " .. titleText .. " 🔹"
    label.TextColor3 = Color3.new(1,1,1)
    label.TextScaled = true
    label.BackgroundTransparency = 1
    
    local btnLayout = Instance.new("UIListLayout", section)
    btnLayout.SortOrder = Enum.SortOrder.LayoutOrder
    btnLayout.Padding = UDim.new(0, 5)
    
    return section
end

local function createButton(parent, text, callback)
    local btn = Instance.new("TextButton", parent)
    btn.Size = UDim2.new(1, -10, 0, 30)
    btn.Text = text
    btn.TextColor3 = Color3.new(1,1,1)
    btn.BackgroundColor3 = Color3.fromRGB(60,60,60)
    btn.TextScaled = true
    btn.MouseButton1Click:Connect(callback)
end

-- TROLL KUTUSU
local trollSection = createSection("TROLL")
createButton(trollSection, "🔊 Joker Kahkaha", function()
    local s = Instance.new("Sound", workspace)
    s.SoundId = "rbxassetid://5410086218"
    s:Play()
end)
createButton(trollSection, "🔊 Bass Patlat", function()
    local s = Instance.new("Sound", workspace)
    s.SoundId = "rbxassetid://1843522394"
    s:Play()
end)
createButton(trollSection, "🔊 Kefo Wanda Nara", function()
    local s = Instance.new("Sound", workspace)
    s.SoundId = "rbxassetid://8769819002"
    s:Play()
end)

-- FLY KUTUSU
local flySection = createSection("FLY")
createButton(flySection, "🚀 Uçmaya Başla", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxHackerYT/FlyScript/main/Fly.lua"))()
end)

-- PANELİ KAPAT
local settingsSection = createSection("AYARLAR")
createButton(settingsSection, "❌ Paneli Kapat", function()
    sg:Destroy()
end)
