local player = game.Players.LocalPlayer
local mouse = player:GetMouse()

-- Panel oluştur
local ScreenGui = Instance.new("ScreenGui", player.PlayerGui)
ScreenGui.Name = "AvonyxHub"

local mainFrame = Instance.new("Frame", ScreenGui)
mainFrame.Size = UDim2.new(0, 400, 0, 250)
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -125)
mainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
mainFrame.Active = true
mainFrame.Draggable = true

-- Küçült butonu
local minimizeBtn = Instance.new("TextButton", mainFrame)
minimizeBtn.Size = UDim2.new(0, 50, 0, 25)
minimizeBtn.Position = UDim2.new(1, -55, 0, 5)
minimizeBtn.Text = "-"
minimizeBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)

-- Soldaki kutucuklar
local leftFrame = Instance.new("Frame", mainFrame)
leftFrame.Size = UDim2.new(0, 100, 1, -35)
leftFrame.Position = UDim2.new(0, 0, 0, 35)
leftFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)

-- Sağdaki içerik
local rightFrame = Instance.new("Frame", mainFrame)
rightFrame.Size = UDim2.new(1, -100, 1, -35)
rightFrame.Position = UDim2.new(0, 100, 0, 35)
rightFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)

-- Kutucuklar ve fonksiyonları
local buttons = {
    {Name = "Fly", Action = function()
        -- Basit Fly fonksiyonu
        local flying = false
        local bg, bv

        local function startFly()
            flying = true
            local hrp = player.Character:WaitForChild("HumanoidRootPart")
            bg = Instance.new("BodyGyro", hrp)
            bg.P = 9e4
            bg.MaxTorque = Vector3.new(9e9,9e9,9e9)
            bg.CFrame = hrp.CFrame

            bv = Instance.new("BodyVelocity", hrp)
            bv.Velocity = Vector3.new(0,0,0)
            bv.MaxForce = Vector3.new(9e9,9e9,9e9)

            game:GetService("RunService").Heartbeat:Connect(function()
                if flying then
                    bg.CFrame = CFrame.new(hrp.Position, hrp.Position + mouse.Hit.lookVector)
                    bv.Velocity = mouse.Hit.lookVector * 50
                end
            end)
        end

        local function stopFly()
            flying = false
            if bg then bg:Destroy() end
            if bv then bv:Destroy() end
        end

        if not flying then
            startFly()
        else
            stopFly()
        end
    end},
    {Name = "Rainbow", Action = function()
        while wait(0.1) do
            local char = player.Character
            if char then
                for _,v in pairs(char:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.BrickColor = BrickColor.Random()
                    end
                end
            end
        end
    end}
}

-- Buton oluştur
for i,btn in ipairs(buttons) do
    local b = Instance.new("TextButton", leftFrame)
    b.Size = UDim2.new(1, 0, 0, 40)
    b.Position = UDim2.new(0, 0, 0, (i-1)*45)
    b.Text = btn.Name
    b.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    b.MouseButton1Click:Connect(btn.Action)
end

-- Küçültme işlevi
minimizeBtn.MouseButton1Click:Connect(function()
    mainFrame.Visible = false
end)

-- Ekrana "Hoşgeldin" yazısı (isteğe bağlı)
local welcome = Instance.new("TextLabel", ScreenGui)
welcome.Size = UDim2.new(0, 300, 0, 50)
welcome.Position = UDim2.new(0.5, -150, 0, 100)
welcome.Text = "Hoşgeldin Kardeşim - AvonyxHub"
welcome.TextColor3 = Color3.fromRGB(255, 255, 255)
welcome.BackgroundTransparency = 1
welcome.TextScaled = true

delay(5, function()
    welcome:Destroy()
end)
