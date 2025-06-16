-- AvonyXkarpuzHup Modern Brookhaven Panel

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "AvonyXkarpuzHup"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0,450,0,350)
frame.Position = UDim2.new(0.25,0,0.2,0)
frame.BackgroundColor3 = Color3.fromRGB(30,30,30)
frame.Active = true
frame.Draggable = true
frame.Parent = gui

-- Kapat & Küçült
local close = Instance.new("TextButton",frame)
close.Size = UDim2.new(0,30,0,30)
close.Position = UDim2.new(1,-35,0,5)
close.Text = "X"
close.BackgroundColor3 = Color3.fromRGB(200,0,0)
close.TextColor3 = Color3.new(1,1,1)
close.MouseButton1Click:Connect(function() gui:Destroy() end)

local min = Instance.new("TextButton",frame)
min.Size = UDim2.new(0,30,0,30)
min.Position = UDim2.new(1,-80,0,5)
min.Text = "-"
min.BackgroundColor3 = Color3.fromRGB(200,200,0)
min.TextColor3 = Color3.new(0,0,0)
min.MouseButton1Click:Connect(function()
    for _,v in ipairs(frame:GetChildren()) do
        if v:IsA("TextButton") and v~=close and v~=min then v.Visible = not v.Visible end
    end
end)

-- Açılış ses ve hoşgeldin
game.StarterGui:SetCore("ChatMakeSystemMessage", {
    Text = "[AvonyXkarpuzHup] Hoşgeldin kardeşim!";
    Color = Color3.fromRGB(0,255,170);
})
local openSound = Instance.new("Sound",gui)
openSound.SoundId = "rbxassetid://9118828563"
openSound.Volume = 4
openSound:Play()

-- Sol kutucuk menü
local function addButton(text, y, func)
    local btn = Instance.new("TextButton",frame)
    btn.Size = UDim2.new(0,120,0,35)
    btn.Position = UDim2.new(0,10,0,y)
    btn.Text = text
    btn.BackgroundColor3 = Color3.fromRGB(50,50,50)
    btn.TextColor3 = Color3.new(1,1,1)
    btn.MouseButton1Click:Connect(func)
    return btn
end

-- Özellikler

-- 1) Mobil Fly
addButton("Mobil Fly",65,function()
    if not _G.__fly then
        _G.__fly = true
        local HRP = player.Character:WaitForChild("HumanoidRootPart")
        local bg,bv = Instance.new("BodyGyro",HRP), Instance.new("BodyVelocity",HRP)
        bg.MaxTorque = Vector3.new(9e9,9e9,9e9); bg.P=10000
        bv.MaxForce = Vector3.new(9e9,9e9,9e9)
        coroutine.wrap(function()
            while _G.__fly do
                local cf = workspace.CurrentCamera.CFrame
                bg.CFrame = cf
                bv.Velocity = cf.LookVector * 50
                game:GetService("RunService").RenderStepped:Wait()
            end
        end)()
    else
        _G.__fly = false
        local HRP = player.Character:FindFirstChild("HumanoidRootPart")
        if HRP then
            for _,v in ipairs(HRP:GetChildren()) do
                if v:IsA("BodyGyro") or v:IsA("BodyVelocity") then v:Destroy() end
            end
        end
    end
end)

-- 2) Troll Sesler
addButton("Joker Kahkaha",110,function()
    local s=Instance.new("Sound",workspace)
    s.SoundId="rbxassetid://7149254326"; s.Volume=10; s:Play()
end)
addButton("Bass Boost",150,function()
    local s=Instance.new("Sound",workspace)
    s.SoundId="rbxassetid://183763502"; s.Volume=10; s:Play()
end)

-- 3) Araç Renk
addButton("Araç Renkleri",195,function()
    for _,v in ipairs(workspace:GetDescendants()) do
        if v:IsA("BasePart") and v.Parent.Name:match("Vehicle") then
            v.BrickColor=BrickColor.Random()
        end
    end
end)

-- Rainbow isim
spawn(function()
    local lbl = player.Character and player.Character:FindFirstChild("Humanoid")
    while wait(0.3) and player.Character and lbl do
        player.Character.Humanoid.DisplayName = "[AvonyXkarpuzHup]"
    end
end)
