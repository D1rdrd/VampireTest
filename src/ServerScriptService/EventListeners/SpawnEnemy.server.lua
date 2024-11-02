-- Event Listener
local spawnEnemyEvent = game.ReplicatedStorage.Events.SpawnEnemyEvent

spawnEnemyEvent.Event:Connect(function(positionToSpawn, type)

	local enemy

	if type then
		-- Create a clone of the enemy template
		enemy = game.ServerStorage:FindFirstChild(type):Clone()
	else
		-- If no type is given, spawn a cube
		enemy = game.ServerStorage.EnemyCube:Clone()
	end		

	-- Set a random color to the enemy
	enemy.Color = Color3.new(math.random(), math.random(), math.random())
	
	-- Randomize the spawn position within a circle
	enemy.Position = positionToSpawn

	-- Parent the enemy to the Workspace
	enemy.Parent = workspace.Enemies
	
end)
