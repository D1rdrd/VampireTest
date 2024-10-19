-- Variables
local player = game.Players.LocalPlayer -- Get the player that is running this local script

-- Fire a projectile every second as long as the player is alive
while true do
	-- Check if the player is alive
	if player.Character:WaitForChild("Humanoid").Health > 0 then
		-- Fire the event with the player's and mouse's position
		game.ReplicatedStorage.SpawnProjectileEvent:FireServer(player.Character:WaitForChild("HumanoidRootPart").Position, player:GetMouse().Hit.p)
	end

	-- Wait according to the fire rate multiplier
	wait(1.5 / (player:GetAttribute("FireRateMultiplier")))
end
