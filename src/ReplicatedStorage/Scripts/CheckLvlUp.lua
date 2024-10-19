local module = {}

-- Events
local levelUpEvent = game.ReplicatedStorage.Events.LevelUp

module.CheckLvlUp = function()	
	local xp = game.ReplicatedStorage.Team:GetAttribute("XP")
	local level = game.ReplicatedStorage.Team:GetAttribute("Level")
	
	-- ToDo: Come up with a better way to determined the required level
	local requiredXP = level * 10
	
	if xp >= requiredXP then
		game.ReplicatedStorage.Team:SetAttribute("XP", 0)
		game.ReplicatedStorage.Team:SetAttribute("Level", level + 1)
		
		levelUpEvent:FireAllClients()
	end
end

module.IncreaseXP = function(ammount, XPMultiplier)	
	game.ReplicatedStorage.Team:SetAttribute("XP", game.ReplicatedStorage.Team:GetAttribute("XP") + (tonumber(ammount) * tonumber(XPMultiplier)))

	module.CheckLvlUp()
end

return module
