-- Variables
local player = game.Players.LocalPlayer -- Get the player that is running this local script

-- Fire a projectile every second
while true do	
	-- Fire the event with the player's and mouse's position
	game.ReplicatedStorage.SpawnProjectileEvent:FireServer(player.Character.HumanoidRootPart.Position, player:GetMouse().Hit.p)

	-- Wait according its fire rate
	wait(1 / player:GetAttribute("FireRateMultiplier"))
end 