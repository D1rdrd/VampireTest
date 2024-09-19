-- Listen to the event being triggered
game.ReplicatedStorage.SpawnProjectileEvent.OnServerEvent:Connect(function(player, playerPosition, mousePosition)
    -- Copy the XP Orb object template
	local projectile = game.ServerStorage.Projectiles.Bullet:Clone()
	
	-- Set its player attribute to the player's name
	projectile:SetAttribute("Player", player.Name)
	
	projectile.Parent = workspace.Projectiles -- Add it to the Workspace	
	projectile:SetNetworkOwner(player) -- Set network ownership to the player
	
	-- Set its position to the player's position with an offset	
	projectile.Position = Vector3.new(
		playerPosition.X, 
		2, -- Height of the projectile
		playerPosition.Z
	)
	
	-- Set projectile direction and velocity
	projectile.BodyVelocity.Velocity = Vector3.new(
		mousePosition.X - playerPosition.X,
		0, -- Maintain the same height
		mousePosition.Z - playerPosition.Z
	).Unit -- Normalize the vector to have a unit length
	* 50 -- Make the projectile don't go shitslow
	* player:GetAttribute("BulletSpeedMultiplier")  -- Grab Bullet Speed from the Player's Attributes
	
    -- Set to destroy the projectile after 5 seconds
	game.Debris:AddItem(projectile, 5)
	-- * It may be nice to have a BulletDurationMultiplier, need to account for the bullet lifespan aswell
	
end)
