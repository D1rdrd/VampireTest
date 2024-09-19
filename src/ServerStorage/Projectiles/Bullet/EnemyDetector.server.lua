-- Events
local enemyKilledEvent = game.ReplicatedStorage.Events.EnemyKilled

-- Function to check collision between projectile and enemy
local function checkCollision(hit, projectile)
	-- Check if the hit part is an enemy
	if hit and hit.Parent and hit.Parent:FindFirstChild("EnemyCube") then
		local enemy = hit
		local enemyPosition = enemy.Position  -- Get the position of the enemy's PrimaryPart
		
		-- Fire the enemy killed event
		enemyKilledEvent:Fire(projectile:GetAttribute("Player"), enemyPosition) 

		-- Destroy the enemy and the projectile
		print("Server: Destroyed enemy at:", enemyPosition, "by", projectile:GetAttribute("Player"))
		enemy:Destroy()  -- Destroy the enemy
		projectile:Destroy()  -- Destroy the projectile
		
	end
end

-- Function to handle each projectile
local function handleProjectile(projectile)
	-- Connect the Touched event for the projectile
	projectile.Touched:Connect(function(hit)
		checkCollision(hit, projectile)
	end)
end

-- Loop through all active projectiles and connect the collision event
for _, projectile in ipairs(game.Workspace.Projectiles:GetChildren()) do
	handleProjectile(projectile)
end