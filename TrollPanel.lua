local player = game.Players.LocalPlayer

-- GUI kur
local sg = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
sg.Name = "AvonyXkarpuzHupPanel"

-- Rainbow isim ve karakter efekti
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
        for _, color in ipairs(colors) do
            pcall(function()
                player.DisplayName = "<font color=\"rgb("..
                    math.floor(color.R*255)..","..
                    math.floor(color.G*255)..","..
                    math.floor(color.B*255)..
                    ")\">AvonyXkarpuzHups</font>"
                for _, part in pairs(player.Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.Color = color
                    end
                end
            end)
            wait(0.2)
        end
    end
end)

-- Ana çerçeve
local mainFrame = Instance.new("Frame", sg)
mainFrame.Size = UDim2.new(0, 450, 0, 600)
mainFrame.Position = UDim2.new(0.5, -225, 0.5, -300)
mainFrame.BackgroundColor3 = Color3.fromRGB(30,30,30)
mainFrame.BorderSizePixel = 3

local layout = Instance.new("UIListLayout", mainFrame)
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.Padding = UDim.new(0, 5)

-- Kutucuk oluştur
local function createBox(name, color)
    local box = Instance.new("Frame", mainFrame)
    box.Size = UDim2.new(1, -10, 0, 150)
    box.BackgroundColor3 = color
    box.BorderSizePixel = 2

    local boxLayout = Instance.new("UIListLayout", box)
    boxLayout.SortOrder = Enum.SortOrder.LayoutOrder
    boxLayout.Padding = UDim.new(0, 3)

    local title = Instance.new("TextLabel", box)
    title.Size = UDim2.new(1,0,0,30)
    title.Text = name
    title.TextColor3 = Color3.new(1,1,1)
    title.BackgroundTransparency = 1
    title.TextScaled = true
    title.Font = Enum.Font.GothamBold

    return box
end

local function createBtn(parent, text, col, callback)
    local btn = Instance.new("TextButton", parent)
    btn.Size = UDim2.new(1, -6, 0, 30)
    btn.Text = text
    btn.BackgroundColor3 = col
    btn.TextColor3 = Color3.new(1,1,1)
    btn.Font = Enum.Font.Gotham
    btn.TextScaled = true
    btn.MouseButton1Click:Connect(callback)
end

-- 🔹 Ana Özellikler Kutusu
local mainBox = createBox("ANA ÖZELLİKLER", Color3.fromRGB(50,50,50))
createBtn(mainBox, "🕊️ Uçuş", Color3.fromRGB(0,150,200), function()
    loadstring(game:HttpGet("https://pastebin.com/raw/sKA4N2J2"))()
end)
createBtn(mainBox, "🚗 Araç Renk Değiştir", Color3.fromRGB(0,200,0), function()
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("VehicleSeat") and v.Parent:IsA("Model") then
            for _, p in pairs(v.Parent:GetDescendants()) do
                if p:IsA("BasePart") then
                    p.BrickColor = BrickColor.Random()
                end
            end
        end
    end
end)

-- 🤡 Troll Kutusu
local trollBox = createBox("TROLL ÖZELLİKLERİ", Color3.fromRGB(100,0,100))
createBtn(trollBox, "👻 jScare", Color3.fromRGB(150,0,150), function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Syntaxx64/jscare/main/main.lua"))()
end)
createBtn(trollBox, "🎵 Bas Efekti", Color3.fromRGB(200,10,10), function()
    local snd = Instance.new("Sound", workspace)
    snd.SoundId = "rbxassetid://142376088"
    snd.Volume = 10
    snd:Play()
    game.Debris:AddItem(snd, 5)
end)
createBtn(trollBox, "🤬 Küfür Sesi", Color3.fromRGB(200,50,0), function()
    local snd = Instance.new("Sound", workspace)
    snd.SoundId = "rbxassetid://1843523601"
    snd.Volume = 10
    snd:Play()
    game.Debris:AddItem(snd, 5)
end)

-- 🧍 Karakter Kutusu
local charBox = createBox("KARAKTER", Color3.fromRGB(70,70,70))
createBtn(charBox, "🧍 Karakter Kopyala", Color3.fromRGB(100,100,100), function()
    local clone = player.Character:Clone()
    clone.Parent = workspace
    clone:SetPrimaryPartCFrame(player.Character.PrimaryPart.CFrame * CFrame.new(3,0,0))
end)

-- ❌ Paneli Kapat
createBtn(mainFrame, "❌ Paneli Kapat", Color3.fromRGB(120,0,0), function()
    sg:Destroy()
end)
