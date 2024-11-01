-- Events
local createXPEvent = game.ReplicatedStorage.SpawnXPOrbEvent

-- Event Listener
game.ReplicatedStorage.Events.EnemyKilled.Event:Connect(function(player, coords)
	-- Debug
	--print("Event: Enemy killed at", coords, "by", player)
	
	--Update player UnitKills attribute
	local realplayer = game.Players:FindFirstChild(player)  
	realplayer.Attributes:SetAttribute("UnitKills", realplayer.Attributes:GetAttribute("UnitKills") + 1)

	-- Spawn XP orb at position
	createXPEvent:Fire(coords)
end)