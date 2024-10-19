local player = script.Parent.Parent.Parent.Parent

local function UpdateAttributesUI()
	-- Retrieve all attributes and construct the display string
	local attributes = player:GetAttributes()
	local str = ""

	-- Iterate over each attribute and add its name and value to the string
	for attributeName, attributeValue in pairs(attributes) do
		str = str .. string.format("%s: %.1f\n", attributeName, attributeValue)
	end

	-- Update the label text with the constructed string
	script.Parent.Parent.PlayerLabel.Text = str
end

local function UpdateHealthUI() 
	local humanoid = player.Character and player.Character:FindFirstChild("Humanoid")
	if humanoid then
		local health = humanoid.Health
		local maxHealth = humanoid.MaxHealth
		script.Parent.Parent.HealthLabel.Text = string.format("Health: %.1f / %.1f", health, maxHealth)
	end
end

while true do
	UpdateAttributesUI()
	UpdateHealthUI()
	wait(0.1)
end
