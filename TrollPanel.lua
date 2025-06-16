-- AvonyXkarpuzHup | Modern Brookhaven GUI
-- GUI başlangıç kodu

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
MainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.2, 0, 0.2, 0)
MainFrame.Size = UDim2.new(0, 500, 0, 300)
MainFrame.Active = true
MainFrame.Draggable = true

TabsFrame.Name = "TabsFrame"
TabsFrame.Parent = MainFrame
TabsFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
TabsFrame.BorderSizePixel = 0
TabsFrame.Size = UDim2.new(0, 100, 1, 0)

ContentFrame.Name = "ContentFrame"
ContentFrame.Parent = MainFrame
ContentFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
ContentFrame.BorderSizePixel = 0
ContentFrame.Position = UDim2.new(0, 100, 0, 0)
ContentFrame.Size = UDim2.new(1, -100, 1, 0)

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
    if ContentFrame.Visible then
        ContentFrame.Visible = false
        TabsFrame.Visible = false
    else
        ContentFrame.Visible = true
        TabsFrame.Visible = true
    end
end)

-- Örnek tab ve butonlar
local function createTab(name, callback)
    local button = Instance.new("TextButton")
    button.Text = name
    button.Parent = TabsFrame
    button.Size = UDim2.new(1, 0, 0, 50)
    button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    button.MouseButton1Click:Connect(callback)
end

createTab("Troll", function()
    print("Troll özellikleri seçildi")
end)

createTab("Fly", function()
    print("Fly özellikleri seçildi")
end)

createTab("Araç", function()
    print("Araç özellikleri seçildi")
end)

createTab("Görünüm", function()
    print("Görünüm özellikleri seçildi")
end)

-- Karakter RP ismi rainbow yap
spawn(function()
    while wait(0.5) do
        local player = game.Players.LocalPlayer
        if player and player.Character then
            player.Character:FindFirstChildOfClass("Humanoid").DisplayName = "<font color=\"rgb("..math.random(0,255)..","..math.random(0,255)..","..math.random(0,255)..")\">AvonyXkarpuzHup</font>"
        end
    end
end)

-- Açılış sesi
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://9118828566" -- iPhone bildirim sesi örnek
sound.Volume = 5
sound.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
sound:Play()
