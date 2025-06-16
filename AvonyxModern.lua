local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "BrookhavenTrollMenu"
gui.ResetOnSpawn = false

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 600, 0, 400)
frame.Position = UDim2.new(0.5, -300, 0.5, -200)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
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
    local flying = false
    local btn = Instance.new("TextButton", sağ)
    btn.Size = UDim2.new(0, 200, 0, 50)
    btn.Position = UDim2.new(0, 20, 0, 20)
    btn.Text = "Fly Aç"
    local bg, bv
    btn.MouseButton1Click:Connect(function()
        if not flying then
            flying = true
            btn.Text = "Fly Kapat"
            bg = Instance.new("BodyGyro", player.Character.HumanoidRootPart)
            bv = Instance.new("BodyVelocity", player.Character.HumanoidRootPart)
            bg.MaxTorque = Vector3.new(9e9,9e9,9e9)
            bv.MaxForce = Vector3.new(9e9,9e9,9e9)
            game:GetService("RunService").RenderStepped:Connect(function()
                if flying then
                    bg.CFrame = workspace.CurrentCamera.CFrame
                    bv.Velocity = workspace.CurrentCamera.CFrame.LookVector * 50
                end
            end)
        else
            flying = false
            btn.Text = "Fly Aç"
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
    local btn = Instance.new("TextButton", sağ)
    btn.Size = UDim2.new(0, 200, 0, 50)
    btn.Position = UDim2.new(0, 20, 0, 20)
    btn.Text = "ESP Aç"
    btn.MouseButton1Click:Connect(function()
        if not state then
            state = true
            btn.Text = "ESP Kapat"
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
            btn.Text = "ESP Aç"
            for _, b in pairs(espList) do
                b:Destroy()
            end
            espList = {}
        end
    end)
end)

-- Sesli Troll
addKutucuk(110, "Troll Ses", function()
    sağ:ClearAllChildren()
    local btn = Instance.new("TextButton", sağ)
    btn.Size = UDim2.new(0, 200, 0, 50)
    btn.Position = UDim2.new(0, 20, 0, 20)
    btn.Text = "Ses Çal"
    btn.MouseButton1Click:Connect(function()
        local s = Instance.new("Sound", workspace)
        s.SoundId = "rbxassetid://9118823105"
        s.Volume = 10
        s:Play()
    end)
end)

-- Görünmez Ol
addKutucuk(160, "Görünmez", function()
    sağ:ClearAllChildren()
    local btn = Instance.new("TextButton", sağ)
    btn.Size = UDim2.new(0, 200, 0, 50)
    btn.Position = UDim2.new(0, 20, 0, 20)
    btn.Text = "Görünmez Ol"
    btn.MouseButton1Click:Connect(function()
        for _, p in pairs(player.Character:GetChildren()) do
            if p:IsA("BasePart") then
                p.Transparency = 1
            end
        end
    end)
end)

-- Spin (Döndürme)
addKutucuk(210, "Spin", function()
    sağ:ClearAllChildren()
    local spin = Instance.new("BodyAngularVelocity", player.Character.HumanoidRootPart)
    spin.AngularVelocity = Vector3.new(0,50,0)
    spin.MaxTorque = Vector3.new(0,9e9,0)
end)

-- Platform Altı
addKutucuk(260, "Yerin Altı", function()
    sağ:ClearAllChildren()
    player.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame - Vector3.new(0,50,0)
end)

-- Mini Jump
addKutucuk(310, "Zıplat", function()
    sağ:ClearAllChildren()
    player.Character.Humanoid.JumpPower = 300
    player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
end)

-- Dans
addKutucuk(360, "Dans", function()
    sağ:ClearAllChildren()
    local anim = Instance.new("Animation")
    anim.AnimationId = "rbxassetid://3189773368"
    local track = player.Character.Humanoid:LoadAnimation(anim)
    track:Play()
end)
