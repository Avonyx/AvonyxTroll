-- AvonyXkarpuzHup Modern Panel

local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local LeftMenu = Instance.new("Frame")
local RightPanel = Instance.new("Frame")
local Title = Instance.new("TextLabel")

local TrollButton = Instance.new("TextButton")
local FlyButton = Instance.new("TextButton")
local RainbowButton = Instance.new("TextButton")
local SoundButton = Instance.new("TextButton")

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.Name = "AvonyXkarpuzHup"

-- Main Frame
MainFrame.Parent = ScreenGui
MainFrame.Size = UDim2.new(0, 500, 0, 300)
MainFrame.Position = UDim2.new(0.25, 0, 0.25, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
MainFrame.Active = true
MainFrame.Draggable = true

-- Title
Title.Parent = MainFrame
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Title.Text = "AvonyXkarpuzHup"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 20

-- Left Menu
LeftMenu.Parent = MainFrame
LeftMenu.Size = UDim2.new(0, 120, 1, -30)
LeftMenu.Position = UDim2.new(0, 0, 0, 30)
LeftMenu.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

-- Right Panel
RightPanel.Parent = MainFrame
RightPanel.Size = UDim2.new(1, -120, 1, -30)
RightPanel.Position = UDim2.new(0, 120, 0, 30)
RightPanel.BackgroundColor3 = Color3.fromRGB(70, 70, 70)

-- Left Buttons
local function createMenuButton(name, yPos)
    local btn = Instance.new("TextButton")
    btn.Parent = LeftMenu
    btn.Size = UDim2.new(1, -10, 0, 40)
    btn.Position = UDim2.new(0, 5, 0, yPos)
    btn.Text = name
    btn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    return btn
end

local trollBtn = createMenuButton("Troll", 10)
local flyBtn = createMenuButton("Fly", 60)
local rainbowBtn = createMenuButton("Rainbow", 110)

-- Add functionality
trollBtn.MouseButton1Click:Connect(function()
    for _, v in pairs(RightPanel:GetChildren()) do if v:IsA("TextButton") then v:Destroy() end end

    local soundBtn = Instance.new("TextButton")
    soundBtn.Parent = RightPanel
    soundBtn.Size = UDim2.new(0, 200, 0, 40)
    soundBtn.Position = UDim2.new(0, 20, 0, 20)
    soundBtn.Text = "Play Joker Laugh"
    soundBtn.MouseButton1Click:Connect(function()
        local s = Instance.new("Sound", game.Workspace)
        s.SoundId = "rbxassetid://138186576"
        s.Volume = 10
        s:Play()
    end)
end)

flyBtn.MouseButton1Click:Connect(function()
    for _, v in pairs(RightPanel:GetChildren()) do if v:IsA("TextButton") then v:Destroy() end end

    local flyStart = Instance.new("TextButton")
    flyStart.Parent = RightPanel
    flyStart.Size = UDim2.new(0, 200, 0, 40)
    flyStart.Position = UDim2.new(0, 20, 0, 20)
    flyStart.Text = "Enable Fly"
    flyStart.MouseButton1Click:Connect(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxHackerYT/FlyScript/main/Fly.lua"))()
    end)
end)

rainbowBtn.MouseButton1Click:Connect(function()
    for _, v in pairs(RightPanel:GetChildren()) do if v:IsA("TextButton") then v:Destroy() end end

    local rainbowStart = Instance.new("TextButton")
    rainbowStart.Parent = RightPanel
    rainbowStart.Size = UDim2.new(0, 200, 0, 40)
    rainbowStart.Position = UDim2.new(0, 20, 0, 20)
    rainbowStart.Text = "Activate Rainbow Name"
    rainbowStart.MouseButton1Click:Connect(function()
        local player = game.Players.LocalPlayer
        while true do
            player.Character.Humanoid.DisplayName = "AvonyXkarpuzHup"
            player.Character.Humanoid.DisplayName = string.format("<font color='#%02X%02X%02X'>%s</font>", math.random(255), math.random(255), math.random(255), "AvonyXkarpuzHup")
            wait(0.1)
        end
    end)
end)

-- Açılış müziği
local startSound = Instance.new("Sound", game.Workspace)
startSound.SoundId = "rbxassetid://9118823103"
startSound.Volume = 10
startSound:Play()
