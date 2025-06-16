local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "AvonyXBrookhaven"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 500, 0, 300)
frame.Position = UDim2.new(0.5, -250, 0.5, -150)
frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
frame.Active = true
frame.Draggable = true
frame.Parent = gui

local sol = Instance.new("Frame")
sol.Size = UDim2.new(0, 130, 1, 0)
sol.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
sol.Parent = frame

local sağ = Instance.new("Frame")
sağ.Size = UDim2.new(0, 370, 1, 0)
sağ.Position = UDim2.new(0, 130, 0, 0)
sağ.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
sağ.Parent = frame

local function addKutucuk(y, text, action)
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(1, -10, 0, 40)
	btn.Position = UDim2.new(0, 5, 0, y)
	btn.Text = text
	btn.TextColor3 = Color3.new(1, 1, 1)
	btn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
	btn.Parent = sol
	btn.MouseButton1Click:Connect(action)
end

-- Fly
addKutucuk(10, "Fly", function()
	sağ:ClearAllChildren()
	local state = false
	local flyBtn = Instance.new("TextButton")
	flyBtn.Size = UDim2.new(0, 200, 0, 50)
	flyBtn.Position = UDim2.new(0, 20, 0, 20)
	flyBtn.Text = "Fly Aç"
	flyBtn.Parent = sağ

	local bg, bv
	local conn

	flyBtn.MouseButton1Click:Connect(function()
		if not state then
			state = true
			flyBtn.Text = "Fly Kapat"
			bg = Instance.new("BodyGyro", player.Character.HumanoidRootPart)
			bv = Instance.new("BodyVelocity", player.Character.HumanoidRootPart)
			bg.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
			bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
			conn = game:GetService("RunService").RenderStepped:Connect(function()
				if state then
					bg.CFrame = workspace.CurrentCamera.CFrame
					bv.Velocity = workspace.CurrentCamera.CFrame.LookVector * 50
				end
			end)
		else
			state = false
			flyBtn.Text = "Fly Aç"
			if bg then bg:Destroy() end
			if bv then bv:Destroy() end
			if conn then conn:Disconnect() end
		end
	end)
end)

-- ESP
addKutucuk(60, "ESP", function()
	sağ:ClearAllChildren()
	local state = false
	local espList = {}
	local espBtn = Instance.new("TextButton")
	espBtn.Size = UDim2.new(0, 200, 0, 50)
	espBtn.Position = UDim2.new(0, 20, 0, 20)
	espBtn.Text = "ESP Aç"
	espBtn.Parent = sağ

	espBtn.MouseButton1Click:Connect(function()
		if not state then
			state = true
			espBtn.Text = "ESP Kapat"
			for _, p in pairs(game.Players:GetPlayers()) do
				if p ~= player and p.Character and p.Character:FindFirstChild("Head") then
					local b = Instance.new("BillboardGui", p.Character.Head)
					b.Size = UDim2.new(0, 100, 0, 50)
					b.AlwaysOnTop = true
					local t = Instance.new("TextLabel", b)
					t.Size = UDim2.new(1, 0, 1, 0)
					t.BackgroundTransparency = 1
					t.Text = p.Name
					t.TextColor3 = Color3.new(1, 0, 0)
					table.insert(espList, b)
				end
			end
		else
			state = false
			espBtn.Text = "ESP Aç"
			for _, b in pairs(espList) do
				b:Destroy()
			end
			espList = {}
		end
	end)
end)

-- GodMode
addKutucuk(110, "GodMode", function()
	sağ:ClearAllChildren()
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(0, 200, 0, 50)
	btn.Position = UDim2.new(0, 20, 0, 20)
	btn.Text = "GodMode Aktif Et"
	btn.Parent = sağ
	btn.MouseButton1Click:Connect(function()
		player.Character.Humanoid.MaxHealth = math.huge
		player.Character.Humanoid.Health = math.huge
	end)
end)

-- Paneli Küçült
local küçült = Instance.new("TextButton")
küçült.Size = UDim2.new(0, 30, 0, 30)
küçült.Position = UDim2.new(1, -35, 0, 5)
küçült.Text = "-"
küçült.Parent = frame
küçült.MouseButton1Click:Connect(function()
	frame.Visible = not frame.Visible
end)
