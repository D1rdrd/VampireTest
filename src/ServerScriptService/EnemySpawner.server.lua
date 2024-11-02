-- Events
local spawnEnemyEvent = game.ReplicatedStorage.Events.SpawnEnemyEvent

-- Variables
local numberOfEnemies = game.ReplicatedStorage.Config.Enemy:GetAttribute("SpawnCount") 	-- Number of enemies to spawn
local spawnDelay = game.ReplicatedStorage.Config.Enemy:GetAttribute("SpawnDelay") 		-- Delay (seconds) to spawning enemies
local spawnRadius = game.ReplicatedStorage.Config.Enemy:GetAttribute("SpawnRadius")  	-- Radius around the player where enemies will spawn


-- Spawn multiple enemies
for _ = 0, numberOfEnemies do

	local enemyRandomPosition = Vector3.new(
		math.random(-spawnRadius, spawnRadius),
		5,  -- Height of spawn
		math.random(-spawnRadius, spawnRadius)
	)

	-- Trigger the event to spawn an enemy
	spawnEnemyEvent:Fire(enemyRandomPosition, "EnemyCube")

	wait(spawnDelay)
	
	-- ToDo: Function to spawn enemies faster as time goes on
	-- Should have an algorithm or somehing here, for now it should work
	spawnDelay = spawnDelay * 0.99
end
