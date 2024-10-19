-- not used

-- Event listener
local levelUpEventListener = game.ReplicatedStorage.Events:WaitForChild("LevelUp")

levelUpEventListener.Event:Connect(function()
	print("Server: LEVEL UP")
end)