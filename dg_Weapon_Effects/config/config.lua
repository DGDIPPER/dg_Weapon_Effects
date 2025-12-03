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
    [`WEAPON_PISTOL`]      = {slowdown = 0.5,  effect = {"Drunk", "RedMist"}, duration = 20},
    [`WEAPON_PUMPSHOTGUN`]  = {slowdown = 0.2,  effect = {"ExplosionJosh3", "RedMist", "PPRed"}, duration = 6},
    [`WEAPON_MICROSMG`]     = {slowdown = 0.5,  effect = {"PPBlue", "MP_Bull_tost"}, duration = 4},
    [`WEAPON_ASSAULTRIFLE`] = {slowdown = 0.3,  effect = {"PPRed", "MP_Celeb_Lose"}, duration = 6},
    [`WEAPON_STUNGUN`]      = {slowdown = 0.5,  effect = {"RedMist", "Drunk"}, duration = 20}
}
