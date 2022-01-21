## FiveM-FalloutHacking

Here is a quick resource I made after finding a cool repository by bombcheck. (https://github.com/bombcheck/Fallout.Terminal-Hacking)

Not realizing this has been released before as a paid script, I quickly made this in about 10-15 minutes because I thought it would be cool and useful in FiveM. It was when the script was finished that I found out it was released before.

Oh well, currently released version is a paid script. Here it is for free.

**Usage:** 

Event: _fallouthacking:client:StartMinigame_

Arguments: _int wordLength, int retryCount, function callback_
```lua
TriggerEvent('fallouthacking:client:StartMinigame', 5, 4, function(winner)
    if winner then
        print("Winner!!")
    else
        print("Loser!!")
    end
end)
```
