-- Client-side projectile collision handling
--local ReplicatedStorage = game:GetService("ReplicatedStorage")
--local enemyKilledEvent = ReplicatedStorage:WaitForChild("EnemyKilledEvent")

-- Function to handle projectile collisions on the client
local function handleProjectileCollision(hit, projectile)
	if hit and hit.Parent and hit.Parent:FindFirstChild("EnemyCube") then
		local enemy = hit

		-- Destroy the projectile and enemy immediately on the client for visual feedback
		projectile:Destroy()
		enemy:Destroy()

		-- Notify the server to confirm the enemy kill and handle server-side logic
		--enemyKilledEvent:FireServer(enemy)
			
		print("-----------")
		print("Client: Enemy and projectile destroyed")
	end
end

-- Function to handle each projectile's Touched event
local function handleProjectile(projectile)
	projectile.Touched:Connect(function(hit)
		handleProjectileCollision(hit, projectile)
	end)
end

-- Listen for new projectiles being added to the Workspace and connect the Touched event
game.Workspace.Projectiles.ChildAdded:Connect(function(projectile)
	handleProjectile(projectile)
end)
