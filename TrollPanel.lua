-- AvonyXkarpuz Modern Brookhaven Hilesi

local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()

-- GUI Başlat
local gui = Instance.new("ScreenGui", player.PlayerGui)
gui.Name = "AvonyXModernHub"

local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 550, 0, 400)
main.Position = UDim2.new(0.5, -275, 0.5, -200)
main.BackgroundColor3 = Color3.fromRGB(30,30,30)
main.Active = true
main.Draggable = true
main.BorderSizePixel = 0
main.ClipsDescendants = true

-- Başlık
local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "🌈 AvonyXkarpuz Brookhaven Hub 🌈"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
title.TextScaled = true

-- Açılış Müziği
local sound = Instance.new("Sound", player:WaitForChild("PlayerGui"))
sound.SoundId = "rbxassetid://1843529636" -- Örnek: iPhone bildirim sesi
sound.Volume = 5
sound:Play()

-- Scroll alanı
local scroll = Instance.new("ScrollingFrame", main)
scroll.Size = UDim2.new(1, 0, 1, -40)
scroll.Position = UDim2.new(0, 0, 0, 40)
scroll.CanvasSize = UDim2.new(0, 0, 0, 1000)
scroll.ScrollBarThickness = 8
scroll.BackgroundColor3 = Color3.fromRGB(35,35,35)

-- Buton yapıcı
local function createButton(text, yPos, callback)
    local btn = Instance.new("TextButton", scroll)
    btn.Size = UDim2.new(1, -10, 0, 50)
    btn.Position = UDim2.new(0, 5, 0, yPos)
    btn.Text = text
    btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    btn.TextColor3 = Color3.new(1,1,1)
    btn.TextScaled = true
    btn.BorderSizePixel = 0
    btn.MouseButton1Click:Connect(callback)
end

local y = 0

-- Mobil Fly (dokunma tuşları için basit fly)
createButton("Mobil Fly Aç/Kapat", y, function()
    local flying = false
    local bv = Instance.new("BodyVelocity", char.HumanoidRootPart)
    bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)

    local userInput = game:GetService("UserInputService")
    flying = not flying

    if flying then
        bv.Velocity = Vector3.new(0,50,0)
    else
        bv:Destroy()
    end
end)
y = y + 60

-- Speed
createButton("Speed x3 / Normal", y, function()
    local hum = char:FindFirstChildOfClass("Humanoid")
    if hum then
        hum.WalkSpeed = hum.WalkSpeed > 16 and 16 or 48
    end
end)
y = y + 60

-- NoClip
local noclip = false
createButton("NoClip Aç/Kapat", y, function()
    noclip = not noclip
end)
game:GetService("RunService").Stepped:Connect(function()
    if noclip then
        for _,v in pairs(char:GetDescendants()) do
            if v:IsA("BasePart") then
                v.CanCollide = false
            end
        end
    end
end)
y = y + 60

-- Rainbow isim
createButton("RP İsmini Rainbow Yap", y, function()
    while true do
        for i = 0, 1, 0.1 do
            char.Head.BrickColor = BrickColor.new(Color3.fromHSV(i, 1, 1))
            wait(0.1)
        end
    end
end)
y = y + 60

-- Paneli küçült / kapat
createButton("Paneli Küçült", y, function()
    main.Visible = not main.Visible
end)
y = y + 60
