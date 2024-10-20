-- Listen to the event being triggered
game.ReplicatedStorage.Events.UpgradeAttributeEvent.OnServerEvent:Connect(function(player, attribute)
    local AttributeModifier = require(game.ReplicatedStorage.Scripts.AttributeModifier)

    AttributeModifier.IncreaseAttribute(player, attribute)
end)
