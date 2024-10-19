local module = {}

module.IncreaseAttribute = function(player, attributeName, increment)
	increment = increment or 0.1 -- Default value
	player:SetAttribute(attributeName, player:GetAttribute(attributeName) + increment)
	
	-- Debug:
	print("Debug: Upgraded " .. attributeName .. " of " .. player.Name .. " by " .. increment)
	
	-- Special cases
	
	-- Update Player's Speed
	if attributeName == "PlayerSpeedMultiplier" then
		player.character.Humanoid.WalkSpeed = 16 * player:GetAttribute("PlayerSpeedMultiplier")
	end
	
	-- Update Player's Health
	if attributeName == "PlayerHealthMultiplier" then
		local health = 100 * player:GetAttribute("PlayerHealthMultiplier")
		player.character.Humanoid.MaxHealth = health
		-- Add the missing health to the player
		player.character.Humanoid.Health = player.character.Humanoid.Health + health
	end
end

return module
