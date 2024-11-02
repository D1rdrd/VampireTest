-- Events
local createXPEvent = game.ReplicatedStorage.Events.SpawnXPOrbEvent

-- Event Listener
game.ReplicatedStorage.Events.KilledEnemyEvent.Event:Connect(function(player, coords)
	-- Debug
	--print("Event: Enemy killed at", coords, "by", player)
	
	--Update player UnitKills attribute
	local realplayer = game.Players:FindFirstChild(player)  
	realplayer.StatTracker:SetAttribute("UnitKills", realplayer.StatTracker:GetAttribute("UnitKills") + 1)

	-- Spawn XP orb at position
	createXPEvent:Fire(coords)
end)