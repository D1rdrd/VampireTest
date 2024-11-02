-- Event Listener
local spawnEnemyEvent = game.ReplicatedStorage.Events.SpawnEnemyEvent

spawnEnemyEvent.Event:Connect(function(positionToSpawn, type)

	-- Create a clone of the enemy template
	local enemy = game.ServerStorage:FindFirstChild(type or "EnemyCube"):Clone()	

	-- Set a random color to the enemy
	enemy.Color = Color3.new(math.random(), math.random(), math.random())
	
	-- Randomize the spawn position within a circle
	enemy.Position = positionToSpawn

	-- Parent the enemy to the Workspace
	enemy.Parent = workspace.Enemies
	
end)
