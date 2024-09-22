-- Events
local spawnBasicProjectileEvent = game.ReplicatedStorage:WaitForChild("SpawnProjectileEvent")

-- Variables
local player = game.Players.LocalPlayer
local fireInterval = 1   -- Time between firing projectiles (1 second)

-- Fire a projectile every second
while true do	
	spawnBasicProjectileEvent:FireServer(player.Character.HumanoidRootPart.Position, player:GetMouse().Hit.p)
	wait(fireInterval / player:GetAttribute("FireRateMultiplier"))
end 