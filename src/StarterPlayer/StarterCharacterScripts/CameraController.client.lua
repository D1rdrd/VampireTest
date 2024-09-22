-- This camera controller it's ok, but it really use some help.
-- Would also be fine to have it like this, it's not a priority.

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

local camera = workspace.CurrentCamera
camera.CameraType = Enum.CameraType.Scriptable  -- Set camera to scriptable mode

-- Variables for adjusting the camera
local birdViewHeight = 50  -- Initial height of the camera
local distanceFromPlayer = 20  -- Initial distance from the player on the X-axis
local minDistance = 10  -- Minimum zoom-in distance
local maxDistance = 50  -- Maximum zoom-out distance

-- Key bindings for adjustment (W, S to change height)
local UserInputService = game:GetService("UserInputService")

-- Function to update camera position
local function setBirdView()
	local offset = Vector3.new(distanceFromPlayer, birdViewHeight, 0)  -- Adjustable offset
	local cameraPosition = humanoidRootPart.Position + offset

	camera.CFrame = CFrame.new(cameraPosition, humanoidRootPart.Position)  -- Set camera to look down at player
end

-- Mouse wheel zoom functionality
UserInputService.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseWheel then
		-- Adjust zoom level based on mouse wheel movement
		distanceFromPlayer = distanceFromPlayer - input.Position.Z * 5  -- Multiply to control zoom speed

		-- Clamp the zoom to the minimum and maximum distance
		distanceFromPlayer = math.clamp(distanceFromPlayer, minDistance, maxDistance)
	end
end)

-- Continuously update the camera to follow the player and adjust the view
game:GetService("RunService").RenderStepped:Connect(function()
	setBirdView()
end)
