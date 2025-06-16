local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player.PlayerGui)
gui.Name = "AvonyXkarpuzHup"
gui.ResetOnSpawn = false

local mainFrame = Instance.new("Frame", gui)
mainFrame.Size = UDim2.new(0, 600, 0, 450)
mainFrame.Position = UDim2.new(0.5, -300, 0.5, -225)
mainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Instance.new("UICorner", mainFrame)

local topBar = Instance.new("Frame", mainFrame)
topBar.Size = UDim2.new(1, 0, 0, 30)
topBar.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
Instance.new("UICorner", topBar)

local title = Instance.new("TextLabel", topBar)
title.Size = UDim2.new(1, -60, 1, 0)
title.Text = "AvonyXkarpuzHup | Ultimate Panel"
title.TextColor3 = Color3.new(1,1,1)
title.TextSize = 16
title.Font = Enum.Font.GothamBold
title.BackgroundTransparency = 1

local closeBtn = Instance.new("TextButton", topBar)
closeBtn.Size = UDim2.new(0,30,0,30)
closeBtn.Position = UDim2.new(1, -30, 0, 0)
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.new(1,0,0)
closeBtn.BackgroundTransparency = 1
closeBtn.MouseButton1Click:Connect(function() gui:Destroy() end)

local minimizeBtn = Instance.new("TextButton", topBar)
minimizeBtn.Size = UDim2.new(0,30,0,30)
minimizeBtn.Position = UDim2.new(1, -60, 0, 0)
minimizeBtn.Text = "-"
minimizeBtn.TextColor3 = Color3.new(1,1,1)
minimizeBtn.BackgroundTransparency = 1
local minimized = false
minimizeBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    content.Visible = not minimized
end)

local content = Instance.new("ScrollingFrame", mainFrame)
content.Position = UDim2.new(0,10,0,40)
content.Size = UDim2.new(1, -20, 1, -50)
content.CanvasSize = UDim2.new(0,0,0,0)
content.ScrollBarThickness = 6
content.BackgroundTransparency = 1

local grid = Instance.new("UIGridLayout", content)
grid.CellSize = UDim2.new(0,180,0,50)
grid.CellPadding = UDim2.new(0,5,0,5)

local function addFeature(name, action)
    local btn = Instance.new("TextButton", content)
    btn.Text = name
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 14
    btn.TextColor3 = Color3.new(1,1,1)
    btn.BackgroundColor3 = Color3.fromRGB(50,50,50)
    Instance.new("UICorner", btn)
    btn.MouseButton1Click:Connect(action)
end

-- TEMEL ÖZELLİKLER
addFeature("👀 ESP", function()
    for _, plr in pairs(game.Players:GetPlayers()) do
        if plr ~= player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            local box = Instance.new("BoxHandleAdornment", plr.Character.HumanoidRootPart)
            box.Size = Vector3.new(4,6,2)
            box.Adornee = plr.Character.HumanoidRootPart
            box.AlwaysOnTop = true
            box.ZIndex = 10
            box.Color3 = Color3.fromRGB(255,0,0)
            box.Transparency = 0.3
        end
    end
end)

addFeature("💀 GodMode", function()
    if player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.Name = "GodHumanoid"
    end
end)

addFeature("🚀 Mobil Fly (Tam Destekli)", function()
    local hrp = player.Character:WaitForChild("HumanoidRootPart")
    local bv = Instance.new("BodyVelocity", hrp)
    bv.MaxForce = Vector3.new(1e9,1e9,1e9)
    bv.Velocity = Vector3.new(0,0,0)
    game:GetService("RunService").RenderStepped:Connect(function()
        bv.Velocity = workspace.CurrentCamera.CFrame.LookVector * 50 + Vector3.new(0,30,0)
    end)
end)

addFeature("⚡ Speed Hack", function()
    if player.Character:FindFirstChildOfClass("Humanoid") then
        player.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = 100
    end
end)

addFeature("🌀 Karakter Renk Döngüsü", function()
    while true do
        for _, part in pairs(player.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.Color = Color3.fromHSV(tick()%5/5,1,1)
            end
        end
        wait(0.1)
    end
end)

addFeature("🌌 Skybox Değiştir", function()
    local sky = Instance.new("Sky", game.Lighting)
    sky.SkyboxBk = "http://www.roblox.com/asset/?id=159454299"
    sky.SkyboxDn = "http://www.roblox.com/asset/?id=159454296"
    sky.SkyboxFt = "http://www.roblox.com/asset/?id=159454293"
    sky.SkyboxLf = "http://www.roblox.com/asset/?id=159454286"
    sky.SkyboxRt = "http://www.roblox.com/asset/?id=159454300"
    sky.SkyboxUp = "http://www.roblox.com/asset/?id=159454288"
end)

addFeature("🎵 Açılış Sesi", function()
    local s = Instance.new("Sound", workspace)
    s.SoundId = "rbxassetid://594319143"
    s.Volume = 5
    s:Play()
end)

addFeature("🚗 Tüm Araçları Sil", function()
    for _, v in pairs(workspace:GetChildren()) do
        if v:IsA("Model") and v:FindFirstChild("VehicleSeat") then
            v:Destroy()
        end
    end
end)

addFeature("⛔ Oyuncuları Dondur", function()
    for _, plr in pairs(game.Players:GetPlayers()) do
        if plr ~= player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            plr.Character.HumanoidRootPart.Anchored = true
        end
    end
end)

addFeature("🎧 Spam Ses", function()
    for i=1,5 do
        local s = Instance.new("Sound", workspace)
        s.SoundId = "rbxassetid://301964312"
        s.Volume = 10
        s:Play()
        wait(0.5)
    end
end)

addFeature("🔊 iPhone Bildirim", function()
    local s = Instance.new("Sound", workspace)
    s.SoundId = "rbxassetid://12222030"
    s.Volume = 3
    s:Play()
end)

-- Kolayca yeni butonlar eklenebilir...

