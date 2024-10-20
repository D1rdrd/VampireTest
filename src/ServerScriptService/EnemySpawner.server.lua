-- Variables
local numberOfEnemies = game.ReplicatedStorage.Config.Enemy:GetAttribute("SpawnCount") 	-- Number of enemies to spawn
local spawnDelay = game.ReplicatedStorage.Config.Enemy:GetAttribute("SpawnDelay") 		-- Delay (seconds) to spawning enemies
local spawnRadius = game.ReplicatedStorage.Config.Enemy:GetAttribute("SpawnRadius")  	-- Radius around the player where enemies will spawn
local enemyTemplate = game.ServerStorage.EnemyCube

-- Function to spawn a single enemy
local function spawnEnemy()
	-- Create a clone of the enemy template
	local enemy = enemyTemplate:Clone()

	-- Set a random color to the enemy
	enemy.Color = Color3.new(math.random(), math.random(), math.random())
	
	-- Randomize the spawn position within a circle
	enemy.Position = Vector3.new(
		math.random(-spawnRadius, spawnRadius),
		5,  -- Height of spawn
		math.random(-spawnRadius, spawnRadius)
	)

	-- Parent the enemy to the Workspace
	enemy.Parent = workspace.Enemies
end

-- Spawn multiple enemies
for _ = 0, numberOfEnemies do
	spawnEnemy()
	wait(spawnDelay)
	
	-- ToDo: Function to spawn enemies faster as time goes on
	-- Should have an algorithm or somehing here, for now it should work
	spawnDelay = spawnDelay * 0.99
end
