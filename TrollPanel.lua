local player = game.Players.LocalPlayer
local mouse = player:GetMouse()

local gui = Instance.new("ScreenGui", player.PlayerGui)
gui.Name = "AvonyxHub"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 400, 0, 300)
frame.Position = UDim2.new(0.5, -200, 0.5, -150)
frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
frame.Active = true
frame.Draggable = true

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 50)
title.Text = "AvonyXkarpuzHub"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
title.TextScaled = true

local flyButton = Instance.new("TextButton", frame)
flyButton.Size = UDim2.new(0, 100, 0, 40)
flyButton.Position = UDim2.new(0, 10, 0, 60)
flyButton.Text = "Fly"
flyButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)

flyButton.MouseButton1Click:Connect(function()
    local char = player.Character or player.CharacterAdded:Wait()
    local hrp = char:WaitForChild("HumanoidRootPart")

    local flying = true
    local bg = Instance.new("BodyGyro", hrp)
    local bv = Instance.new("BodyVelocity", hrp)
    bg.P = 9e4
    bg.MaxTorque = Vector3.new(9e9,9e9,9e9)
    bg.CFrame = hrp.CFrame
    bv.Velocity = Vector3.new(0,0,0)
    bv.MaxForce = Vector3.new(9e9,9e9,9e9)

    game:GetService("RunService").Heartbeat:Connect(function()
        if flying then
            bg.CFrame = CFrame.new(hrp.Position, hrp.Position + mouse.Hit.lookVector)
            bv.Velocity = mouse.Hit.lookVector * 50
        end
    end)

    flyButton.Text = "Stop Fly"
    flyButton.MouseButton1Click:Connect(function()
        flying = false
        bg:Destroy()
        bv:Destroy()
        flyButton.Text = "Fly"
    end)
end)
