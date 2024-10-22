-- Client-side projectile collision handling

-- It shouldn't be really necessary to do this, but seeing as the
-- delay between the server destroying proyectiles and the player
-- updating its visualization, destroying it first client-side
-- seems like a better solution.

-- Function to handle projectile collisions on the client
local function handleProjectileCollision(hit, projectile)
	if hit and hit.Parent and hit.Parent:FindFirstChild("EnemyCube") then
		local enemy = hit

		-- Destroy the projectile and enemy immediately on the client for visual feedback
		projectile:Destroy()

		enemy:SetAttribute("Health", enemy:GetAttribute("Health") - projectile:GetAttribute("Damage"))

		if enemy:GetAttribute("Health") <= 0 then
			enemy:Destroy()
		else
			local percentaje = enemy:GetAttribute("Health") / enemy:GetAttribute("MaxHealth")
			enemy.HealthBarGui.CurrentHealth.Size = UDim2.new(percentaje, 0, 1, 0) 
		end

		
			
		-- Debug:
		--print("-----------")
		--print("Client: Enemy and projectile destroyed")
	end
	wait(0.1)
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
