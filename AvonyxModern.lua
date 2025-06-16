local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "AvonyXBrookhaven"
gui.ResetOnSpawn = false

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 600, 0, 400)
frame.Position = UDim2.new(0.5, -300, 0.5, -200)
frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
frame.Active = true
frame.Draggable = true

local sol = Instance.new("Frame", frame)
sol.Size = UDim2.new(0, 150, 1, 0)
sol.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

local sağ = Instance.new("Frame", frame)
sağ.Size = UDim2.new(0, 450, 1, 0)
sağ.Position = UDim2.new(0, 150, 0, 0)
sağ.BackgroundColor3 = Color3.fromRGB(60, 60, 60)

local function addKutucuk(y, text, action)
    local btn = Instance.new("TextButton", sol)
    btn.Size = UDim2.new(1, -10, 0, 40)
    btn.Position = UDim2.new(0, 5, 0, y)
    btn.Text = text
    btn.TextColor3 = Color3.new(1,1,1)
    btn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    btn.MouseButton1Click:Connect(action)
end

-- Fly
addKutucuk(10, "Fly", function()
    sağ:ClearAllChildren()
    local state = false
    local flyBtn = Instance.new("TextButton", sağ)
    flyBtn.Size = UDim2.new(0, 200, 0, 50)
    flyBtn.Position = UDim2.new(0, 20, 0, 20)
    flyBtn.Text = "Fly Aç"
    local bg, bv
    flyBtn.MouseButton1Click:Connect(function()
        if not state then
            state = true
            flyBtn.Text = "Fly Kapat"
            bg = Instance.new("BodyGyro", player.Character.HumanoidRootPart)
            bv = Instance.new("BodyVelocity", player.Character.HumanoidRootPart)
            bg.MaxTorque = Vector3.new(9e9,9e9,9e9)
            bv.MaxForce = Vector3.new(9e9,9e9,9e9)
            game:GetService("RunService").RenderStepped:Connect(function()
                if state then
                    bg.CFrame = workspace.CurrentCamera.CFrame
                    bv.Velocity = workspace.CurrentCamera.CFrame.LookVector * 50
                end
            end)
        else
            state = false
            flyBtn.Text = "Fly Aç"
            if bg then bg:Destroy() end
            if bv then bv:Destroy() end
        end
    end)
end)

-- ESP
addKutucuk(60, "ESP", function()
    sağ:ClearAllChildren()
    local state = false
    local espList = {}
    local espBtn = Instance.new("TextButton", sağ)
    espBtn.Size = UDim2.new(0, 200, 0, 50)
    espBtn.Position = UDim2.new(0, 20, 0, 20)
    espBtn.Text = "ESP Aç"
    espBtn.MouseButton1Click:Connect(function()
        if not state then
            state = true
            espBtn.Text = "ESP Kapat"
            for _, p in pairs(game.Players:GetPlayers()) do
                if p ~= player and p.Character and p.Character:FindFirstChild("Head") then
                    local b = Instance.new("BillboardGui", p.Character.Head)
                    b.Size = UDim2.new(0,100,0,50)
                    b.AlwaysOnTop = true
                    local t = Instance.new("TextLabel", b)
                    t.Size = UDim2.new(1,0,1,0)
                    t.BackgroundTransparency = 1
                    t.Text = p.Name
                    t.TextColor3 = Color3.new(1,0,0)
                    table.insert(espList, b)
                end
            end
        else
            state = false
            espBtn.Text = "ESP Aç"
            for _, b in pairs(espList) do
                b:Destroy()
            end
            espList = {}
        end
    end)
end)

-- GodMode
addKutucuk(110, "GodMode", function()
    sağ:ClearAllChildren()
    local btn = Instance.new("TextButton", sağ)
    btn.Size = UDim2.new(0, 200, 0, 50)
    btn.Position = UDim2.new(0, 20, 0, 20)
    btn.Text = "GodMode Aktif Et"
    btn.MouseButton1Click:Connect(function()
        player.Character.Humanoid.MaxHealth = math.huge
        player.Character.Humanoid.Health = math.huge
    end)
end)

-- Boy Uzat
addKutucuk(160, "Boy Uzat", function()
    sağ:ClearAllChildren()
    local btn = Instance.new("TextButton", sağ)
    btn.Size = UDim2.new(0, 200, 0, 50)
    btn.Position = UDim2.new(0, 20, 0, 20)
    btn.Text = "Boyu Uzat"
    btn.MouseButton1Click:Connect(function()
        local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
        if humanoid and humanoid:FindFirstChild("BodyHeightScale") then
            humanoid.BodyHeightScale.Value = humanoid.BodyHeightScale.Value + 0.5
        end
    end)
end)

-- Troll Ses
addKutucuk(210, "Troll Ses", function()
    sağ:ClearAllChildren()
    local btn = Instance.new("TextButton", sağ)
    btn.Size = UDim2.new(0, 200, 0, 50)
    btn.Position = UDim2.new(0, 20, 0, 20)
    btn.Text = "Ses Çal"
    btn.MouseButton1Click:Connect(function()
        local tSes = Instance.new("Sound", workspace)
        tSes.SoundId = "rbxassetid://9118823105" -- İstersen değiştir
        tSes.Volume = 10
        tSes:Play()
    end)
end)

-- Araç Spawn
addKutucuk(260, "Araç", function()
    sağ:ClearAllChildren()
    local btn = Instance.new("TextButton", sağ)
    btn.Size = UDim2.new(0, 200, 0, 50)
    btn.Position = UDim2.new(0, 20, 0, 20)
    btn.Text = "Araç Spawnla"
    btn.MouseButton1Click:Connect(function()
        local car = game:GetService("ReplicatedStorage"):FindFirstChild("Car"):Clone()
        car.Parent = workspace
        car:SetPrimaryPartCFrame(player.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,10))
    end)
end)

-- Dans
addKutucuk(310, "Dans", function()
    sağ:ClearAllChildren()
    local btn = Instance.new("TextButton", sağ)
    btn.Size = UDim2.new(0, 200, 0, 50)
    btn.Position = UDim2.new(0, 20, 0, 20)
    btn.Text = "Dans Et"
    btn.MouseButton1Click:Connect(function()
        local anim = Instance.new("Animation")
        anim.AnimationId = "rbxassetid://3189773368"
        local track = player.Character.Humanoid:LoadAnimation(anim)
        track:Play()
    end)
end)

-- Küçült
local küçült = Instance.new("TextButton", frame)
küçült.Size = UDim2.new(0, 30, 0, 30)
küçült.Position = UDim2.new(1, -35, 0, 5)
küçült.Text = "-"
küçült.MouseButton1Click:Connect(function()
    frame.Visible = not frame.Visible
end)
