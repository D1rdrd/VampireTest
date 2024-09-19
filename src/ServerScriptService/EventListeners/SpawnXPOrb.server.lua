-- Listen to the event being triggered
local createXPOrbEvent = game.ReplicatedStorage.SpawnXPOrbEvent

createXPOrbEvent.Event:Connect(function(positionToSpawn)
	-- Copy the XP Orb object template
	local orb = game.ServerStorage:FindFirstChild("XPOrb"):clone()
	-- Set its position
	orb.Position = positionToSpawn
	-- Add its respective folder to the workspace
	orb.Parent = workspace:WaitForChild("XP")
	
end)
