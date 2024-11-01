local orb = script.Parent  -- XP orb
local speed = orb:GetAttribute("Speed")  -- Speed at which the orb moves towards the player
local followDistance = orb:GetAttribute("FollowDistance")  -- Distance at which the orb starts following
local destroyDistance = orb:GetAttribute("DestroyDistance") -- Distance at which the orb gets destroyed (a bit less than follow)

-- Function to find the closest player
local function findClosestPlayer()
    local players = game.Players:GetPlayers()
    local closestPlayer = nil
    local closestDistance = followDistance

    for _, player in ipairs(players) do
        local character = player.Character
        if character and character:FindFirstChild("HumanoidRootPart") then
            local distance = (orb.Position - character.HumanoidRootPart.Position).Magnitude
            if distance < closestDistance then
                closestDistance = distance
                closestPlayer = player  -- Return the player instead of character for attribute access
            end
        end
    end
    return closestPlayer
end

local Module = require(game.ReplicatedStorage.Scripts.CheckLvlUp)

-- Main update loop for the XP orb
game:GetService("RunService").Heartbeat:Connect(function()
    local targetPlayer = findClosestPlayer()
    if targetPlayer then
        --orb:SetNetworkOwner(targetPlayer)
        local character = targetPlayer.Character
        -- Move towards the player if within followDistance
        local direction = (character.HumanoidRootPart.Position - orb.Position).Unit
        orb.Position = orb.Position + direction * speed * game:GetService("RunService").Heartbeat:Wait()
        speed = speed * 1.02

        -- Check if orb is close enough to destroy itself and add XP
        if (orb.Position - character.HumanoidRootPart.Position).Magnitude <= destroyDistance then
            orb:SetAttribute("Tick", orb:GetAttribute("Tick") + 1)
        end
        
        if orb:GetAttribute("Tick") == 3 then
            -- Add the experience to the team
			
			Module.IncreaseXP(orb:GetAttribute("XPAmmount"), targetPlayer.Attributes:GetAttribute("XPMultiplier"))

            orb:Destroy()  -- Destroy the XP orb
        end
    end
end)
