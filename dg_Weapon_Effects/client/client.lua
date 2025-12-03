local isSlowed = false
local activeTimer = nil

AddEventHandler('gameEventTriggered', function(eventName, data)
    if eventName == "CEventNetworkEntityDamage" then
        local victim = data[1]
        local attacker = data[2]
        local weaponHash = data[7]

        if victim == PlayerPedId() and attacker ~= PlayerPedId() then
            ApplyWeaponEffects(weaponHash)
        end
    end
end)

function ApplyWeaponEffects(weaponHash)
    local cfg = Config.Weapons[weaponHash]
    if not cfg then return end

    -- Slow movement
    SetRunSprintMultiplierForPlayer(PlayerId(), cfg.slowdown)
    isSlowed = true

    -- Handle multiple effects
    local effects = type(cfg.effect) == "table" and cfg.effect or {cfg.effect}
    for _, effectName in ipairs(effects) do
        if effectName == "Drunk" then
            ApplyDrunkEffect(cfg.duration)
        else
            StartScreenEffect(effectName, 0, true)
        end
    end

    -- Set/reset the timer
    if activeTimer then
        activeTimer = GetGameTimer() + (cfg.duration * 1000)
    else
        activeTimer = GetGameTimer() + (cfg.duration * 1000)
        Citizen.CreateThread(function()
            while GetGameTimer() < activeTimer do
                Citizen.Wait(100)
            end
            ResetAllEffects()
            activeTimer = nil
        end)
    end
end

function ApplyDrunkEffect(duration)
    StartScreenEffect("Drunk", 0, true)
    ShakeGameplayCam("DRUNK_SHAKE", 1.0)

    RequestAnimSet("move_m@drunk@verydrunk")
    while not HasAnimSetLoaded("move_m@drunk@verydrunk") do
        Citizen.Wait(10)
    end
    SetPedMovementClipset(PlayerPedId(), "move_m@drunk@verydrunk", 1.0)

    -- Schedule drunk end
    Citizen.SetTimeout(duration * 1000, function()
        StopScreenEffect("Drunk")
        ShakeGameplayCam("DRUNK_SHAKE", 0.0)
        ResetPedMovementClipset(PlayerPedId(), 0.0)
    end)
end

function ResetAllEffects()
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
    StopAllScreenEffects()
    ShakeGameplayCam("DRUNK_SHAKE", 0.0)
    ResetPedMovementClipset(PlayerPedId(), 0.0)
    isSlowed = false
end
