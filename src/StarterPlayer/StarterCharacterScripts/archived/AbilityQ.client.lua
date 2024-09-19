-- Modules
local UIController = require(game:GetService("Workspace"):WaitForChild("Scripts").UIController)
local StatTracker = require(game:GetService("Workspace"):WaitForChild("Scripts").StatTracker)

-- Variables
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local projectilesFolder = workspace:WaitForChild("Projectiles")
local fireInterval = 5  -- Time between firing projectiles (1 second)

-- Function to handle collision
local function onProjectileHit(hitPart, projectile)
	-- Check if the hit object is an enemy
	if hitPart.Parent and hitPart.Parent:FindFirstChild("EnemyCube") then
		-- Destroy the enemy
		hitPart.Parent:Destroy()
		StatTracker.killCountIncrease()
	end
end



-- Function to get the mouse position in the world
local function getMouseDirection()
	local mouse = player:GetMouse()
	local mousePosition = mouse.Hit.p  -- World position of the mouse
	local playerPosition = humanoidRootPart.Position
	-- Direction vector
	local directionVector = (mousePosition - playerPosition).unit

	directionVector = Vector3.new(directionVector.X, 0, directionVector.Z).Unit

	return directionVector  
end

-- Function to create and fire a projectile
local function fireProjectile()
	-- Create the projectile (a simple part)
	local projectile = Instance.new("Part")
	projectile.Size = Vector3.new(10, 1, 3)
	-- Set projectile color blue
	projectile.BrickColor = BrickColor.new("Deep blue")
	projectile.Anchored = false
	projectile.CanCollide = false
	projectile.Shape = Enum.PartType.Block
	-- Set the projectile rotation based on the mouse direction
	local mouseDirection = getMouseDirection()
	projectile.CFrame = CFrame.new(projectile.Position, projectile.Position + mouseDirection)

	-- Get player position, and add offset to it
	local playerPosition = humanoidRootPart.Position
	local offset = Vector3.new(0, -2, 0)
	local projectileSpawnPosition = playerPosition + offset
	
	
	projectile.Position = projectileSpawnPosition
	
	-- Stop projectile from falling
	projectile.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
	
	-- Get direction towards mouse and set velocity
	local direction = getMouseDirection()
	local bodyVelocity = Instance.new("BodyVelocity")
	bodyVelocity.Velocity = direction * 50  -- Adjust speed as necessary
	bodyVelocity.P = 1000  -- Adjust as necessary
	bodyVelocity.Parent = projectile

	projectile.Parent = projectilesFolder

	-- Detect collisions
	projectile.Touched:Connect(function(hit)
		onProjectileHit(hit, projectile)
	end)

	-- Destroy the projectile after 5 seconds
	game.Debris:AddItem(projectile, 10)
end


local canFire = true

while true do
	
	UIController.updateQAbilityIndicator(canFire)
	
	-- Fire a projectile every time Q key is pressed
	local userInputService = game:GetService("UserInputService")
	userInputService.InputBegan:Connect(function(input, gameProcessedEvent)
		if input.KeyCode == Enum.KeyCode.Q then
			if canFire == true then
				fireProjectile()
				canFire = false
								
				wait(5)
				canFire = true
				
				print("Q ready")				
			end			
		end
	end)
	
	wait(0.1)
	
	
end




