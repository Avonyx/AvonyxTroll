-- AvonyX SanderXY Panel (Modern Panel)

local Players = game:GetService("Players")
local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "AvonyX_SanderXY"
gui.Parent = player:WaitForChild("PlayerGui")
gui.ResetOnSpawn = false

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 600, 0, 400)
frame.Position = UDim2.new(0.5, -300, 0.5, -200)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.Parent = gui
frame.Active = true
frame.Draggable = true

-- Kapat & Küçült
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -35, 0, 5)
closeBtn.Text = "X"
closeBtn.Parent = frame
closeBtn.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

local minBtn = Instance.new("TextButton")
minBtn.Size = UDim2.new(0, 30, 0, 30)
minBtn.Position = UDim2.new(1, -70, 0, 5)
minBtn.Text = "-"
minBtn.Parent = frame
minBtn.MouseButton1Click:Connect(function()
    frame.Visible = not frame.Visible
end)

-- Sol Menü
local menu = Instance.new("Frame")
menu.Size = UDim2.new(0, 150, 1, -40)
menu.Position = UDim2.new(0, 10, 0, 40)
menu.BackgroundTransparency = 0.5
menu.BackgroundColor3 = Color3.fromRGB(50,50,50)
menu.Parent = frame

local function addButton(txt, y, func)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 30)
    btn.Position = UDim2.new(0, 0, 0, y)
    btn.Text = txt
    btn.Parent = menu
    btn.MouseButton1Click:Connect(func)
end

-- Fly (mobil uyumlu)
addButton("Mobil Fly", 0, function()
    local hrp = player.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    local bv = Instance.new("BodyVelocity", hrp)
    bv.MaxForce = Vector3.new(1e5,1e5,1e5)
    bv.Velocity = Vector3.new(0,0,0)

    local running = true
    game:GetService("UserInputService").InputBegan:Connect(function(input)
        if input.KeyCode == Enum.KeyCode.W then
            bv.Velocity = Vector3.new(0,0,60)
        end
    end)
    game:GetService("UserInputService").InputEnded:Connect(function(input)
        if input.KeyCode == Enum.KeyCode.W then
            bv.Velocity = Vector3.new(0,0,0)
        end
    end)
end)

-- Rainbow isim
addButton("Rainbow İsim", 40, function()
    spawn(function()
        while true do
            player.Character.Humanoid.DisplayName = "[🌈 AvonyX 🌈]"
            wait(0.5)
        end
    end)
end)

-- Araç renk
addButton("Araç Renk", 80, function()
    for _,v in ipairs(workspace:GetDescendants()) do
        if v:IsA("BasePart") and v.Parent:FindFirstChild("VehicleSeat") then
            v.BrickColor = BrickColor.Random()
        end
    end
end)

-- Joker kahkaha
addButton("Joker Kahkaha", 120, function()
    local s = Instance.new("Sound", workspace)
    s.SoundId = "rbxassetid://7149254326"
    s.Volume = 10
    s:Play()
end)

-- Açılış mesaj
game.StarterGui:SetCore("ChatMakeSystemMessage", {
    Text = "[AvonyX SanderXY Panel Açıldı!]",
    Color = Color3.fromRGB(0,255,0)
})
