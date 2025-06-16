local player = game.Players.LocalPlayer

-- Rainbow name
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

-- Hoşgeldin yazısı + bildirim sesi
local sg = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
local text = Instance.new("TextLabel", sg)
text.Size = UDim2.new(1,0,0,100)
text.Position = UDim2.new(0,0,0.4,0)
text.Text = "Hoşgeldin Kardeşim"
text.TextScaled = true
text.TextColor3 = Color3.new(1,1,1)
text.BackgroundTransparency = 1
text.Font = Enum.Font.SourceSansBold

local notif = Instance.new("Sound", workspace)
notif.SoundId = "rbxassetid://15666462" -- iPhone bildirim sesi
notif.Volume = 5
notif:Play()
game.Debris:AddItem(notif, 5)

-- Panel
local frame = Instance.new("Frame", sg)
frame.Size = UDim2.new(0, 300, 0, 400)
frame.Position = UDim2.new(0.5, -150, 0.5, -200)
frame.BackgroundColor3 = Color3.fromRGB(30,30,30)

local uilist = Instance.new("UIListLayout", frame)
uilist.Padding = UDim.new(0, 5)

local sounds = {
    {"Joker Kahkaha", "9129313469"},
    {"Bass", "142376088"},
    {"Discord Sövüş", "1843523601"},
    {"Anime Sesi", "153352699"},
    {"İnleme Sesi", "27697743"},
    {"Ah Sesi", "27697743"}, -- Örnek aynı ID, değiştirilebilir
    {"Kefo Wanda Nara", "1843523601"}, -- Örnek ID, değiştir
    {"Basslı Ses", "142376088"},
    {"Küfür", "1843523601"} -- Örnek ID, değiştir
}

for _, s in pairs(sounds) do
    local btn = Instance.new("TextButton", frame)
    btn.Size = UDim2.new(1, 0, 0, 35)
    btn.Text = s[1]
    btn.TextColor3 = Color3.new(1,1,1)
    btn.BackgroundColor3 = Color3.fromRGB(50,50,50)
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

-- Infinite Yield
loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
