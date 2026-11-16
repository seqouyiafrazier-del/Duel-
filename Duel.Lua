-- Clean Roblox Studio Admin Menu Template
-- Place in StarterGui as a LocalScript

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Remove old menu if it exists
if playerGui:FindFirstChild("AdminMenu") then
	playerGui.AdminMenu:Destroy()
end

-- Create GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AdminMenu"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 280, 0, 350)
mainFrame.Position = UDim2.new(0.5, -140, 0.5, -175)
mainFrame.BackgroundColor3 = Color3.fromRGB(20,20,30)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0,15)
corner.Parent = mainFrame

-- Gradient
local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(40,40,70)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(10,10,20))
}
gradient.Rotation = 90
gradient.Parent = mainFrame

-- Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,0,0,60)
title.BackgroundTransparency = 1
title.Text = "ADMIN MENU"
title.TextColor3 = Color3.fromRGB(0,200,255)
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.Parent = mainFrame

-- Divider
local divider = Instance.new("Frame")
divider.Size = UDim2.new(.8,0,0,2)
divider.Position = UDim2.new(.1,0,0,60)
divider.BackgroundColor3 = Color3.fromRGB(0,200,255)
divider.BorderSizePixel = 0
divider.Parent = mainFrame


local menuOpen = true

-- Button creator
local function createButton(name,text,y,callback)

	local button = Instance.new("TextButton")
	button.Name = name
	button.Size = UDim2.new(.85,0,0,50)
	button.Position = UDim2.new(.075,0,0,y)
	button.BackgroundColor3 = Color3.fromRGB(50,50,90)
	button.Text = text
	button.TextColor3 = Color3.fromRGB(255,255,255)
	button.TextScaled = true
	button.Font = Enum.Font.Gotham
	button.BorderSizePixel = 0
	button.Parent = mainFrame

	local btnCorner = Instance.new("UICorner")
	btnCorner.CornerRadius = UDim.new(0,10)
	btnCorner.Parent = button

	local active = false

	button.MouseEnter:Connect(function()
		button.BackgroundColor3 = Color3.fromRGB(0,150,220)
	end)

	button.MouseLeave:Connect(function()
		if not active then
			button.BackgroundColor3 = Color3.fromRGB(50,50,90)
		end
	end)

	button.MouseButton1Click:Connect(function()

		active = not active

		if active then
			button.BackgroundColor3 = Color3.fromRGB(0,200,100)
		else
			button.BackgroundColor3 = Color3.fromRGB(50,50,90)
		end

		if callback then
			callback(active)
		end
	end)

	return button
end


-- Admin buttons
createButton(
	"KickButton",
	"KICK PLAYER",
	80,
	function(enabled)
		print("Kick menu:", enabled)
		-- Add your kick system here
	end
)


createButton(
	"BanButton",
	"BAN PLAYER",
	145,
	function(enabled)
		print("Ban menu:", enabled)
		-- Add your ban system here
	end
)


createButton(
	"SettingsButton",
	"SETTINGS",
	210,
	function(enabled)
		print("Settings:", enabled)
		-- Add your settings here
	end
)


createButton(
	"ToolsButton",
	"ADMIN TOOLS",
	275,
	function(enabled)
		print("Tools:", enabled)
		-- Add your admin tools here
	end
)


-- Toggle menu with M
UserInputService.InputBegan:Connect(function(input, processed)

	if processed then return end

	if input.KeyCode == Enum.KeyCode.M then
		menuOpen = not menuOpen
		mainFrame.Visible = menuOpen
	end

end)


print("Admin Menu Loaded - Press M to open/close")
