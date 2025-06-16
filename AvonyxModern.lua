-- Gumball Hup (Brookhaven GUI) | ChatGPT Edition

local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "GumballHup"
gui.ResetOnSpawn = false

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 500, 0, 350)
frame.Position = UDim2.new(0.5, -250, 0.5, -175)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.Active = true
frame.Draggable = true

local sol = Instance.new("Frame", frame)
sol.Size = UDim2.new(0, 130, 1, 0)
sol.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

local sağ = Instance.new("Frame", frame)
sağ.Size = UDim2.new(0, 370, 1, 0)
sağ.Position = UDim2.new(0, 130, 0, 0)
sağ.BackgroundColor3 = Color3.fromRGB(60, 60, 60)

local function addButton(y, label, callback)
    local btn = Instance.new("TextButton", sol)
    btn.Size = UDim2.new(1, -10, 0, 40)
    btn.Position = UDim2.new(0, 5, 0, y)
    btn.Text = label
    btn.TextColor3 = Color3.new(1,1,1)
    btn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    btn.MouseButton1Click:Connect(callback)
end

-- Fly
addButton(10, "Fly", function()
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
addButton(60, "ESP", function()
    sağ:ClearAllChildren()
    local espActive = false
    local espObjects = {}
    local btn = Instance.new("TextButton", sağ)
    btn.Size = UDim2.new(0, 200, 0, 50)
    btn.Position = UDim2.new(0, 20, 0, 20)
    btn.Text = "ESP Aç"
    btn.MouseButton1Click:Connect(function()
        if not espActive then
            espActive = true
            btn.Text = "ESP Kapat"
            for _, plr in pairs(game.Players:GetPlayers()) do
                if plr ~= player and plr.Character and plr.Character:FindFirstChild("Head") then
                    local b = Instance.new("BillboardGui", plr.Character.Head)
                    b.Size = UDim2.new(0,100,0,50)
                    b.AlwaysOnTop = true
                    local t = Instance.new("TextLabel", b)
                    t.Size = UDim2.new(1,0,1,0)
                    t.BackgroundTransparency = 1
                    t.Text = plr.Name
                    t.TextColor3 = Color3.new(1,0,0)
                    table.insert(espObjects, b)
                end
            end
        else
            espActive = false
            btn.Text = "ESP Aç"
            for _, b in pairs(espObjects) do
                b:Destroy()
            end
            espObjects = {}
        end
    end)
end)

-- Troll Ses
addButton(110, "Troll Ses", function()
    sağ:ClearAllChildren()
    local btn = Instance.new("TextButton", sağ)
    btn.Size = UDim2.new(0, 200, 0, 50)
    btn.Position = UDim2.new(0, 20, 0, 20)
    btn.Text = "Ses Çal"
    btn.MouseButton1Click:Connect(function()
        local ses = Instance.new("Sound", workspace)
        ses.SoundId = "rbxassetid://9118823105"
        ses.Volume = 10
        ses:Play()
    end)
end)

-- Görünmezlik
addButton(160, "Görünmez Ol", function()
    sağ:ClearAllChildren()
    for _, p in pairs(player.Character:GetDescendants()) do
        if p:IsA("BasePart") then
            p.Transparency = 1
        end
    end
end)

-- Dans
addButton(210, "Dans Et", function()
    sağ:ClearAllChildren()
    local anim = Instance.new("Animation")
    anim.AnimationId = "rbxassetid://3189773368"
    local track = player.Character.Humanoid:LoadAnimation(anim)
    track:Play()
end)
