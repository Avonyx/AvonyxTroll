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
s.SoundId = "rbxassetid://12221967" -- iPhone bildirimi
s.Volume = 5
s:Play()
wait(5)
opening:Destroy()

local categories = {"Fly", "Troll", "Araç", "Sesler"}
for i, cat in ipairs(categories) do
    local btn = Instance.new("TextButton", frame)
    btn.Size = UDim2.new(0, 100, 0, 30)
    btn.Position = UDim2.new(0, 10, 0, 10 + (i-1)*35)
    btn.Text = cat
    btn.MouseButton1Click:Connect(function()
        if cat == "Fly" then
            local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                local bv = Instance.new("BodyVelocity", hrp)
                local bg = Instance.new("BodyGyro", hrp)
                bv.MaxForce = Vector3.new(1e5,1e5,1e5)
                bg.MaxTorque = Vector3.new(1e5,1e5,1e5)
                bv.Velocity = Vector3.new(0,50,0)
                game:GetService("UserInputService").InputBegan:Connect(function(input)
                    if input.KeyCode == Enum.KeyCode.W then bv.Velocity = hrp.CFrame.LookVector * 100 end
                end)
            end
        elseif cat == "Troll" then
            spawn(function()
                while wait(0.2) do
                    player.Character.Humanoid.DisplayName = "[🌈 AvonyX 🌈]"
                end
            end)
        elseif cat == "Araç" then
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("BasePart") and v.Parent:FindFirstChildOfClass("VehicleSeat") then
                    v.BrickColor = BrickColor.Random()
                end
            end
        elseif cat == "Sesler" then
            local snd = Instance.new("Sound", workspace)
            snd.SoundId = "rbxassetid://7149254326" -- Joker kahkaha
            snd.Volume = 10
            snd:Play()
        end
    end)
end
