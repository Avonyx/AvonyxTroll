local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player.PlayerGui)
gui.Name = "BrookhavenHilePaneli"
gui.ResetOnSpawn = false

-- Açılış sesi
local açılışSes = Instance.new("Sound", workspace)
açılışSes.SoundId = "rbxassetid://594319143"
açılışSes.Volume = 5
açılışSes:Play()

-- Panel
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 600, 0, 400)
main.Position = UDim2.new(0, 20, 0.5, -200)
main.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
main.Active = true
main.Draggable = true
Instance.new("UICorner", main)

-- Üst bar
local top = Instance.new("Frame", main)
top.Size = UDim2.new(1, 0, 0, 30)
top.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
Instance.new("UICorner", top)

local title = Instance.new("TextLabel", top)
title.Size = UDim2.new(1, -60, 1, 0)
title.Text = "Brookhaven AvonyX Panel"
title.TextColor3 = Color3.new(1,1,1)
title.TextSize = 16
title.Font = Enum.Font.GothamBold
title.BackgroundTransparency = 1

-- Sol kutucuk bar
local side = Instance.new("ScrollingFrame", main)
side.Size = UDim2.new(0, 130, 1, -30)
side.Position = UDim2.new(0, 0, 0, 30)
side.BackgroundColor3 = Color3.fromRGB(25,25,25)
side.ScrollBarThickness = 5
local sideLayout = Instance.new("UIListLayout", side)
sideLayout.Padding = UDim.new(0, 5)

-- Sağ içerik menüsü
local content = Instance.new("Frame", main)
content.Size = UDim2.new(1, -140, 1, -40)
content.Position = UDim2.new(0, 135, 0, 35)
content.BackgroundTransparency = 1

-- Kutucuk fonksiyonu
local function createButton(name, action)
    local btn = Instance.new("TextButton", side)
    btn.Size = UDim2.new(1, -10, 0, 40)
    btn.Text = name
    btn.TextColor3 = Color3.new(1,1,1)
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 14
    btn.BackgroundColor3 = Color3.fromRGB(50,50,50)
    Instance.new("UICorner", btn)
    btn.MouseButton1Click:Connect(action)
end

-- Özellikler
createButton("Fly (PC)", function()
    local hrp = player.Character:WaitForChild("HumanoidRootPart")
    local bv = Instance.new("BodyVelocity", hrp)
    bv.MaxForce = Vector3.new(1e9,1e9,1e9)
    bv.Velocity = Vector3.new(0,0,0)
    local conn = game:GetService("RunService").RenderStepped:Connect(function()
        bv.Velocity = workspace.CurrentCamera.CFrame.LookVector * 50
    end)
    -- İkinci tık kapatma
    createButton("Fly Kapat", function()
        bv:Destroy()
        conn:Disconnect()
    end)
end)

createButton("ESP Aç", function()
    for _, p in pairs(game.Players:GetPlayers()) do
        if p.Character and p.Character:FindFirstChild("HumanoidRootPart") and p ~= player then
            local esp = Instance.new("BoxHandleAdornment", p.Character.HumanoidRootPart)
            esp.Size = Vector3.new(4,6,2)
            esp.Color3 = Color3.fromRGB(255,0,0)
            esp.AlwaysOnTop = true
            esp.ZIndex = 10
            esp.Adornee = p.Character.HumanoidRootPart
            esp.Transparency = 0.4
        end
    end
end)

createButton("Admin: GodMode", function()
    if player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.Name = "GodHumanoid"
    end
end)

createButton("Araçları Sil", function()
    for _, v in pairs(workspace:GetChildren()) do
        if v:IsA("Model") and v:FindFirstChild("VehicleSeat") then
            v:Destroy()
        end
    end
end)

createButton("Troll: Patlama", function()
    local e = Instance.new("Explosion", workspace)
    e.Position = player.Character.HumanoidRootPart.Position
end)

createButton("Troll: Part Spam", function()
    for i=1,20 do
        local p = Instance.new("Part", workspace)
        p.Size = Vector3.new(1,1,1)
        p.Position = player.Character.HumanoidRootPart.Position + Vector3.new(math.random(-10,10),5,math.random(-10,10))
        p.Anchored = false
    end
end)

createButton("Troll: Ses (Herkes Duysun)", function()
    local s = Instance.new("Sound", workspace)
    s.SoundId = "rbxassetid://142376088" -- Meşhur Roblox ses örneği
    s.Volume = 10
    s:Play()
end)

createButton("Workspace Temizle", function()
    for _, v in pairs(workspace:GetChildren()) do
        if not v:IsA("Terrain") and not v:IsA("Camera") then
            v:Destroy()
        end
    end
end)

-- Sahte isim etiketi
local function setFakeName(name)
    if player.Character and not player.Character:FindFirstChild("NameBillboard") then
        local bb = Instance.new("BillboardGui", player.Character)
        bb.Name = "NameBillboard"
        bb.Size = UDim2.new(0,200,0,50)
        bb.Adornee = player.Character:WaitForChild("Head")
        bb.AlwaysOnTop = true
        local text = Instance.new("TextLabel", bb)
        text.Size = UDim2.new(1,0,1,0)
        text.BackgroundTransparency = 1
        text.Text = name
        text.TextColor3 = Color3.new(0,1,0)
        text.TextStrokeTransparency = 0
        text.TextScaled = true
    end
end
setFakeName("BrookhavenHilePaneli")

