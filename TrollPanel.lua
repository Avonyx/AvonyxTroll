-- AvonyXkarpuzHup Modern Panel
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local CloseButton = Instance.new("TextButton")
local MinimizeButton = Instance.new("TextButton")

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.Name = "AvonyXkarpuzHup"

MainFrame.Size = UDim2.new(0, 400, 0, 300)
MainFrame.Position = UDim2.new(0.3, 0, 0.3, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
MainFrame.Draggable = true
MainFrame.Active = true
MainFrame.Parent = ScreenGui

-- Close Button
CloseButton.Size = UDim2.new(0, 50, 0, 25)
CloseButton.Position = UDim2.new(1, -55, 0, 5)
CloseButton.Text = "X"
CloseButton.Parent = MainFrame
CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Minimize Button
MinimizeButton.Size = UDim2.new(0, 50, 0, 25)
MinimizeButton.Position = UDim2.new(1, -110, 0, 5)
MinimizeButton.Text = "-"
MinimizeButton.Parent = MainFrame
MinimizeButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

-- Hoşgeldin mesaj + ses
game.StarterGui:SetCore("ChatMakeSystemMessage", {
    Text = "[AvonyXkarpuzHup] Hoşgeldin kardeşim!";
    Color = Color3.fromRGB(255, 255, 0);
})
local sound = Instance.new("Sound", game.Players.LocalPlayer:WaitForChild("PlayerGui"))
sound.SoundId = "rbxassetid://9118828563" -- iphone bildirim sesi
sound:Play()

-- Rainbow isim
spawn(function()
    local plr = game.Players.LocalPlayer
    while wait(0.5) do
        local color = Color3.fromHSV(tick()%5/5, 1, 1)
        pcall(function()
            plr.Character.Head.BillboardGui.TextLabel.TextColor3 = color
        end)
    end
end)

-- Sol kutucuklar (örnek Fly / Troll / Araç)
local function createButton(name, posY, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 120, 0, 30)
    btn.Position = UDim2.new(0, 10, 0, posY)
    btn.Text = name
    btn.Parent = MainFrame
    btn.MouseButton1Click:Connect(callback)
end

-- Mobil Fly
createButton("Mobil Fly", 40, function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)

-- Troll Ses 1
createButton("Joker Kahkaha", 80, function()
    local s = Instance.new("Sound", game.Workspace)
    s.SoundId = "rbxassetid://7149254326"
    s.Volume = 10
    s:Play()
end)

-- Araç renk
createButton("Araç Renk Değiştir", 120, function()
    for _, v in pairs(game:GetService("Workspace").Vehicles:GetChildren()) do
        for _, p in pairs(v:GetDescendants()) do
            if p:IsA("BasePart") then
                p.BrickColor = BrickColor.Random()
            end
        end
    end
end)

-- Daha fazla troll ses örneği eklenebilir

