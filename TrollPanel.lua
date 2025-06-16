local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()

local gui = Instance.new("ScreenGui", player.PlayerGui)
gui.Name = "AvonyXkarpuzGumballHub"

local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 500, 0, 400)
main.Position = UDim2.new(0.5, -250, 0.5, -200)
main.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
main.Active = true
main.Draggable = true

local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "🌈 AvonyXkarpuz Gumball Hub 🌈"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
title.TextScaled = true

local scroll = Instance.new("ScrollingFrame", main)
scroll.Size = UDim2.new(1, 0, 1, -40)
scroll.Position = UDim2.new(0, 0, 0, 40)
scroll.CanvasSize = UDim2.new(0, 0, 0, 800)
scroll.ScrollBarThickness = 8
scroll.BackgroundColor3 = Color3.fromRGB(45, 45, 45)

-- Buton fonksiyonu
local function createButton(text, yPos, callback)
    local btn = Instance.new("TextButton", scroll)
    btn.Size = UDim2.new(1, -10, 0, 40)
    btn.Position = UDim2.new(0, 5, 0, yPos)
    btn.Text = text
    btn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    btn.TextColor3 = Color3.new(1,1,1)
    btn.TextScaled = true
    btn.MouseButton1Click:Connect(callback)
end

-- Fly özelliği
local flying = false
local bg, bv
createButton("Fly Aç / Kapat", 0, function()
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    if not flying then
        flying = true
        bg = Instance.new("BodyGyro", hrp)
        bv = Instance.new("BodyVelocity", hrp)
        bg.P = 9e4
        bg.MaxTorque = Vector3.new(9e9,9e9,9e9)
        bv.MaxForce = Vector3.new(9e9,9e9,9e9)

        game:GetService("RunService").Heartbeat:Connect(function()
            if flying and hrp then
                bg.CFrame = CFrame.new(hrp.Position, hrp.Position + player:GetMouse().Hit.lookVector)
                bv.Velocity = player:GetMouse().Hit.lookVector * 50
            end
        end)
    else
        flying = false
        if bg then bg:Destroy() end
        if bv then bv:Destroy() end
    end
end)

-- Speed özelliği
createButton("Speed x3 / Normal", 50, function()
    local hum = char:FindFirstChildOfClass("Humanoid")
    if hum then
        hum.WalkSpeed = hum.WalkSpeed > 16 and 16 or 48
    end
end)

-- NoClip özelliği
local noclip = false
createButton("NoClip Aç / Kapat", 100, function()
    noclip = not noclip
end)

game:GetService("RunService").Stepped:Connect(function()
    if noclip then
        for _,v in pairs(char:GetDescendants()) do
            if v:IsA("BasePart") then
                v.CanCollide = false
            end
        end
    end
end)

-- İsim rainbow
createButton("İsmi Rainbow Yap", 150, function()
    local rpName = char:FindFirstChild("Head"):FindFirstChild("OriginalSize")
    if rpName then
        while wait(0.2) do
            local r = math.random()
            local g = math.random()
            local b = math.random()
            char.Head.BrickColor = BrickColor.new(Color3.new(r,g,b))
        end
    end
end)

