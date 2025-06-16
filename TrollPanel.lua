-- AvonyXkarpuzHup | Modern Rainbow Brookhaven GUI

local RunService = game:GetService("RunService")
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TabsFrame = Instance.new("Frame")
local ContentFrame = Instance.new("Frame")
local CloseButton = Instance.new("TextButton")
local MinimizeButton = Instance.new("TextButton")

ScreenGui.Name = "AvonyXkarpuzHup"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.2, 0, 0.2, 0)
MainFrame.Size = UDim2.new(0, 600, 0, 400)
MainFrame.Active = true
MainFrame.Draggable = true

TabsFrame.Name = "TabsFrame"
TabsFrame.Parent = MainFrame
TabsFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
TabsFrame.BorderSizePixel = 0
TabsFrame.Size = UDim2.new(0, 120, 1, 0)

ContentFrame.Name = "ContentFrame"
ContentFrame.Parent = MainFrame
ContentFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ContentFrame.BorderSizePixel = 0
ContentFrame.Position = UDim2.new(0, 120, 0, 0)
ContentFrame.Size = UDim2.new(1, -120, 1, 0)

CloseButton.Name = "CloseButton"
CloseButton.Parent = MainFrame
CloseButton.Text = "X"
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -30, 0, 0)
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

MinimizeButton.Name = "MinimizeButton"
MinimizeButton.Parent = MainFrame
MinimizeButton.Text = "-"
MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
MinimizeButton.Position = UDim2.new(1, -60, 0, 0)
MinimizeButton.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
MinimizeButton.MouseButton1Click:Connect(function()
    ContentFrame.Visible = not ContentFrame.Visible
    TabsFrame.Visible = not TabsFrame.Visible
end)

local function clearContent()
    for _, child in ipairs(ContentFrame:GetChildren()) do
        if not child:IsA("UIListLayout") then
            child:Destroy()
        end
    end
end

local function createContent(text)
    clearContent()
    local label = Instance.new("TextLabel")
    label.Text = text
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.TextColor3 = Color3.new(1,1,1)
    label.TextScaled = true
    label.Parent = ContentFrame
end

local function createTab(name, action)
    local button = Instance.new("TextButton")
    button.Text = name
    button.Parent = TabsFrame
    button.Size = UDim2.new(1, 0, 0, 40)
    button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    button.TextColor3 = Color3.new(1,1,1)
    button.MouseButton1Click:Connect(action)
end

createTab("Troll", function()
    createContent("Troll Özellikleri Açıldı")
end)

createTab("Fly", function()
    createContent("Fly Özellikleri Açıldı")
end)

createTab("Araç", function()
    createContent("Araç Özellikleri Açıldı")
end)

createTab("Görünüm", function()
    createContent("Görünüm Özellikleri Açıldı")
end)

-- Rainbow Panel Rengi
spawn(function()
    while RunService.RenderStepped:Wait() do
        local h = tick() % 5 / 5
        local color = Color3.fromHSV(h, 1, 1)
        MainFrame.BackgroundColor3 = color
    end
end)

-- Rainbow İsim
spawn(function()
    while wait(0.5) do
        local player = game.Players.LocalPlayer
        if player and player.Character then
            local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.DisplayName = "🌈 AvonyXkarpuzHup 🌈"
            end
        end
    end
end)

-- Açılış sesi (iPhone bildirim)
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://9118828566"
sound.Volume = 5
sound.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
sound:Play()
