local plr = game.Players.LocalPlayer

-- RP ismi rainbow olarak ayarlanıyor
spawn(function()
    local colors = {Color3.new(1,0,0),Color3.new(1,0.5,0),Color3.new(1,1,0),Color3.new(0,1,0),Color3.new(0,0,1),Color3.new(0.29,0,0.51),Color3.new(0.56,0,1)}
    local i = 1
    while true do
        pcall(function()
            plr.DisplayName = "AvonyXkarpuzHup"
            plr.Character.Head.BrickColor = BrickColor.new(colors[i])
        end)
        i = i % #colors + 1
        wait(0.2)
    end
end)

-- Panel GUI
local gui = Instance.new("ScreenGui", plr.PlayerGui)
gui.Name = "AvonyXkarpuzHup"

local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 700, 0, 400)
main.Position = UDim2.new(0.5, -350, 0.5, -200)
main.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
main.BorderSizePixel = 0

local side = Instance.new("Frame", main)
side.Size = UDim2.new(0, 150, 1, 0)
side.Position = UDim2.new(0, 0, 0, 0)
side.BackgroundColor3 = Color3.fromRGB(45, 45, 45)

local content = Instance.new("ScrollingFrame", main)
content.Size = UDim2.new(1, -150, 1, 0)
content.Position = UDim2.new(0, 150, 0, 0)
content.CanvasSize = UDim2.new(0,0,0,600)
content.ScrollBarThickness = 8
content.BackgroundTransparency = 1

local function addSideButton(text, click)
    local b = Instance.new("TextButton", side)
    b.Size = UDim2.new(1, 0, 0, 40)
    b.Text = text
    b.TextColor3 = Color3.new(1,1,1)
    b.BackgroundColor3 = Color3.fromRGB(70,70,70)
    b.BorderSizePixel = 0
    b.MouseButton1Click:Connect(click)
end

local function addButton(text, y, click)
    local b = Instance.new("TextButton", content)
    b.Size = UDim2.new(1, -10, 0, 40)
    b.Position = UDim2.new(0, 5, 0, y)
    b.Text = text
    b.TextColor3 = Color3.new(1,1,1)
    b.BackgroundColor3 = Color3.fromRGB(math.random(100,200),math.random(100,200),math.random(100,200))
    b.BorderSizePixel = 0
    b.MouseButton1Click:Connect(click)
end

-- Kategoriler
addSideButton("🚀 Oyuncu", function()
    content:ClearAllChildren()
    addButton("Fly", 0, function()
        loadstring(game:HttpGet("https://pastebin.com/raw/yL8iP7C4"))() -- Basit çalışan Fly
    end)
    addButton("Noclip", 50, function()
        loadstring(game:HttpGet("https://pastebin.com/raw/7P4hQvGj"))()
    end)
end)

addSideButton("🚗 Araç", function()
    content:ClearAllChildren()
    addButton("Araç Renk Değiştir", 0, function()
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
end)

addSideButton("🤣 Troll", function()
    content:ClearAllChildren()
    addButton("Joker Kahkaha (Tüm Server)", 0, function()
        local s = Instance.new("Sound", workspace)
        s.SoundId = "rbxassetid://5041354913"
        s.Volume = 10
        s:Play()
    end)
    addButton("Bass Ses (Tüm Server)", 50, function()
        local s = Instance.new("Sound", workspace)
        s.SoundId = "rbxassetid://142376088"
        s.Volume = 10
        s:Play()
    end)
end)

-- Başlangıç: Oyuncu sekmesi seçili
side:FindFirstChildOfClass("TextButton").MouseButton1Click:Fire()
