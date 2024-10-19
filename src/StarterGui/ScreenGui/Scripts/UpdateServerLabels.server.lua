function UpdateXPUI()
	-- XP
	script.Parent.Parent.XPLabel.Text = string.format("XP: %.2f ", game.ReplicatedStorage.Team:GetAttribute("XP"))
end

function UpdateLevelUI()
	-- Level
	script.Parent.Parent.LevelLabel.Text = "Level: " .. game.ReplicatedStorage.Team:GetAttribute("Level")
end

while true do
	UpdateXPUI()
	UpdateLevelUI()
	
	wait(0.1)
end