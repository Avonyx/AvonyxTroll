local plr = game.Players.LocalPlayer

-- Rainbow RP isim
spawn(function()
    local colors = {
        Color3.fromRGB(255,0,0),
        Color3.fromRGB(255,127,0),
        Color3.fromRGB(255,255,0),
        Color3.fromRGB(0,255,0),
        Color3.fromRGB(0,0,255),
        Color3.fromRGB(75,0,130),
        Color3.fromRGB(148,0,211)
    }
    while true do
        for _, c in pairs(colors) do
            pcall(function()
                plr.DisplayName = "🌈 AvonyXkarpuzHup"
            end)
            wait(0.2)
        end
    end
end)

-- Açılış sesi (iphone bildirim sesi)
local sound = Instance.new("Sound", workspace)
sound.SoundId = "rbxassetid://9118828567"
sound.Volume = 5
sound:Play()

-- Panel GUI
local gui = Instance.new("ScreenGui", plr.PlayerGui)
gui.Name = "AvonyXkarpuzHup"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 700, 0, 450)
frame.Position = UDim2.new(0.5, -350, 0.5, -225)
frame.BackgroundColor3 = Color3.fromRGB(35,35,35)
frame.BorderSizePixel = 0

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 50)
title.Text = "🌈 AvonyXkarpuzHup Panel"
title.TextScaled = true
title.TextColor3 = Color3.fromRGB(255,255,255)
title.BackgroundColor3 = Color3.fromRGB(55,55,55)
title.BorderSizePixel = 0

local scroll = Instance.new("ScrollingFrame", frame)
scroll.Size = UDim2.new(1, 0, 1, -50)
scroll.Position = UDim2.new(0, 0, 0, 50)
scroll.CanvasSize = UDim2.new(0, 0, 0, 1200)
scroll.ScrollBarThickness = 10
scroll.BackgroundTransparency = 1

local function section(name, y)
    local sec = Instance.new("TextLabel", scroll)
    sec.Size = UDim2.new(1, -10, 0, 35)
    sec.Position = UDim2.new(0, 5, 0, y)
    sec.Text = name
    sec.TextScaled = true
    sec.TextColor3 = Color3.fromRGB(0,255,255)
    sec.BackgroundColor3 = Color3.fromRGB(50,50,50)
    sec.BorderSizePixel = 0
    return y + 40
end

local function button(name, y, func)
    local btn = Instance.new("TextButton", scroll)
    btn.Size = UDim2.new(1, -20, 0, 45)
    btn.Position = UDim2.new(0, 10, 0, y)
    btn.Text = name
    btn.TextScaled = true
    btn.TextColor3 = Color3.fromRGB(255,255,255)
    btn.BackgroundColor3 = Color3.fromRGB(math.random(100,200),math.random(100,200),math.random(100,200))
    btn.BorderSizePixel = 0
    btn.MouseButton1Click:Connect(func)
    return y + 50
end

local y = 0
y = section("🚀 Oyuncu", y)
y = button("Fly", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/yL8iP7C4"))()
end)

y = button("Noclip", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/7P4hQvGj"))()
end)

y = section("🚗 Araç", y)
y = button("Araç Renk Değiştir", function()
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

y = section("🤣 Troll", y)
y = button("Tüm Server Ses: Joker Kahkaha", function()
    local s = Instance.new("Sound", workspace)
    s.SoundId = "rbxassetid://5041354913" -- Joker kahkaha
    s.Volume = 10
    s:Play()
end)

y = button("Tüm Server Ses: Bass", function()
    local s = Instance.new("Sound", workspace)
    s.SoundId = "rbxassetid://142376088" -- Bass sound
    s.Volume = 10
    s:Play()
end)

y = button("Tüm Server Ses: Anime Sesi", function()
    local s = Instance.new("Sound", workspace)
    s.SoundId = "rbxassetid://1837635127" -- Anime sesi
    s.Volume = 10
    s:Play()
end)

y = button("Tüm Server Ses: Kefo Wanda Nara", function()
    local s = Instance.new("Sound", workspace)
    s.SoundId = "rbxassetid://1843522523" -- Şarkı
    s.Volume = 10
    s:Play()
end)

y = section("⚡ Diğer", y)
y = button("Panel Kapat", function()
    gui:Destroy()
end)
