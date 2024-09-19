-- Modules
local UIController = require(game:GetService("Workspace"):WaitForChild("Scripts").UIController)

local StatTracker = {}

local killCount = 0

StatTracker.killCountIncrease = function()
	killCount = killCount + 1
	print("Enemies Killed: " .. killCount)
	UIController.updateKillIndicator(killCount)
	
end

return StatTracker
