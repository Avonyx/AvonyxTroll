-- AvonyXkarpuzHup | Full Brookhaven Hile Paneli
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("ScrollingFrame")
local UICorner = Instance.new("UICorner")
local UIListLayout = Instance.new("UIListLayout")

ScreenGui.Name = "AvonyXkarpuzHup"
ScreenGui.Parent = game.CoreGui

Frame.Name = "MainFrame"
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Frame.Position = UDim2.new(0.25, 0, 0.2, 0)
Frame.Size = UDim2.new(0, 500, 0, 400)
Frame.ScrollBarThickness = 10

UICorner.Parent = Frame
UIListLayout.Parent = Frame
UIListLayout.Padding = UDim.new(0, 5)
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

local function addButton(name, text, func)
    local button = Instance.new("TextButton")
    button.Name = name
    button.Parent = Frame
    button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    button.Size = UDim2.new(1, -10, 0, 50)
    button.Text = text
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextScaled = true
    button.Font = Enum.Font.SourceSansBold
    local corner = Instance.new("UICorner", button)
    button.MouseButton1Click:Connect(func)
end

-- 🎵 Açılış sesi + Hoşgeldin yazısı
local açılışSes = Instance.new("Sound", game.Workspace)
açılışSes.SoundId = "rbxassetid://911882856" -- iphone bildirim sesi
açılışSes.Volume = 5
açılışSes:Play()

local welcome = Instance.new("BillboardGui", game.Players.LocalPlayer.Character.Head)
welcome.Size = UDim2.new(0,200,0,50)
welcome.StudsOffset = Vector3.new(0,3,0)
local wText = Instance.new("TextLabel", welcome)
wText.Size = UDim2.new(1,0,1,0)
wText.BackgroundTransparency = 1
wText.Text = "Hoşgeldin Kardeşim!"
wText.TextColor3 = Color3.fromRGB(255,255,255)
wText.TextScaled = true
wText.Font = Enum.Font.SourceSansBold
game.Players.LocalPlayer.Character.Humanoid.DisplayName = "🌈AvonyXkarpuzHup🌈"
wait(5)
welcome:Destroy()

-- 🚀 ÖZELLİKLER

addButton("Fly", "🕊️ Mobil Fly", function()
    local p = game.Players.LocalPlayer
    local c = p.Character or p.CharacterAdded:Wait()
    local hrp = c:WaitForChild("HumanoidRootPart")
    local bv = Instance.new("BodyVelocity", hrp)
    bv.MaxForce = Vector3.new(1e5, 1e5, 1e5)
    bv.Velocity = Vector3.new(0, 50, 0)
    wait(5)
    bv:Destroy()
end)

addButton("Rainbow", "🌈 Rainbow Karakter + İsim", function()
    local p = game.Players.LocalPlayer
    while true do
        for i = 0, 1, 0.01 do
            p.Character.Humanoid.DisplayName = "🌈AvonyXkarpuzHup🌈"
            p.Character.HumanoidRootPart.BrickColor = BrickColor.new(Color3.fromHSV(i,1,1))
            wait(0.05)
        end
    end
end)

addButton("TrollSound1", "🎭 Joker Kahkaha (Tüm server duyar)", function()
    local s = Instance.new("Sound", game.Workspace)
    s.SoundId = "rbxassetid://1837635154"
    s.Volume = 10
    s:Play()
end)

addButton("TrollSound2", "🔊 Bass Boost (Tüm server duyar)", function()
    local s = Instance.new("Sound", game.Workspace)
    s.SoundId = "rbxassetid://142376088"
    s.Volume = 10
    s:Play()
end)

addButton("VehicleColor", "🚗 Araç Renk Değiştir", function()
    for _,v in pairs(workspace.Vehicles:GetChildren()) do
        if v:FindFirstChild("Body") then
            v.Body.BrickColor = BrickColor.Random()
        end
    end
end)

addButton("Close", "❌ Paneli Kapat", function()
    ScreenGui:Destroy()
end)
