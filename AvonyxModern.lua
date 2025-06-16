-- Gumball Hup Light - Brookhaven
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "GumballHupPC"
gui.ResetOnSpawn = false

-- Ana Çerçeve
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 400, 0, 300)
frame.Position = UDim2.new(0.5, -200, 0.5, -150)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.Active = true
frame.Draggable = true

-- Sol Menü
local sol = Instance.new("Frame", frame)
sol.Size = UDim2.new(0, 120, 1, 0)
sol.BackgroundColor3 = Color3.fromRGB(35, 35, 35)

-- Sağ Panel
local sağ = Instance.new("Frame", frame)
sağ.Size = UDim2.new(0, 280, 1, 0)
sağ.Position = UDim2.new(0, 120, 0, 0)
sağ.BackgroundColor3 = Color3.fromRGB(45, 45, 45)

-- Buton Ekle Fonksiyonu
local function butonEkle(y, yazı, işlem)
    local btn = Instance.new("TextButton", sol)
    btn.Size = UDim2.new(1, -10, 0, 40)
    btn.Position = UDim2.new(0, 5, 0, y)
    btn.Text = yazı
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 18
    btn.MouseButton1Click:Connect(işlem)
end

-- Fly (Infinite Yield üzerinden)
butonEkle(10, "Fly (Infinite Yield)", function()
    sağ:ClearAllChildren()
    local label = Instance.new("TextLabel", sağ)
    label.Size = UDim2.new(1, -20, 0, 60)
    label.Position = UDim2.new(0, 10, 0, 20)
    label.Text = "Infinite Yield yükleniyor..."
    label.BackgroundTransparency = 1
    label.TextColor3 = Color3.new(1,1,1)
    label.TextWrapped = true
    label.Font = Enum.Font.SourceSans
    label.TextSize = 20

    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)

-- ESP Sistemi
butonEkle(60, "ESP", function()
    sağ:ClearAllChildren()
    local aktif = false
    local espList = {}
    local btn = Instance.new("TextButton", sağ)
    btn.Size = UDim2.new(0, 200, 0, 50)
    btn.Position = UDim2.new(0, 20, 0, 20)
    btn.Text = "ESP Aç"
    btn.MouseButton1Click:Connect(function()
        if not aktif then
            aktif = true
            btn.Text = "ESP Kapat"
            for _, p in pairs(game.Players:GetPlayers()) do
                if p ~= player and p.Character and p.Character:FindFirstChild("Head") then
                    local b = Instance.new("BillboardGui", p.Character.Head)
                    b.Size = UDim2.new(0,100,0,50)
                    b.AlwaysOnTop = true
                    local t = Instance.new("TextLabel", b)
                    t.Size = UDim2.new(1,0,1,0)
                    t.BackgroundTransparency = 1
                    t.Text = p.Name
                    t.TextColor3 = Color3.new(1,0,0)
                    table.insert(espList, b)
                end
            end
        else
            aktif = false
            btn.Text = "ESP Aç"
            for _, b in pairs(espList) do
                b:Destroy()
            end
            espList = {}
        end
    end)
end)

-- Brookhaven Otomatik İsim Değiştirici
butonEkle(110, "İsmini Değiştir", function()
    sağ:ClearAllChildren()
    local box = Instance.new("TextBox", sağ)
    box.Size = UDim2.new(0, 200, 0, 40)
    box.Position = UDim2.new(0, 20, 0, 20)
    box.PlaceholderText = "Yeni ismini gir"
    box.Text = ""
    box.TextColor3 = Color3.new(1, 1, 1)
    box.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    box.Font = Enum.Font.SourceSansBold
    box.TextSize = 18

    local btn = Instance.new("TextButton", sağ)
    btn.Size = UDim2.new(0, 200, 0, 40)
    btn.Position = UDim2.new(0, 20, 0, 70)
    btn.Text = "Uygula"
    btn.TextColor3 = Color3.new(1,1,1)
    btn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 18

    btn.MouseButton1Click:Connect(function()
        local chatEvent = nil
        for _, v in pairs(getgc(true)) do
            if typeof(v) == "function" and getfenv(v).script and getfenv(v).script.Name == "NameHandler" then
                chatEvent = getfenv(v).script
                break
            end
        end

        local name = box.Text
        local args = {[1] = "ChangeName",[2] = name}
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(name, "All")

        if chatEvent then
            chatEvent.RemoteEvent:FireServer(unpack(args))
        end
    end)
end)
