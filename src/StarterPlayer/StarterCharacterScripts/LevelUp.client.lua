-- Wait for the BindableEvent to be ready
local levelUpBindable = game.ReplicatedStorage:WaitForChild("Events"):WaitForChild("LevelUp")

-- Events
local modifyAttributeEvent = game.ReplicatedStorage.Events.UpgradeAttributeEvent

-- Modules
local AttributeModifier = require(game.ReplicatedStorage.Scripts.AttributeModifier)

-- Get the local player and GUI reference
local player = game.Players.LocalPlayer
local levelUpLabel = player.PlayerGui.ScreenGui.PlayerStatGroup.LevelUpLabel
local upgradeLabel = player.PlayerGui.ScreenGui.LevelUpUpgradeGroup


-- Declare variables to store event connections
local upgrade1Connection
local upgrade2Connection
local upgrade3Connection

function UpgradeMenuShow()
	-- Get the player attributes
	local attributes = player:GetAttributes()

	-- Store the attribute names in a table
	local attributeNames = {}
	for attributeName, _ in pairs(attributes) do
		table.insert(attributeNames, attributeName)
	end

	-- Shuffle the attribute names and pick the first 3
	local function shuffleTable(t)
		for i = #t, 2, -1 do
			local j = math.random(i)
			t[i], t[j] = t[j], t[i]
		end
	end

	-- Shuffle the attributes
	shuffleTable(attributeNames)

	-- Pick the first 3 attributes after shuffling
	local selectedAttributes = {}
	for i = 1, math.min(3, #attributeNames) do
		table.insert(selectedAttributes, attributeNames[i])
	end

	-- Show these attributes in the upgrade menu (you can customize this part)
	for _, attribute in ipairs(selectedAttributes) do
		print("Selected attribute: " .. attribute)
		-- Here you would show the attribute in the UI (e.g., create buttons or labels in your upgradeLabel)
	end
	
	-- ToDo: Make the buttons dinamically to handle the text easier
	-- Assign each attribute to a button
	upgradeLabel.Upgrade1.Text = selectedAttributes[1]
	upgradeLabel.Upgrade2.Text = selectedAttributes[2]
	upgradeLabel.Upgrade3.Text = selectedAttributes[3]

	-- Done: Make a function that:
	-- - Increases the attribute
	-- - Updates the player stat window
	-- - Hides the upgrade menu when a button is pressed

	function InitMenuButtons(attribute)
		-- Call the event to increase the attribute
		-- *Also updates the player stat window
		modifyAttributeEvent:FireServer(attribute)
		
		-- Hide the upgrade menu when a button is pressed
		upgradeLabel.Visible = false

	end

	-- Disconnect any previous connections
	if upgrade1Connection then upgrade1Connection:Disconnect() end
	if upgrade2Connection then upgrade2Connection:Disconnect() end
	if upgrade3Connection then upgrade3Connection:Disconnect() end

	-- Connect new event handlers
	upgrade1Connection = upgradeLabel.Upgrade1.Activated:Connect(function()
		InitMenuButtons(selectedAttributes[1])
	end)

	upgrade2Connection = upgradeLabel.Upgrade2.Activated:Connect(function()
		InitMenuButtons(selectedAttributes[2])
	end)

	upgrade3Connection = upgradeLabel.Upgrade3.Activated:Connect(function()
		InitMenuButtons(selectedAttributes[3])
	end)
	
	
	-- Finally, show the upgrade menu to the player
	upgradeLabel.Visible = true
end

-- Connect to the BindableEvent when it's fired
levelUpBindable.OnClientEvent:Connect(function()
	print("Player: LEVEL UP event received")

	-- Show LevelUpLabel for the player
	levelUpLabel.Visible = true

	-- Show Upgrade Menu to the player
	UpgradeMenuShow()

	-- Hide label after a few seconds (optional)
	wait(2)
	levelUpLabel.Visible = false
end)
