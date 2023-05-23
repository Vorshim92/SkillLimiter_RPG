---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by lele.
--- DateTime: 27/03/23 09:38
---

---@class DbgLeleLib

local DbgLeleLib = {}

local test_ = "Test - "
local fail_ = " >>>>>>>>>>>>>> FAIL"
local ok_ = " >>>>>>>>>>>>>> Ok"

local perkFactoryPZ = require("lib/PerkFactoryPZ")

local function fail(value)
    print(test_ .. value .. fail_)
end

local function ok(value)
    print(test_ .. value .. ok_)
end

function DbgLeleLib.checkTest(value1, value2, nameTest)
    if value1 == value2 then
        ok(nameTest)
    else
        fail(nameTest)
    end
end

DbgLeleLib.EnumProfession = {
    UNEMPLOYED = "",
    BURGER_FLIPPER = "burgerflipper",
    BURGLAR = "burglar",
    CARPENTER = "carpenter",
    CHEF = "chef",
    CONSTRUCTION_WORKER = "constructionworker",
    DOCTOR = "doctor",
    ELECTRICIAN = "electrician",
    ENGINEER = "engineer",
    FARMER = "farmer",
    FISHERMAN = "fisherman",
    FIRE_OFFICER = "fireofficer",
    FITNESS_INSTRUCTOR = "fitnessInstructor",
    LUMBERJACK = "lumberjack",
    MECHANICS = "mechanics",
    METAL_WORKER = "metalworker",
    NURSE = "nurse",
    PARK_RANGER = "parkranger",
    POLICE_OFFICER = "policeofficer",
    REPAIRMAN = "repairman",
    SECURITY_GUARD = "securityguard",
    VETERAN = "veteran"
}

--- Get Perk from name
---@return PerkFactory.Perk perk
--- - PerkFactory.Perk : zombie.characters.skills.PerkFactory
DbgLeleLib.EnumPerk = {
    --local myPerk = Perks.Blacksmith
    --print(myPerk:getType())
    --print(myPerk:getId())
    --print(myPerk:getName())

    None = perkFactoryPZ.getPerkByName_PZ("None"),
    Agility = perkFactoryPZ.getPerkByName_PZ("Agility"),
    Aiming = perkFactoryPZ.getPerkByName_PZ("Aiming"),
    Axe = perkFactoryPZ.getPerkByName_PZ("Axe"),
    -- Blacksmith = perkFactoryPZ.getPerkByName_PZ("Blacksmith"),  -- ???
    Blunt = perkFactoryPZ.getPerkByName_PZ("Blunt"),
    Combat = perkFactoryPZ.getPerkByName_PZ("Combat"),
    Cooking = perkFactoryPZ.getPerkByName_PZ("Cooking"),
    Crafting = perkFactoryPZ.getPerkByName_PZ("Crafting"),
    Doctor = perkFactoryPZ.getPerkByName_PZ("Doctor"),
    Electricity = perkFactoryPZ.getPerkByName_PZ("Electricity"),
    Farming = perkFactoryPZ.getPerkByName_PZ("Farming"),
    Firearm = perkFactoryPZ.getPerkByName_PZ("Firearm"),
    Fishing = perkFactoryPZ.getPerkByName_PZ("Fishing"),
    Fitness = perkFactoryPZ.getPerkByName_PZ("Fitness"),
    Lightfoot = perkFactoryPZ.getPerkByName_PZ("Lightfoot"),
    LongBlade = perkFactoryPZ.getPerkByName_PZ("Long Blade"), -- LongBlade
    Maintenance = perkFactoryPZ.getPerkByName_PZ("Maintenance"),
    -- MAX = perkFactoryPZ.getPerkByName_PZ("MAX"), -- ???
    Mechanics = perkFactoryPZ.getPerkByName_PZ("Mechanics"),
    -- Melee = perkFactoryPZ.getPerkByName_PZ("Melee"), -- ???
    -- Melting = perkFactoryPZ.getPerkByName_PZ("Melting"), -- ???
    MetalWelding = perkFactoryPZ.getPerkByName_PZ("Metalworking"), -- MetalWelding
    Nimble = perkFactoryPZ.getPerkByName_PZ("Nimble"),
    Passiv = perkFactoryPZ.getPerkByName_PZ("Passive"), -- Passiv
    PlantScavenging = perkFactoryPZ.getPerkByName_PZ("Foraging"), -- PlantScavenging
    Reloading = perkFactoryPZ.getPerkByName_PZ("Reloading"),
    SmallBlade = perkFactoryPZ.getPerkByName_PZ("Short Blade"), -- SmallBlade
    SmallBlunt = perkFactoryPZ.getPerkByName_PZ("Short Blunt"), -- SmallBlunt
    Sneak = perkFactoryPZ.getPerkByName_PZ("Sneaking"), -- Sneak
    Spear = perkFactoryPZ.getPerkByName_PZ("Spear"),
    Sprinting = perkFactoryPZ.getPerkByName_PZ("Sprinting"),
    Strength = perkFactoryPZ.getPerkByName_PZ("Strength"),
    Survivalist = perkFactoryPZ.getPerkByName_PZ("Survivalist"),
    Tailoring = perkFactoryPZ.getPerkByName_PZ("Tailoring"),
    Trapping = perkFactoryPZ.getPerkByName_PZ("Trapping"),
    Woodwork = perkFactoryPZ.getPerkByName_PZ("Carpentry"),  -- Woodwork
}

