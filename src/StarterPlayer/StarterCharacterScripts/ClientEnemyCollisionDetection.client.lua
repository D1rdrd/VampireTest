-- Client-side enemy collision handling

-- * Is it tho?
-- It shouldn't be really necessary to do this, but seeing as the
-- delay between the server destroying proyectiles and the player
-- updating its visualization, destroying it first client-side
-- seems like a better solution.

local hitenemys = {}

-- Function to handle enemy collisions on the client
local function handleEnemyCollision(hit, enemy)
    -- Ensure 'hit' and 'hit.Parent' are valid
    if hit and hit.Parent then
        -- Find the real player based on the hit part's parent name
        local realplayer = game.Players:FindFirstChild(hit.Parent.Name)

        -- Check if 'realplayer' exists and is a Player
        if realplayer and realplayer:IsA("Player") then
            print("Player hit")
            -- Decrease the player's health by 1
            realplayer.Character.Humanoid.Health = realplayer.Character.Humanoid.Health - 1
        end
    end
end


-- Function to handle each enemy's Touched event
local function handleenemy(enemy)
	enemy.Touched:Connect(function(hit)
		handleEnemyCollision(hit, enemy)
	end)
end

-- Listen for new enemys being added to the Workspace and connect the Touched event
game.Workspace.Enemies.ChildAdded:Connect(function(enemy)
	handleenemy(enemy)
end)