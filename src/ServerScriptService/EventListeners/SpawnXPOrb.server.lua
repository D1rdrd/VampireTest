-- Event Listener
local createXPOrbEvent = game.ReplicatedStorage.Events.SpawnXPOrbEvent

createXPOrbEvent.Event:Connect(function(positionToSpawn)
	-- Copy the XP Orb object template
	local orb = game.ServerStorage:FindFirstChild("XPOrb"):clone()
	-- Set its position
	orb.Position = positionToSpawn
	-- Add its respective folder to the workspace
	orb.Parent = workspace:WaitForChild("XP")	
end)
