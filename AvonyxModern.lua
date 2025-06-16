local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player.PlayerGui)
gui.Name = "AvonyXkarpuzHup"
gui.ResetOnSpawn = false

local bar = Instance.new("Frame", gui)
bar.Size = UDim2.new(0, 160, 1, 0)
bar.Position = UDim2.new(0, 0, 0, 0)
bar.BackgroundColor3 = Color3.fromHSV(0,1,1)

spawn(function()
    while wait() do
        bar.BackgroundColor3 = Color3.fromHSV(tick() % 5 / 5, 1, 1)
    end
end)

local yOffset = 0

local function createButton(name, action)
    local btn = Instance.new("TextButton", bar)
    btn.Size = UDim2.new(1, 0, 0, 30)
    btn.Position = UDim2.new(0, 0, 0, yOffset)
    btn.Text = name
    btn.TextColor3 = Color3.new(1,1,1)
    btn.BackgroundColor3 = Color3.fromRGB(50,50,50)
    btn.MouseButton1Click:Connect(action)
    yOffset = yOffset + 35
end

-- Kapat
createButton("❌ Kapat", function()
    gui:Destroy()
end)

-- Küçült
createButton("➖ Küçült", function()
    bar.Visible = not bar.Visible
end)

-- ESP
createButton("👀 ESP Aç", function()
    for _, plr in pairs(game.Players:GetPlayers()) do
        if plr ~= player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            local box = Instance.new("BoxHandleAdornment", plr.Character.HumanoidRootPart)
            box.Size = Vector3.new(4,6,2)
            box.Adornee = plr.Character.HumanoidRootPart
            box.AlwaysOnTop = true
            box.ZIndex = 10
            box.Color3 = Color3.fromRGB(255,0,0)
            box.Transparency = 0.5
        end
    end
end)

-- GodMode
createButton("💀 GodMode Aç", function()
    if player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.Name = "GodHumanoid"
    end
end)

-- Fly
createButton("🚀 Mobil Fly Aç", function()
    local hrp = player.Character:WaitForChild("HumanoidRootPart")
    local bv = Instance.new("BodyVelocity", hrp)
    bv.MaxForce = Vector3.new(1e9,1e9,1e9)
    bv.Velocity = Vector3.new(0,0,0)
    game:GetService("RunService").RenderStepped:Connect(function()
        bv.Velocity = workspace.CurrentCamera.CFrame.LookVector * 50 + Vector3.new(0,30,0)
    end)
end)

-- Araç renklendir
createButton("🚗 Araç Renk Random", function()
    for _, v in pairs(workspace:GetChildren()) do
        if v:IsA("Model") and v:FindFirstChild("VehicleSeat") then
            for _, p in pairs(v:GetDescendants()) do
                if p:IsA("BasePart") then
                    p.BrickColor = BrickColor.Random()
                end
            end
        end
    end
end)

-- Hız arttır
createButton("⚡ Hız 100", function()
    if player.Character:FindFirstChildOfClass("Humanoid") then
        player.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = 100
    end
end)

-- Rainbow isim
spawn(function()
    while wait(0.5) do
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.DisplayName = "[🌈 AvonyXkarpuz 🌈]"
        end
    end
end)

-- Açılış ekranı ve sesi
local opening = Instance.new("TextLabel", gui)
opening.Size = UDim2.new(0, 400, 0, 100)
opening.Position = UDim2.new(0.5, -200, 0.3, 0)
opening.Text = "🌟 AvonyXkarpuz Hup Başlatıldı 🌟"
opening.TextScaled = true
opening.BackgroundTransparency = 1

local s = Instance.new("Sound", workspace)
s.SoundId = "rbxassetid://594319143"
s.Volume = 5
s:Play()
wait(5)
opening:Destroy()
