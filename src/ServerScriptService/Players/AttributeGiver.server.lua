local Players = game:GetService("Players")

local playerAttributes = game.ReplicatedStorage.Config.PlayerStartingAttributes:GetAttributes()

-- Set up the attributes for the player when they join
Players.PlayerAdded:Connect(function(player)
	-- Cycle for each attribute and assign its value to the player
	for attributeName, attributeValue in pairs(playerAttributes) do
		player:SetAttribute(attributeName, attributeValue)
	end
end)