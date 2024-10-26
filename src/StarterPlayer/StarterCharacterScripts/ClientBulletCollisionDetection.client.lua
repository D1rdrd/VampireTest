-- Client-side projectile collision handling

-- * Is it tho?
-- It shouldn't be really necessary to do this, but seeing as the
-- delay between the server destroying proyectiles and the player
-- updating its visualization, destroying it first client-side
-- seems like a better solution.

local hitProjectiles = {}

-- Function to handle projectile collisions on the client
local function handleProjectileCollision(hit, projectile)
	if hit and hit.Parent and hit.Parent:FindFirstChild("EnemyCube") then
		-- Check if the projectile has already hit something
		if hitProjectiles[projectile] then
			return  -- Exit if it has already hit something
		end
		
		-- Mark this projectile as having hit something
		hitProjectiles[projectile] = true

		-- Destroy the projectile immediately on the client for visual feedback
		projectile:Destroy()

		-- Fire the health update event only once
		--local enemy = hit
		--game.ReplicatedStorage.Events.UpdateHealthEvent:Fire(enemy, projectile:GetAttribute("Damage"))

		-- Update UI on the client
		-- * Not necessary as it gets updated 

		-- Remove projectile entry from the table
		wait(1)				
		hitProjectiles[projectile] = nil

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