-- Wait for the BindableEvent to be ready
local levelUpBindable = game.ReplicatedStorage:WaitForChild("Events"):WaitForChild("LevelUp")

-- Get the local player and GUI reference
local player = game.Players.LocalPlayer
local levelUpLabel = player.PlayerGui.ScreenGui.LevelUpLabel

-- Connect to the BindableEvent when it's fired
levelUpBindable.OnClientEvent:Connect(function()
	print("Player: LEVEL UP event received")

	-- Show LevelUpLabel for the player
	levelUpLabel.Visible = true

	-- Hide label after a few seconds (optional)
	wait(2)
	levelUpLabel.Visible = false
end)
