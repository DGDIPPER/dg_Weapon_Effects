Config = {}

-- 📜 Reference list of usable effects
-- "Drunk" has special handling in client.lua
Config.AllEffects = {
    "RedMist", "Dying", "ChopVision", "MP_Bull_tost",
    "MP_Celeb_Lose", "DeathFailOut", "MP_race_crash",
    "FocusIn", "BeastIntro01", "ExplosionJosh3",
    "PPOrange", "PPGreen", "PPPink", "PPRed",
    "PPBlue", "PPYellow", "Drunk"
}

-- 💥 Weapon effect settings
-- slowdown: 1.0 = normal, lower = slower movement
-- effect: single string or {multiple, effects}
-- duration: seconds
Config.Weapons = {
    [`WEAPON_YTASER`]      = {slowdown = 0.5,  effect = {"Drunk", "RedMist"}, duration = 25},
    --[`WEAPON_PISTOL`]      = {slowdown = 0.5,  effect = {"Drunk", "RedMist"}, duration = 20},
    --[`WEAPON_PUMPSHOTGUN`]  = {slowdown = 0.2,  effect = {"ExplosionJosh3", "RedMist", "PPRed"}, duration = 6},
    --[`WEAPON_MICROSMG`]     = {slowdown = 0.5,  effect = {"PPBlue", "MP_Bull_tost"}, duration = 4},
    --[`WEAPON_ASSAULTRIFLE`] = {slowdown = 0.3,  effect = {"PPRed", "MP_Celeb_Lose"}, duration = 6},
    --[`WEAPON_SNIPERRIFLE`]  = {slowdown = 0.25, effect = {"FocusIn", "ChopVision"}, duration = 7},
    --[`WEAPON_GRENADE`]      = {slowdown = 0.1,  effect = {"MP_race_crash", "DeathFailOut"}, duration = 8},
    --[`WEAPON_MOLOTOV`]      = {slowdown = 0.2,  effect = {"MP_Bull_tost", "PPOrange"}, duration = 9},
    --[`WEAPON_STUNGUN`]      = {slowdown = 0.5,  effect = {"Drunk", "ChopVision"}, duration = 30}
}
