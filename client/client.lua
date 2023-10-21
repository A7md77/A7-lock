local QBCore = exports['A7-core']:GetCoreObject()
local Result = nil
local NUI_status = false

local UseInteractSound = false
local debug = true

RegisterNetEvent('A7-lockpick:client:openLockpick', function(callback, circles)
    lockpickCallback = callback
    exports['A7-lock']:StartLockPickCircle(total,circles) 
end)

function StartLockPickCircle(circles, seconds, callback)
    Result = nil
    if debug then
        print(circles, "This be the lock")
    end
    NUI_status = true
    SendNUIMessage({
        action = 'start',
        value = circles,
		time = seconds,
    })
    while NUI_status do
        Wait(5)
        SetNuiFocus(NUI_status, false)
    end
    Wait(100)
    SetNuiFocus(false, false)
    lockpickCallback = callback
    return Result
end

RegisterNUICallback('fail', function()
    ClearPedTasks(PlayerPedId())
    Result = false
    Wait(100)
    NUI_status = false
    if debug then
        print('fail')
     end
     if UseInteractSound then
        TriggerServerEvent("InteractSound_SV:PlayOnSource", 'lockpickfail', 1.0)
    else
        PlaySoundFrontend(-1, "CANCEL", "HUD_MINI_GAME_SOUNDSET", 1 )
    end
end)

RegisterNUICallback('success', function()
	Result = true
	Wait(100)
	NUI_status = false
    SetNuiFocus(false, false)
    if debug then
        print(Result)
     end
    if UseInteractSound then
        TriggerServerEvent("InteractSound_SV:PlayOnSource", 'lockpicksuccess', 1.5)
    else
        PlaySoundFrontend(-1, "select", "HUD_MINI_GAME_SOUNDSET", 1 )
    end
    return Result
end)



if debug then
    RegisterCommand("a7game", function()
	    local time = math.random(7,10)
	    local circles =  math.random(2,4)
	    local success = exports['A7-lock']:StartLockPickCircle(circles, time, success)
	    print(success)
	    if success then
		    print("WIN")
	    else
		    print("FAIL")
	    end
    end)
end

print("^6A7 Lock^7 - By : ^7A7store - ^6discord.gg/aCnBJC3Pxb")