function DbgLeleLib.printLine()
    print("---------------------------------------------------------------------")
end

---display
---@param displayName
---@param i
---@param perk
---@param level
---@param xp
function DbgLeleLib.display(displayName, i, perk, level, xp)
    local dbg1 = perk
    local dbg2 = level
    local dbg3 = xp
    print(displayName .. " " ..
        tostring(i) .. " >> " .. tostring(perk) .. " - " ..
        tostring(level) .. " - " .. tostring(xp) )
    local dbg
end

---display
---@param displayName
---@param i
---@param perk
---@param level
---@param xp
function DbgLeleLib.displayAdvanced(displayName, i, perk, level, xp)
    local dbg1 = perk
    local dbg2 = level
    local dbg3 = xp

    print(displayName .. " " ..
        tostring(i) .. " >> " ..
        type(perk) .. " " .. tostring(perk) .. " - " ..
        type(level) .. " " .. tostring(level) .. " - " ..
        type(xp) .. " " .. tostring(xp) )
    local dbg
end

---@param displayName string
---@param perk_ PerkFactory.Perk
---@param perk PerkFactory.Perk
---@param level int
function DbgLeleLib.checkPerk(displayName, perk_, perk )
    -- Perks.Maintenance
    local dbg1 = perk
    local dbg2 = perk_

    if dbg1 == dbg2 then

        DbgLeleLib.printLine()
        DbgLeleLib.display(displayName, nil, dbg1, dbg2, nil)
        DbgLeleLib.printLine()

        local dbg
    end

    local dbg
end

function DbgLeleLib.displayCharacterObj(displayName, CharacterObj )
    DbgLeleLib.printLine()
    for i, v in pairs(CharacterObj) do
        DbgLeleLib.display(displayName, i,
                v:getPerk(), v:getLevel(), v:getXp())
        --DbgLeleLib.displayAdvanced(displayName, i,
        --        v:getPerk(), v:getLevel(), v:getXp())
    end
    DbgLeleLib.printLine()
end

---@param displayName string
---@param perks_list
function DbgLeleLib.displayListPerks(displayName, perks_list)
    DbgLeleLib.printLine()
    for i, v in pairs(perks_list) do
        DbgLeleLib.display(displayName, i, v.perk, v.level, nil)
        -- DbgLeleLib.displayAdvanced(displayName, i, v.perk, v.level, nil)
        -- DBG_GetCheckPerk("DBG_GetCheckPerk", v.perk_, v.perk, _ )
    end
    DbgLeleLib.printLine()
end



function DbgLeleLib.timesCount(count, coount2)
    if count == coount2 then
        return true
    end

    return false
end

return DbgLeleLib



