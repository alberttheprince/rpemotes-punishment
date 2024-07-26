local function tripPlayer(time)
    ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.08)
    --SetPedToRagdoll(cache.ped, time, time, 0, 0, 0, 0) -- uncomment of using ox_lib
SetPedToRagdoll(PlayerPedId(), time, time, 0, 0, 0, 0) -- comment out if using ox_lib
end

local trippingWalkstyles = {
    ['move_f@flee@a'] = true,
    ['move_f@flee@c'] = true,
    ['move_m@flee@a'] = true,
    ['move_m@flee@b'] = true,
    ['move_m@flee@c'] = true,
    ["move_characters@orleans@core@"]= true,
    ["move_m@hurry@a"]= true,
    ["move_f@hurry@a"]= true,
    ["move_f@hurry@b"]= true,
}

local function isUsingCheeseWalk()
    local walk = exports.rpemotes:getWalkstyle()

    if not walk then return end

    return trippingWalkstyles[walk]
end


local lastWalkCheck = 0
local walkCheeseInterval = 0
local function checkWalkCheese(time)
    if time - lastWalkCheck < walkCheeseInterval then return end
    lastWalkCheck = time
    if math.random() < 0.15 and (IsPedSprinting(PlayerPedId()) or IsPedRunning(PlayerPedId())) then -- comment out if using ox_lib
    -- if math.random() < 0.15 and (IsPedSprinting(cache.ped) or IsPedRunning(cache.ped)) then -- uncomment for ox_lib
        tripPlayer(1000)
        -- lib.notify({ -- uncomment for ox_lib
        --     title = '😨',
        --     description = 'Ahhhhhhhhhh!!!!',
        --     duration = 700,
        --     type = 'warning'
        -- })
    end
end
