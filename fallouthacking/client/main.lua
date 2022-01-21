AddEventHandler('fallouthacking:client:StartMinigame', function(wordLength, retryCount, callback)
    minigameCallback = callback
    SendNUIMessage({
        action = "open",
        length = wordLength,
        retries = retryCount,
    })
    SetNuiFocus(true, true)
end)

RegisterCommand("fallout", function()
    TriggerEvent('fallouthacking:client:StartMinigame', 5, 4, function(winner)
        if winner then
            print("Winner!!")
        else
            print("Loser!!")
        end
    end)
end)

RegisterNUICallback("Close", function()
    minigameCallback(false)
    SetNuiFocus(false, false)
    SendNUIMessage({
        action = "close"
    })
end)

RegisterNUICallback("Win", function()
    minigameCallback(true)
    SetNuiFocus(false, false)
    SendNUIMessage({
        action = "close"
    })
end)