-- AvonyXkarpuzHup Brookhaven Panel

local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- PANEL
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AvonyXkarpuzHup"
ScreenGui.Parent = game.CoreGui
ScreenGui.ResetOnSpawn = false

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 500, 0, 300)
Frame.Position = UDim2.new(0.25, 0, 0.25, 0)
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.BackgroundTransparency = 0.2
Frame.Parent = ScreenGui

-- DRAG
local dragging
local dragInput
local dragStart
local startPos

local function update(input)
	local delta = input.Position - dragStart
	Frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
							   startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

Frame.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = input.Position
		startPos = Frame.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

Frame.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement then
		dragInput = input
	end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		update(input)
	end
end)

-- KÜÇÜLTME & KAPATMA
local CloseButton = Instance.new("TextButton")
CloseButton.Text = "X"
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -35, 0, 5)
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
CloseButton.TextColor3 = Color3.new(1,1,1)
CloseButton.Parent = Frame

CloseButton.MouseButton1Click:Connect(function()
	ScreenGui:Destroy()
end)

local MinButton = Instance.new("TextButton")
MinButton.Text = "-"
MinButton.Size = UDim2.new(0, 30, 0, 30)
MinButton.Position = UDim2.new(1, -70, 0, 5)
MinButton.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
MinButton.TextColor3 = Color3.new(0,0,0)
MinButton.Parent = Frame

local minimized = false
MinButton.MouseButton1Click:Connect(function()
	minimized = not minimized
	for _, v in pairs(Frame:GetChildren()) do
		if v:IsA("TextButton") and v ~= MinButton and v ~= CloseButton then
			v.Visible = not minimized
		end
	end
end)

-- ÖRNEK BİR TROLL BUTONU
local TrollButton = Instance.new("TextButton")
TrollButton.Text = "Troll Ses"
TrollButton.Size = UDim2.new(0, 100, 0, 40)
TrollButton.Position = UDim2.new(0, 10, 0, 50)
TrollButton.BackgroundColor3 = Color3.fromRGB(50, 50, 255)
TrollButton.TextColor3 = Color3.new(1,1,1)
TrollButton.Parent = Frame

TrollButton.MouseButton1Click:Connect(function()
	local sound = Instance.new("Sound", player.Character:FindFirstChild("Head") or player.Character:FindFirstChildWhichIsA("BasePart"))
	sound.SoundId = "rbxassetid://183763512" -- Örnek bir ses ID'si (Joker kahkaha)
	sound:Play()
end)

-- Rainbow isim
coroutine.wrap(function()
	while true do
		for i = 0, 1, 0.01 do
			player.Character.Humanoid.DisplayName = "[AvonyXkarpuzHup]"
			wait(0.1)
		end
	end
end)()

-- Açılış sesi
local opensound = Instance.new("Sound", player:WaitForChild("PlayerGui"))
opensound.SoundId = "rbxassetid://9118828560" -- iPhone bildirim sesi
opensound.Volume = 3
opensound:Play()

