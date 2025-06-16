local sg = Instance.new("ScreenGui", game.Players.LocalPlayer:WaitForChild("PlayerGui"))
sg.Name = "AvonyXHupPanel"

local frame = Instance.new("ScrollingFrame", sg)
frame.Size = UDim2.new(0, 400, 0, 300)
frame.Position = UDim2.new(0.5, -200, 0.5, -150)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 4
frame.ScrollBarThickness = 10

local uigrad = Instance.new("UIGradient", frame)
uigrad.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
	ColorSequenceKeypoint.new(0.33, Color3.fromRGB(0, 255, 0)),
	ColorSequenceKeypoint.new(0.66, Color3.fromRGB(0, 0, 255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 255))
}

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 50)
title.Text = "🌈 AvonyXHup Owner 🌈"
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundTransparency = 1
title.Font = Enum.Font.SourceSansBold
title.TextScaled = true

local logo = Instance.new("TextLabel", frame)
logo.Size = UDim2.new(0, 100, 0, 50)
logo.Position = UDim2.new(0.5, -50, 0, 50)
logo.Text = "🅐🅚"
logo.TextColor3 = Color3.new(1,1,1)
logo.BackgroundTransparency = 1
logo.Font = Enum.Font.SourceSansBold
logo.TextScaled = true

local function rainbowText(lbl)
	while true do
		for h = 0, 1, 0.01 do
			lbl.TextColor3 = Color3.fromHSV(h, 1, 1)
			wait(0.05)
		end
	end
end
spawn(function() rainbowText(title) end)
spawn(function() rainbowText(logo) end)

local function createButton(text, func, posY)
	local btn = Instance.new("TextButton", frame)
	btn.Size = UDim2.new(0.8, 0, 0, 40)
	btn.Position = UDim2.new(0.1, 0, 0, posY)
	btn.Text = text
	btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	btn.TextColor3 = Color3.new(1,1,1)
	btn.Font = Enum.Font.SourceSansBold
	btn.TextScaled = true
	btn.MouseButton1Click:Connect(func)
end

local posY = 110

createButton("🌈 Herkesin İsmini Değiştir", function()
	for _,p in pairs(game.Players:GetPlayers()) do
		p.DisplayName = "🌈 AvonyXHup Owner"
	end
end, posY)

posY = posY + 50
createButton("🚀 Gelişmiş Fly (Sen)", function()
	local plr = game.Players.LocalPlayer
	local char = plr.Character or plr.CharacterAdded:Wait()
	local hrp = char:WaitForChild("HumanoidRootPart")
	local bv = Instance.new("BodyVelocity", hrp)
	bv.MaxForce = Vector3.new(1e5,1e5,1e5)
	game:GetService("RunService").RenderStepped:Connect(function()
		local move = Vector3.new()
		if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.W) then
			move = move + (hrp.CFrame.LookVector * 50)
		end
		if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.S) then
			move = move - (hrp.CFrame.LookVector * 50)
		end
		if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.A) then
			move = move - (hrp.CFrame.RightVector * 50)
		end
		if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.D) then
			move = move + (hrp.CFrame.RightVector * 50)
		end
		if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.Space) then
			move = move + Vector3.new(0,50,0)
		end
		if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl) then
			move = move - Vector3.new(0,50,0)
		end
		bv.Velocity = move
	end)
end, posY)

posY = posY + 50
createButton("🛫 Tüm Oyunculara Uçma Ver", function()
	for _,p in pairs(game.Players:GetPlayers()) do
		if p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
			local bv = Instance.new("BodyVelocity", p.Character.HumanoidRootPart)
			bv.MaxForce = Vector3.new(1e5,1e5,1e5)
			bv.Velocity = Vector3.new(0,50,0)
		end
	end
end, posY)

posY = posY + 50
createButton("🎵 Tüm Sunucuya Ses Yay", function()
	local s = Instance.new("Sound", workspace)
	s.SoundId = "rbxassetid://142376088"
	s.Volume = 10
	s:Play()
end, posY)

posY = posY + 50
createButton("💀 Herkesi Öldür", function()
	for _,p in pairs(game.Players:GetPlayers()) do
		if p.Character and p.Character:FindFirstChild("Humanoid") then
			p.Character.Humanoid.Health = 0
		end
	end
end, posY)

posY = posY + 50
createButton("🏠 Ev Banını Kaldır", function()
	if workspace:FindFirstChild("BanList") then
		workspace.BanList:Destroy()
	end
end, posY)

posY = posY + 50
createButton("🔗 Discord Linki Kopyala", function()
	setclipboard("discord.gg/avonyxkarpuz")
end, posY)

print("✅ AvonyX IceHup Gelişmiş Panel Yüklendi!")
