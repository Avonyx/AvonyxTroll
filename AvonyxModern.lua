local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player.PlayerGui)
gui.Name = "AvonyXModern"
gui.ResetOnSpawn = false

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 600, 0, 400)
frame.Position = UDim2.new(0.5, -300, 0.5, -200)
frame.BackgroundColor3 = Color3.fromHSV(0,1,1)
frame.Active = true
frame.Draggable = true

spawn(function()
    while wait() do
        frame.BackgroundColor3 = Color3.fromHSV(tick() % 5 / 5, 1, 1)
    end
end)

local opening = Instance.new("TextLabel", gui)
opening.Size = UDim2.new(0, 400, 0, 100)
opening.Position = UDim2.new(0.5, -200, 0.3, 0)
opening.Text = "🌈 AvonyX Modern Hile Açıldı 🌈"
opening.TextScaled = true
opening.BackgroundTransparency = 1

local s = Instance.new("Sound", workspace)
s.SoundId = "rbxassetid://594319143" -- Ahhh sesi
s.Volume = 5
s:Play()
wait(5)
opening:Destroy()

-- Karakter ismini değiştir
spawn(function()
    while wait(0.5) do
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.DisplayName = "[🌈 AvonyXkarpuzHups 🌈]"
        end
    end
end)

-- Kategoriler
local categories = {
    {name="Fly", func=function()
        local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            local bv = Instance.new("BodyVelocity", hrp)
            local bg = Instance.new("BodyGyro", hrp)
            bv.MaxForce = Vector3.new(1e9,1e9,1e9)
            bg.MaxTorque = Vector3.new(1e9,1e9,1e9)
            bv.Velocity = Vector3.new(0,0,0)
            game:GetService("RunService").RenderStepped:Connect(function()
                if hrp then
                    bv.Velocity = hrp.CFrame.LookVector * 100 + Vector3.new(0,50,0)
                    bg.CFrame = workspace.CurrentCamera.CFrame
                end
            end)
        end
    end},
    {name="Sesler", func=function()
        local sesler = {
            {name="Joker Kahkaha", id="7149254326"},
            {name="Bass", id="1843146094"},
            {name="Anime Sesi", id="6706032957"},
            {name="Kefo Wanda Nara", id="8724729001"},
            {name="Basslı Ses", id="1843146094"},
            {name="Küfür", id="9122278204"}
        }
        for i,ses in ipairs(sesler) do
            local b = Instance.new("TextButton", frame)
            b.Size = UDim2.new(0, 150, 0, 30)
            b.Position = UDim2.new(0, 120, 0, 10 + (i-1)*35)
            b.Text = ses.name
            b.MouseButton1Click:Connect(function()
                local snd = Instance.new("Sound", workspace)
                snd.SoundId = "rbxassetid://"..ses.id
                snd.Volume = 10
                snd:Play()
            end)
        end
    end}
}

-- Kategori butonları
for i, cat in ipairs(categories) do
    local btn = Instance.new("TextButton", frame)
    btn.Size = UDim2.new(0, 100, 0, 30)
    btn.Position = UDim2.new(0, 10, 0, 10 + (i-1)*35)
    btn.Text = cat.name
    btn.MouseButton1Click:Connect(cat.func)
end
