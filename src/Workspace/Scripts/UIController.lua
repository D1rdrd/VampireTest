local UIController = {};

local player = game.Players.LocalPlayer
local abilityIndicator = player.PlayerGui:WaitForChild("ScreenGui"):WaitForChild("QAbilityIndicator")  -- The UI element

local Qcounter = 0

-- Function to update the UI
UIController.updateQAbilityIndicator = function(abilityReady)
	if abilityReady then
		abilityIndicator.TextColor3 = Color3.fromRGB(0, 255, 0)  -- Green text
		abilityIndicator.Text = "Ready"		
		Qcounter = 50
	else
		abilityIndicator.TextColor3 = Color3.fromRGB(255, 0, 0)  -- Red text
		abilityIndicator.Text = math.round(Qcounter / 10)
		Qcounter = Qcounter - 1
	end
end

local abilityIndicator = player.PlayerGui:WaitForChild("ScreenGui"):WaitForChild("KillCounter")  -- The UI element

UIController.updateKillIndicator = function(killCount)
	abilityIndicator.Text = ("   Kills: " .. killCount)
end

return UIController;