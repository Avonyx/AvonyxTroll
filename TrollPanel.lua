local plr = game.Players.LocalPlayer

-- RP ismi rainbow olarak ayarlanıyor
spawn(function()
    while true do
        pcall(function()
            plr.DisplayName = "🌈 AvonyXkarpuzHup"
        end)
        wait(0.5)
    end
end)

-- Panel GUI
local gui = Instance.new("ScreenGui", plr.PlayerGui)
gui.Name = "AvonyXkarpuzHup"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 600, 0, 400)
frame.Position = UDim2.new(0.5, -300, 0.5, -200)
frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
frame.BorderSizePixel = 0

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "🌈 AvonyXkarpuzHup - Brookhaven Panel"
title.TextScaled = true
title.TextColor3 = Color3.fromRGB(255,255,255)
title.BackgroundColor3 = Color3.fromRGB(60,60,60)
title.BorderSizePixel = 0

local scroll = Instance.new("ScrollingFrame", frame)
scroll.Size = UDim2.new(1, 0, 1, -40)
scroll.Position = UDim2.new(0, 0, 0, 40)
scroll.CanvasSize = UDim2.new(0, 0, 0, 1000)
scroll.ScrollBarThickness = 10
scroll.BackgroundTransparency = 1

local function section(name, y)
    local sec = Instance.new("TextLabel", scroll)
    sec.Size = UDim2.new(1, -10, 0, 30)
    sec.Position = UDim2.new(0, 5, 0, y)
    sec.Text = name
    sec.TextScaled = true
    sec.TextColor3 = Color3.fromRGB(0, 255, 255)
    sec.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    sec.BorderSizePixel = 0
    return y + 35
end

local function button(name, y, func)
    local btn = Instance.new("TextButton", scroll)
    btn.Size = UDim2.new(1, -20, 0, 40)
    btn.Position = UDim2.new(0, 10, 0, y)
    btn.Text = name
    btn.TextScaled = true
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.BackgroundColor3 = Color3.fromRGB(math.random(100, 200), math.random(100, 200), math.random(100, 200))
    btn.BorderSizePixel = 0
    btn.MouseButton1Click:Connect(func)
    return y + 45
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
y = button("Joker Kahkaha (Tüm Server)", function()
    local s = Instance.new("Sound", workspace)
    s.SoundId = "rbxassetid://5041354913"
    s.Volume = 10
    s:Play()
end)

y = button("Bass Ses (Tüm Server)", function()
    local s = Instance.new("Sound", workspace)
    s.SoundId = "rbxassetid://142376088"
    s.Volume = 10
    s:Play()
end)

y = button("Anime Sesi (Tüm Server)", function()
    local s = Instance.new("Sound", workspace)
    s.SoundId = "rbxassetid://1837635127"
    s.Volume = 10
    s:Play()
end)

y = button("Kefo Wanda Nara (Tüm Server)", function()
    local s = Instance.new("Sound", workspace)
    s.SoundId = "rbxassetid://1843522523"
    s.Volume = 10
    s:Play()
end)

y = section("⚡ Diğer", y)
y = button("Paneli Kapat", function()
    gui:Destroy()
end)
