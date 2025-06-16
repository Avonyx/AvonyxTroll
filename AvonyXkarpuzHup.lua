-- AvonyX SanderXY Style Panel

local Players = game:GetService("Players")
local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "AvonyX_SanderPanel"
gui.ResetOnSpawn = false

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 600, 0, 400)
frame.Position = UDim2.new(0.2, 0, 0.2, 0)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.Active = true
frame.Draggable = true

-- Kapat & Küçült
local closeBtn = Instance.new("TextButton", frame)
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -35, 0, 5)
closeBtn.Text = "X"
closeBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
closeBtn.TextColor3 = Color3.new(1, 1, 1)
closeBtn.MouseButton1Click:Connect(function() gui:Destroy() end)

local minBtn = Instance.new("TextButton", frame)
minBtn.Size = UDim2.new(0, 30, 0, 30)
minBtn.Position = UDim2.new(1, -70, 0, 5)
minBtn.Text = "-"
minBtn.BackgroundColor3 = Color3.fromRGB(200, 200, 0)
minBtn.TextColor3 = Color3.new(0, 0, 0)
minBtn.MouseButton1Click:Connect(function()
    for _,v in ipairs(frame:GetChildren()) do
        if v:IsA("TextButton") and v ~= closeBtn and v ~= minBtn then
            v.Visible = not v.Visible
        end
    end
end)

-- Sol Menü
local menu = Instance.new("Frame", frame)
menu.Size = UDim2.new(0, 150, 1, -40)
menu.Position = UDim2.new(0, 10, 0, 40)
menu.BackgroundTransparency = 1

local function addButton(text, y, func)
    local btn = Instance.new("TextButton", menu)
    btn.Size = UDim2.new(1, 0, 0, 35)
    btn.Position = UDim2.new(0, 0, 0, y)
    btn.Text = text
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.MouseButton1Click:Connect(func)
end

-- Özellikler
addButton("Mobil Fly", 0, function()
    if not _G._fly then
        _G._fly = true
        local hrp = player.Character:WaitForChild("HumanoidRootPart")
        local bg = Instance.new("BodyGyro", hrp)
        local bv = Instance.new("BodyVelocity", hrp)
        bg.MaxTorque = Vector3.new(9e9,9e9,9e9)
        bv.MaxForce = Vector3.new(9e9,9e9,9e9)
        coroutine.wrap(function()
            while _G._fly do
                local cam = workspace.CurrentCamera.CFrame
                bg.CFrame = cam
                bv.Velocity = cam.LookVector * 60
                game:GetService("RunService").RenderStepped:Wait()
            end
        end)()
    else
        _G._fly = false
        local hrp = player.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            for _,v in pairs(hrp:GetChildren()) do
                if v:IsA("BodyGyro") or v:IsA("BodyVelocity") then v:Destroy() end
            end
        end
    end
end)

addButton("Araç Renk Değiştir", 40, function()
    for _,v in ipairs(workspace:GetDescendants()) do
        if v:IsA("BasePart") and v.Parent.Name:match("Vehicle") then
            v.BrickColor = BrickColor.Random()
        end
    end
end)

addButton("Joker Kahkaha", 80, function()
    local s = Instance.new("Sound", workspace)
    s.SoundId = "rbxassetid://7149254326"
    s.Volume = 10
    s:Play()
end)

addButton("Bass Boost", 120, function()
    local s = Instance.new("Sound", workspace)
    s.SoundId = "rbxassetid://183763502"
    s.Volume = 10
    s:Play()
end)

addButton("Rainbow İsim", 160, function()
    spawn(function()
        while player.Character and player.Character:FindFirstChild("Humanoid") do
            player.Character.Humanoid.DisplayName = "[AvonyX SanderXY]"
            wait(0.5)
        end
    end)
end)

-- Açılış mesaj ve ses
game.StarterGui:SetCore("ChatMakeSystemMessage", {
    Text = "[AvonyX SanderXY] Panel Açıldı!";
    Color = Color3.fromRGB(0,255,127)
})
local s = Instance.new("Sound", gui)
s.SoundId = "rbxassetid://9118828563"
s.Volume = 4
s:Play()
