local player = game.Players.LocalPlayer

-- Açılış GUI
local openGui = Instance.new("ScreenGui", game.CoreGui)
local openFrame = Instance.new("Frame", openGui)
openFrame.Size = UDim2.new(1, 0, 1, 0)
openFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)

local logo = Instance.new("ImageLabel", openFrame)
logo.Size = UDim2.new(0.2, 0, 0.2, 0)
logo.Position = UDim2.new(0.4, 0, 0.4, 0)
logo.BackgroundTransparency = 1
logo.Image = "rbxassetid://12222225" -- ÖRNEK logo asset ID (kendi logonu yükleyebilirsin)

local sound = Instance.new("Sound", game.SoundService)
sound.SoundId = "rbxassetid://9118828560" -- Açılış sesi
sound.Volume = 5
sound:Play()

-- Dönen logo animasyonu
spawn(function()
    while openGui.Parent do
        logo.Rotation = logo.Rotation + 2
        wait(0.01)
    end
end)

-- 5 saniye bekleme
wait(5)
openGui:Destroy()

-- PANEL GUI
local gui = Instance.new("ScreenGui", game.CoreGui)
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 600, 0, 400)
main.Position = UDim2.new(0.2, 0, 0.2, 0)
main.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
main.Active = true
main.Draggable = true

-- Sol kutucuklar (örnek)
local trollButton = Instance.new("TextButton", main)
trollButton.Size = UDim2.new(0, 120, 0, 50)
trollButton.Position = UDim2.new(0, 10, 0, 10)
trollButton.Text = "Troll"

local flyButton = Instance.new("TextButton", main)
flyButton.Size = UDim2.new(0, 120, 0, 50)
flyButton.Position = UDim2.new(0, 10, 0, 70)
flyButton.Text = "Fly"

local espButton = Instance.new("TextButton", main)
espButton.Size = UDim2.new(0, 120, 0, 50)
espButton.Position = UDim2.new(0, 10, 0, 130)
espButton.Text = "ESP"

-- Örnek Fly
flyButton.MouseButton1Click:Connect(function()
    local flying = true
    local char = player.Character
    local hum = char:FindFirstChildOfClass("Humanoid")
    local root = char:FindFirstChild("HumanoidRootPart")
    local bv = Instance.new("BodyVelocity", root)
    bv.Velocity = Vector3.new(0,0,0)
    bv.MaxForce = Vector3.new(4000,4000,4000)

    game:GetService("UserInputService").InputBegan:Connect(function(input)
        if input.KeyCode == Enum.KeyCode.Space then
            bv.Velocity = Vector3.new(0,50,0)
        elseif input.KeyCode == Enum.KeyCode.W then
            bv.Velocity = char.HumanoidRootPart.CFrame.LookVector * 50
        elseif input.KeyCode == Enum.KeyCode.S then
            bv.Velocity = -char.HumanoidRootPart.CFrame.LookVector * 50
        elseif input.KeyCode == Enum.KeyCode.A then
            bv.Velocity = -char.HumanoidRootPart.CFrame.RightVector * 50
        elseif input.KeyCode == Enum.KeyCode.D then
            bv.Velocity = char.HumanoidRootPart.CFrame.RightVector * 50
        end
    end)
end)

-- Örnek ESP
espButton.MouseButton1Click:Connect(function()
    for i,v in pairs(game.Players:GetPlayers()) do
        if v ~= player and v.Character and v.Character:FindFirstChild("Head") then
            local billboard = Instance.new("BillboardGui", v.Character.Head)
            billboard.Size = UDim2.new(0,100,0,40)
            billboard.Adornee = v.Character.Head
            billboard.AlwaysOnTop = true
            local label = Instance.new("TextLabel", billboard)
            label.Size = UDim2.new(1,0,1,0)
            label.Text = v.Name
            label.TextColor3 = Color3.fromRGB(255,0,0)
            label.BackgroundTransparency = 1
        end
    end
end)

-- Örnek Troll
trollButton.MouseButton1Click:Connect(function()
    local s = Instance.new("Sound", game.Workspace)
    s.SoundId = "rbxassetid://130776150" -- Komik ses
    s.Volume = 10
    s:Play()
end)
