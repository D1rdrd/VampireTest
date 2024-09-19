-- Modules
local StatTracker = game.Workspace.Scripts.StatTracker

-- Events
local createXPOrbEvent = game.ReplicatedStorage:WaitForChild("SpawnXPOrbEvent")
local spawnBasicProjectileEvent = game.ReplicatedStorage:WaitForChild("SpawnProjectileEvent")

-- Variables
local player = game.Players.LocalPlayer
local humanoidRootPart = player.Character:WaitForChild("HumanoidRootPart")
local fireInterval = 1  -- Time between firing projectiles (1 second)


local projectileTemplate = game.ReplicatedStorage:FindFirstChild("BasicProjectile")

-- Fire a projectile every second
while true do
	local mouse = player:GetMouse().Hit.p	
	local playerPosition = humanoidRootPart.Position
	
	spawnBasicProjectileEvent:FireServer(playerPosition, mouse)
	wait(fireInterval)
end




















--[[
-- Function to handle collision
local function onProjectileHit(hitPart, projectile)
	-- Check if the hit object is an enemy
	if hitPart.Parent and hitPart.Parent:FindFirstChild("EnemyCube") then
		local enemy = hitPart

		-- Destroy the projectile on the client
		projectile:Destroy()
		-- Optionally, handle other client-side things like XP or visual effects
		createXPOrbEvent:FireServer(enemy)
	end
end
]]--

-- Projectile client side
--[[
-- Function to create and fire a projectile
local function fireProjectile()
	
	-- Create the projectile (a simple part)
	local projectile = projectileTemplate:Clone()
	
	-- Get player position, and add offset to it
	local playerPosition = humanoidRootPart.Position
	local offset = Vector3.new(0, -2, 0)
	local projectileSpawnPosition = playerPosition + offset
	-- Set color green on the projectile
	projectile.BrickColor = BrickColor.new("Bright green")
	
	projectile.Position = projectileSpawnPosition

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
	game.Debris:AddItem(projectile, 5)
end
]]--