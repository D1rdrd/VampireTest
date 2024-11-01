local Players = game:GetService("Players")

local playerAttributes = game.ReplicatedStorage.Config.StartingPlayerAttributes:GetAttributes()
local weaponAttributes = game.ReplicatedStorage.Config.StartingWeaponAttributes:GetAttributes()

-- Set up the attributes for the player when they join
Players.PlayerAdded:Connect(function(player)
	-- Player Attributes

	-- Add a configuration to the player
	local playerConfiguration = Instance.new("Configuration")
	playerConfiguration.Name = "Attributes"
	playerConfiguration.Parent = player
	
	-- Cycle for each attribute and assign its value to the player
	for attributeName, attributeValue in pairs(playerAttributes) do
		playerConfiguration:SetAttribute(attributeName, attributeValue)
	end

	-- Weapon Attributes

	-- Add a configuration to the player
	local weaponsConfiguration = Instance.new("Configuration")
	weaponsConfiguration.Name = "Weapons"
	weaponsConfiguration.Parent = player

	-- Cycle for each attribute and assign its value to the player
	for attributeName, attributeValue in pairs(weaponAttributes) do
		weaponsConfiguration:SetAttribute(attributeName, attributeValue)
	end

end)