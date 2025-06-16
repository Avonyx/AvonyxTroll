local plr = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", plr.PlayerGui)
gui.Name = "AvonyXkarpuzHup"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 600, 0, 400)
frame.Position = UDim2.new(0.5, -300, 0.5, -200)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 50)
title.Text = "🌈 AvonyXkarpuzHup"
title.TextColor3 = Color3.new(1,1,1)
title.TextScaled = true
title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
title.BorderSizePixel = 0

local scroll = Instance.new("ScrollingFrame", frame)
scroll.Size = UDim2.new(1, 0, 1, -50)
scroll.Position = UDim2.new(0, 0, 0, 50)
scroll.CanvasSize = UDim2.new(0, 0, 0, 800)
scroll.ScrollBarThickness = 8
scroll.BackgroundTransparency = 1

local function createSection(name, posY)
    local sec = Instance.new("TextLabel", scroll)
    sec.Size = UDim2.new(1, -10, 0, 30)
    sec.Position = UDim2.new(0, 5, 0, posY)
    sec.Text = name
    sec.TextScaled = true
    sec.TextColor3 = Color3.fromRGB(255, 255, 0)
    sec.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    sec.BorderSizePixel = 0
    return posY + 35
end

local function createButton(name, posY, func)
    local btn = Instance.new("TextButton", scroll)
    btn.Size = UDim2.new(1, -20, 0, 40)
    btn.Position = UDim2.new(0, 10, 0, posY)
    btn.Text = name
    btn.TextScaled = true
    btn.TextColor3 = Color3.new(1,1,1)
    btn.BackgroundColor3 = Color3.fromRGB(math.random(100,200), math.random(100,200), math.random(100,200))
    btn.BorderSizePixel = 0
    btn.MouseButton1Click:Connect(func)
    return posY + 45
end

local y = 0
y = createSection("🚀 Oyuncu")
y = createButton("Fly", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/yL8iP7C4"))()
end)
y = createButton("Noclip", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/7P4hQvGj"))()
end)

y = createSection("🚗 Araç")
y = createButton("Araç Renk Değiştir", function()
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

y = createSection("🤣 Troll")
y = createButton("JScare", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/uwvNwx6p"))()
end)

y = createSection("⚡ Diğer")
y = createButton("Infinite Yield", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)

y = createButton("Panel Kapat", function()
    gui:Destroy()
end)

-- Açılış sesi
local sound = Instance.new("Sound", workspace)
sound.SoundId = "rbxassetid://9118828567" -- iphone bildirim sesi
sound.Volume = 5
sound:Play()

-- Rainbow isim
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
    while gui.Parent do
        for _, c in pairs(colors) do
            pcall(function()
                plr.DisplayName = "🌈 AvonyXkarpuzHup"
            end)
            wait(0.2)
        end
    end
end)
