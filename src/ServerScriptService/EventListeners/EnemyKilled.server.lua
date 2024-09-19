-- Events
local createXPEvent = game.ReplicatedStorage.SpawnXPOrbEvent

-- Event Listener
game.ReplicatedStorage.Events.EnemyKilled.Event:Connect(function(player, coords)
	-- Debug
	print("Event: Enemy killed at", coords, "by", player)
	
	-- Spawn XP orb at position
	createXPEvent:Fire(coords)
end)