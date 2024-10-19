-- Get the Player from the UI
local player = script.Parent.Parent.Parent.Parent
-- Modules
local AttributeModifier = require(game.ReplicatedStorage.Scripts.AttributeModifier)

-- Function to detect when a button is pressed and increase its corresponding attribute
function DetectButtonBeingPushed()
	-- Get all attributes of the player
	local attributes = player:GetAttributes()

	-- Iterate over each attribute
	for attributeName, _ in pairs(attributes) do
		-- Find the corresponding button in the UI based on the attribute name
		local button = script.Parent.Parent.UpgradeButtons:FindFirstChild(attributeName)

		-- If the button exists, connect its MouseButton1Click event
		if button and button:IsA("TextButton") then
			button.MouseButton1Click:Connect(function()
				-- Increase the attribute using the AttributeModifier module
				AttributeModifier.IncreaseAttribute(player, attributeName)
			end)
		end
	end	
end

-- Connect the button press event once
DetectButtonBeingPushed()
