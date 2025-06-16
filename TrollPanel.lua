local player = game.Players.LocalPlayer

-- Rainbow isim
spawn(function()
    local colors = {
        Color3.fromRGB(255,0,0),
        Color3.fromRGB(255,127,0),
        Color3.fromRGB(255,255,0),
        Color3.fromRGB(0,255,0),
        Color3.fromRGB(0,0,255),
        Color3.fromRGB(75,0,130),
        Color3.fromRGB(148,0,211)
    }
    while true do
        for _, color in ipairs(colors) do
            pcall(function()
                player.DisplayName = "<font color=\"rgb("..math.floor(color.R*255)..","..math.floor(color.G*255)..","..math.floor(color.B*255)..")\">AvonyXkarpuzHups</font>"
            end)
            wait(0.3)
        end
    end
end)

-- Hoşgeldin yazısı + iPhone sesi
local sg = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
local text = Instance.new("TextLabel", sg)
text.Size = UDim2.new(1,0,0,100)
text.Position = UDim2.new(0,0,0.4,0)
text.Text = "Hoşgeldin Kardeşim"
text.TextScaled = true
text.TextColor3 = Color3.new(1,1,1)
text.BackgroundTransparency = 1
text.Font = Enum.Font.SourceSansBold
delay(300, function()
    text:Destroy()
end)

local notif = Instance.new("Sound", workspace)
notif.SoundId = "rbxassetid://15666462"
notif.Volume = 5
notif:Play()
game.Debris:AddItem(notif, 5)

-- Panel
local frame = Instance.new("Frame", sg)
frame.Size = UDim2.new(0, 350, 0, 450)
frame.Position = UDim2.new(0.5, -175, 0.5, -225)
frame.BackgroundColor3 = Color3.fromRGB(30,30,30)
frame.BorderSizePixel = 2

local uilist = Instance.new("UIListLayout", frame)
uilist.Padding = UDim.new(0, 5)
uilist.FillDirection = Enum.FillDirection.Vertical
uilist.SortOrder = Enum.SortOrder.LayoutOrder

-- Ses butonları
local sesler = {
    {"🎭 Joker Kahkaha", "9129313469", Color3.fromRGB(200,0,0)},
    {"💥 Bass", "142376088", Color3.fromRGB(0,0,200)},
    {"🤬 Küfür", "1843523601", Color3.fromRGB(200,200,0)},
    {"🎶 Rasgele Ses", "1843523601", Color3.fromRGB(100,0,100)}
}

for _, s in pairs(sesler) do
    local btn = Instance.new("TextButton", frame)
    btn.Size = UDim2.new(1, -10, 0, 40)
    btn.Text = s[1]
    btn.TextColor3 = Color3.new(1,1,1)
    btn.BackgroundColor3 = s[3]
    btn.Font = Enum.Font.SourceSansBold
    btn.TextScaled = true
    btn.MouseButton1Click:Connect(function()
        local snd = Instance.new("Sound", workspace)
        snd.SoundId = "rbxassetid://"..s[2]
        snd.Volume = 10
        snd:Play()
        game.Debris:AddItem(snd, 10)
    end)
end

-- Fly
local flyBtn = Instance.new("TextButton", frame)
flyBtn.Size = UDim2.new(1,-10,0,40)
flyBtn.Text = "🕊️ Uçuş Modu"
flyBtn.TextColor3 = Color3.new(1,1,1)
flyBtn.BackgroundColor3 = Color3.fromRGB(0,200,200)
flyBtn.Font = Enum.Font.SourceSansBold
flyBtn.TextScaled = true
flyBtn.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://pastebin.com/raw/sKA4N2J2"))()
end)

-- Araç renklendir
local aracBtn = Instance.new("TextButton", frame)
aracBtn.Size = UDim2.new(1,-10,0,40)
aracBtn.Text = "🚗 Araç Renk Rastgele"
aracBtn.TextColor3 = Color3.new(1,1,1)
aracBtn.BackgroundColor3 = Color3.fromRGB(0,200,0)
aracBtn.Font = Enum.Font.SourceSansBold
aracBtn.TextScaled = true
aracBtn.MouseButton1Click:Connect(function()
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("VehicleSeat") then
            if v.Parent:IsA("Model") then
                for _, part in pairs(v.Parent:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.BrickColor = BrickColor.Random()
                    end
                end
            end
        end
    end
end)

-- Trolling - jScare
local trollBtn = Instance.new("TextButton", frame)
trollBtn.Size = UDim2.new(1,-10,0,40)
trollBtn.Text = "👻 jScare"
trollBtn.TextColor3 = Color3.new(1,1,1)
trollBtn.BackgroundColor3 = Color3.fromRGB(200,0,200)
trollBtn.Font = Enum.Font.SourceSansBold
trollBtn.TextScaled = true
trollBtn.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Syntaxx64/jscare/main/main.lua"))()
end)

-- Karakter kopyala
local copyBtn = Instance.new("TextButton", frame)
copyBtn.Size = UDim2.new(1,-10,0,40)
copyBtn.Text = "🧍 Karakter Kopyala"
copyBtn.TextColor3 = Color3.new(1,1,1)
copyBtn.BackgroundColor3 = Color3.fromRGB(100,100,100)
copyBtn.Font = Enum.Font.SourceSansBold
copyBtn.TextScaled = true
copyBtn.MouseButton1Click:Connect(function()
    local clone = player.Character:Clone()
    clone.Parent = workspace
    clone:SetPrimaryPartCFrame(player.Character.PrimaryPart.CFrame * CFrame.new(2,0,0))
end)
