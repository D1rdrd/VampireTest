-- Variables
local enemy = script.Parent
local speed = enemy:GetAttribute("speed")  -- Speed of the enemy cube

-- Function to find the nearest player
local function findNearestPlayer()
	local nearestPlayer = nil -- nil not neccesary, ig
	local shortestDistance = math.huge

	-- Loop through all players to find the nearest one
	for _, player in pairs(game.Players:GetPlayers()) do
		if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
			local distance = (player.Character.HumanoidRootPart.Position - enemy.Position).magnitude
			if distance < shortestDistance then
				nearestPlayer = player.Character
				shortestDistance = distance
			end
		end
	end

	return nearestPlayer
end

-- Function to move the cube towards the player
local function moveTowardPlayer(playerCharacter)
	if playerCharacter then
		local playerPos = playerCharacter.HumanoidRootPart.Position  -- Get player's position
		local enemyPos = enemy.Position  -- Get enemy's position
		local direction = (playerPos - enemyPos).unit  -- Calculate direction toward player
		local moveToPosition = enemy.Position + direction * speed  -- Move the enemy toward player

		-- Move the enemy
		enemy.Position = moveToPosition
		-- Rotate the enemy to face the player
		enemy.CFrame = CFrame.new(enemy.Position, playerPos)
	end
end

-- Main loop to update movement
while true do
	local nearestPlayer = findNearestPlayer()
	if nearestPlayer then
		moveTowardPlayer(nearestPlayer)
	end
	wait(0.1)
end