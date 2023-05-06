RegisterNetEvent("ext_commands:proximity")
AddEventHandler("ext_commands:proximity", function(serverId, range, chatMessage)
    
    local player = GetPlayerFromServerId(serverId)
    local playerPed = GetPlayerPed(player)
    local ped = PlayerPedId()
    local dist = #(GetEntityCoords(playerPed) - GetEntityCoords(ped))

    if dist <= range or player == PlayerId() then

        TriggerEvent('chat:addMessage', chatMessage)
    end
end)