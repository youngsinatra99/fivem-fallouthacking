AddEventHandler('fallouthacking:client:StartMinigame', function(wordLength, retryCount, callback)
    minigameCallback = callback
    SendNUIMessage({
        action = "open",
        length = wordLength,
        retries = retryCount,
    })
    SetNuiFocus(true, true)
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