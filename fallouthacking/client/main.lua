local successPromise = nil

--- Starts the minigame with provided field
---@param wordLength integer The difficulty (the character length of the words)
---@param retryCount integer How many attempts you have
local function startMinigame(wordLength, retryCount)
    if successPromise then return error("minigame already active") end

    successPromise = promise.new()
    SendNUIMessage({
        action = "open",
        length = wordLength,
        retries = retryCount,
    })
    SetNuiFocus(true, true)

    return Citizen.Await(successPromise)
end

local function cancelMinigame()
    if successPromise then
        successPromise:resolve(false)
        successPromise = nil
        SetNuiFocus(false, false)
        SendNUIMessage({
            action = "close"
        })
    end
end

RegisterNUICallback("Close", function()
    if successPromise then
        successPromise:resolve(false)
        successPromise = nil
    end

    SetNuiFocus(false, false)
    SendNUIMessage({
        action = "close"
    })
end)

RegisterNUICallback("Win", function()
    if successPromise then
        successPromise:resolve(true)
        successPromise = nil
    end

    SetNuiFocus(false, false)
    SendNUIMessage({
        action = "close"
    })
end)

exports("start", startMinigame)
exports("cancel", cancelMinigame)