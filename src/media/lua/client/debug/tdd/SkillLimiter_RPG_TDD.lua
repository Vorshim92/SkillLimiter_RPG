---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by lele.
--- DateTime: 28/10/23 18:34
---

local blockLevel = require("BlockLevel")
local characterPz = require("lib/CharacterPZ")
local characterMaxSkill = require("CharacterMaxSkill")
local codePerkDetails = require("CodePerkDetails")
local debugDiagnostics = require("lib/DebugDiagnostics")
local modDataManager = require("lib/ModDataManager")
local skillLimiter = require("SkillLimiter")

local CreateCharacterMaxSkillObj

---@type table
local characterAllPerks_ = {}

--- **Add All Perks to characterAllPerks_**
---@param perk PerkFactory.Perk
---@param currentLevel int
---@param maxLevel int
---@param xp string
---@return void
--- - PerkFactory.Perk : zombie.characters.skills.PerkFactory.Perk
local function addAllPerks(perk, currentLevel, maxLevel, xp)
    characterAllPerks_[perk] = {
        ---@type PerkFactory.Perk
        perk = perk,
        ---@type int
        currentLevel = currentLevel,
        ---@type int
        maxLevel = maxLevel,
        ---@type string
        xp = xp
    }
end

--- **Set Current Level**
---@param character IsoGameCharacter
--- - IsoGameCharacter : zombie.characters.IsoGameCharacter
local function setCurrentPerksLevel(character)
    local five = 5
    local seven = 7
    local ten = 10
    local xp = 10.0

    --- **Passive**
    debugDiagnostics.setPerkLevel(character, debugDiagnostics.Perks.FITNESS, ten)
    characterPz.addXP_PZ(character, debugDiagnostics.Perks.FITNESS, xp, false, false, true)

    debugDiagnostics.setPerkLevel(character, debugDiagnostics.Perks.STRENGTH, ten)
    characterPz.addXP_PZ(character, debugDiagnostics.Perks.STRENGTH, xp, false, false, true)

    --- **Agility**
    debugDiagnostics.setPerkLevel(character, debugDiagnostics.Perks.SPRINTING, five)
    characterPz.addXP_PZ(character, debugDiagnostics.Perks.SPRINTING, xp, false, false, true)

    debugDiagnostics.setPerkLevel(character, debugDiagnostics.Perks.LIGHTFOOT, five)
    characterPz.addXP_PZ(character, debugDiagnostics.Perks.LIGHTFOOT, xp, false, false, true)

    debugDiagnostics.setPerkLevel(character, debugDiagnostics.Perks.NIMBLE, five)
    characterPz.addXP_PZ(character, debugDiagnostics.Perks.NIMBLE, xp, false, false, true)

    debugDiagnostics.setPerkLevel(character, debugDiagnostics.Perks.SNEAK, five)
    characterPz.addXP_PZ(character, debugDiagnostics.Perks.SNEAK, xp, false, false, true)

    --- **Combat**
    debugDiagnostics.setPerkLevel(character, debugDiagnostics.Perks.AXE, five)
    characterPz.addXP_PZ(character, debugDiagnostics.Perks.AXE, xp, false, false, true)

    debugDiagnostics.setPerkLevel(character, debugDiagnostics.Perks.LONGBLUNT, five)
    characterPz.addXP_PZ(character, debugDiagnostics.Perks.LONGBLUNT, xp, false, false, true)

    debugDiagnostics.setPerkLevel(character, debugDiagnostics.Perks.SMALLBLUNT, seven)
    characterPz.addXP_PZ(character, debugDiagnostics.Perks.SMALLBLUNT, xp, false, false, true)

    debugDiagnostics.setPerkLevel(character, debugDiagnostics.Perks.LONGBLADE, five)
    characterPz.addXP_PZ(character, debugDiagnostics.Perks.LONGBLADE, xp, false, false, true)

    debugDiagnostics.setPerkLevel(character, debugDiagnostics.Perks.SMALLBLADE, five)
    characterPz.addXP_PZ(character, debugDiagnostics.Perks.SMALLBLADE, xp, false, false, true)

    debugDiagnostics.setPerkLevel(character, debugDiagnostics.Perks.SPEAR, five)
    characterPz.addXP_PZ(character, debugDiagnostics.Perks.SPEAR, xp, false, false, true)

    debugDiagnostics.setPerkLevel(character, debugDiagnostics.Perks.MAINTENANCE, seven)
    characterPz.addXP_PZ(character, debugDiagnostics.Perks.MAINTENANCE, xp, false, false, true)

    --- **Crafting**
    debugDiagnostics.setPerkLevel(character, debugDiagnostics.Perks.WOODWORK, ten)
    characterPz.addXP_PZ(character, debugDiagnostics.Perks.WOODWORK, xp, false, false, true)

    debugDiagnostics.setPerkLevel(character, debugDiagnostics.Perks.COOKING, five)
    characterPz.addXP_PZ(character, debugDiagnostics.Perks.COOKING, xp, false, false, true)

    debugDiagnostics.setPerkLevel(character, debugDiagnostics.Perks.FARMING, five)
    characterPz.addXP_PZ(character, debugDiagnostics.Perks.FARMING, xp, false, false, true)

    debugDiagnostics.setPerkLevel(character, debugDiagnostics.Perks.DOCTOR, five)
    characterPz.addXP_PZ(character, debugDiagnostics.Perks.DOCTOR, xp, false, false, true)

    debugDiagnostics.setPerkLevel(character, debugDiagnostics.Perks.ELECTRICITY, five)
    characterPz.addXP_PZ(character, debugDiagnostics.Perks.ELECTRICITY, xp, false, false, true)

    debugDiagnostics.setPerkLevel(character, debugDiagnostics.Perks.METALWELDING, five)
    characterPz.addXP_PZ(character, debugDiagnostics.Perks.METALWELDING, xp, false, false, true)

    debugDiagnostics.setPerkLevel(character, debugDiagnostics.Perks.MECHANICS, five)
    characterPz.addXP_PZ(character, debugDiagnostics.Perks.MECHANICS, xp, false, false, true)

    debugDiagnostics.setPerkLevel(character, debugDiagnostics.Perks.TAILORING, five)
    characterPz.addXP_PZ(character, debugDiagnostics.Perks.TAILORING, xp, false, false, true)

    --- **Firearm**
    debugDiagnostics.setPerkLevel(character, debugDiagnostics.Perks.AIMING, five)
    characterPz.addXP_PZ(character, debugDiagnostics.Perks.AIMING, xp, false, false, true)

    debugDiagnostics.setPerkLevel(character, debugDiagnostics.Perks.RELOADING, five)
    characterPz.addXP_PZ(character, debugDiagnostics.Perks.RELOADING, xp, false, false, true)

    -- **Survivalist**
    debugDiagnostics.setPerkLevel(character, debugDiagnostics.Perks.FISHING, five)
    characterPz.addXP_PZ(character, debugDiagnostics.Perks.FISHING, xp, false, false, true)

    debugDiagnostics.setPerkLevel(character, debugDiagnostics.Perks.TRAPPING, five)
    characterPz.addXP_PZ(character, debugDiagnostics.Perks.TRAPPING, xp, false, false, true)

    debugDiagnostics.setPerkLevel(character, debugDiagnostics.Perks.PLANTSCAVENGING, five)
    characterPz.addXP_PZ(character, debugDiagnostics.Perks.PLANTSCAVENGING, xp, false, false, true)
end

local function blockLevelX(character)
    --- **Passive**
    blockLevel.checkLevelMax(character, debugDiagnostics.Perks.FITNESS, CreateCharacterMaxSkillObj)
    blockLevel.checkLevelMax(character, debugDiagnostics.Perks.STRENGTH, CreateCharacterMaxSkillObj)

    --- **Agility**
    blockLevel.checkLevelMax(character, debugDiagnostics.Perks.SPRINTING, CreateCharacterMaxSkillObj)
    blockLevel.checkLevelMax(character, debugDiagnostics.Perks.LIGHTFOOT, CreateCharacterMaxSkillObj)
    blockLevel.checkLevelMax(character, debugDiagnostics.Perks.NIMBLE, CreateCharacterMaxSkillObj)
    blockLevel.checkLevelMax(character, debugDiagnostics.Perks.SNEAK, CreateCharacterMaxSkillObj)

    --- **Combat**
    blockLevel.checkLevelMax(character, debugDiagnostics.Perks.AXE, CreateCharacterMaxSkillObj)
    blockLevel.checkLevelMax(character, debugDiagnostics.Perks.LONGBLUNT, CreateCharacterMaxSkillObj)
    blockLevel.checkLevelMax(character, debugDiagnostics.Perks.SMALLBLUNT, CreateCharacterMaxSkillObj)
    blockLevel.checkLevelMax(character, debugDiagnostics.Perks.LONGBLADE, CreateCharacterMaxSkillObj)
    blockLevel.checkLevelMax(character, debugDiagnostics.Perks.SMALLBLADE, CreateCharacterMaxSkillObj)
    blockLevel.checkLevelMax(character, debugDiagnostics.Perks.SPEAR, CreateCharacterMaxSkillObj)
    blockLevel.checkLevelMax(character, debugDiagnostics.Perks.MAINTENANCE, CreateCharacterMaxSkillObj)

    --- **Crafting**
    blockLevel.checkLevelMax(character, debugDiagnostics.Perks.WOODWORK, CreateCharacterMaxSkillObj)
    blockLevel.checkLevelMax(character, debugDiagnostics.Perks.COOKING, CreateCharacterMaxSkillObj)
    blockLevel.checkLevelMax(character, debugDiagnostics.Perks.FARMING, CreateCharacterMaxSkillObj)
    blockLevel.checkLevelMax(character, debugDiagnostics.Perks.DOCTOR, CreateCharacterMaxSkillObj)
    blockLevel.checkLevelMax(character, debugDiagnostics.Perks.ELECTRICITY, CreateCharacterMaxSkillObj)
    blockLevel.checkLevelMax(character, debugDiagnostics.Perks.METALWELDING, CreateCharacterMaxSkillObj)
    blockLevel.checkLevelMax(character, debugDiagnostics.Perks.MECHANICS, CreateCharacterMaxSkillObj)
    blockLevel.checkLevelMax(character, debugDiagnostics.Perks.TAILORING, CreateCharacterMaxSkillObj)

    --- **Firearm**
    blockLevel.checkLevelMax(character, debugDiagnostics.Perks.AIMING, CreateCharacterMaxSkillObj)
    blockLevel.checkLevelMax(character, debugDiagnostics.Perks.RELOADING, CreateCharacterMaxSkillObj)

    -- **Survivalist**
    blockLevel.checkLevelMax(character, debugDiagnostics.Perks.FISHING, CreateCharacterMaxSkillObj)
    blockLevel.checkLevelMax(character, debugDiagnostics.Perks.TRAPPING, CreateCharacterMaxSkillObj)
    blockLevel.checkLevelMax(character, debugDiagnostics.Perks.PLANTSCAVENGING, CreateCharacterMaxSkillObj)

end

local function tddSkill()
    local character = debugDiagnostics.characterUpdate()

    --- **Passive**
    ---@type PerkFactory.Perk
    local perk = debugDiagnostics.Perks.FITNESS

    debugDiagnostics.checkTest(10,
            characterAllPerks_[perk].currentLevel, "Fitness Level : ")

    debugDiagnostics.checkTest( characterAllPerks_[perk].xp,
            characterPz.getXp(character, perk), "Fitness xp : ")

    perk = debugDiagnostics.Perks.STRENGTH

    debugDiagnostics.checkTest(10,
            characterAllPerks_[perk].currentLevel, "Strength Level : ")

    debugDiagnostics.checkTest( characterAllPerks_[perk].xp,
            characterPz.getXp(character, perk), "Strength xp : ")

    --- **Agility**
    perk = debugDiagnostics.Perks.SPRINTING

    debugDiagnostics.checkTest(5,
            characterAllPerks_[perk].currentLevel, "Sprinting Level : ")

    debugDiagnostics.checkTest( characterAllPerks_[perk].xp,
            characterPz.getXp(character, perk), "Sprinting xp : ")

    perk = debugDiagnostics.Perks.LIGHTFOOT

    debugDiagnostics.checkTest(5,
            characterAllPerks_[perk].currentLevel, "Lightfoot Level : ")

    debugDiagnostics.checkTest( characterAllPerks_[perk].xp,
            characterPz.getXp(character, perk), "Lightfoot xp : ")

    perk = debugDiagnostics.Perks.NIMBLE

    debugDiagnostics.checkTest(5,
            characterAllPerks_[perk].currentLevel, "Nimble Level : ")

    debugDiagnostics.checkTest( characterAllPerks_[perk].xp,
            characterPz.getXp(character, perk), "Nimble xp : ")

    perk = debugDiagnostics.Perks.SNEAK

    debugDiagnostics.checkTest(5,
            characterAllPerks_[perk].currentLevel, "Sneak Level : ")

    debugDiagnostics.checkTest( characterAllPerks_[perk].xp,
            characterPz.getXp(character, perk), "Sneak xp : ")

    --- **Combat**
    perk = debugDiagnostics.Perks.AXE

    debugDiagnostics.checkTest(5,
            characterAllPerks_[perk].currentLevel, "Axe Level : ")

    debugDiagnostics.checkTest( characterAllPerks_[perk].xp,
            characterPz.getXp(character, perk), "Axe xp : ")

    perk = debugDiagnostics.Perks.LONGBLUNT

    debugDiagnostics.checkTest(5,
            characterAllPerks_[perk].currentLevel, "LongBlunt Level : ")

    debugDiagnostics.checkTest( characterAllPerks_[perk].xp,
            characterPz.getXp(character, perk), "LongBlunt xp : ")

    perk = debugDiagnostics.Perks.SMALLBLUNT

    debugDiagnostics.checkTest(7,
            characterAllPerks_[perk].currentLevel, "SmallBlunt Level : ")

    debugDiagnostics.checkTest( characterAllPerks_[perk].xp,
            characterPz.getXp(character, perk), "SmallBlunt xp : ")

    perk = debugDiagnostics.Perks.LONGBLADE

    debugDiagnostics.checkTest(5,
            characterAllPerks_[perk].currentLevel, "LongBlade Level : ")

    debugDiagnostics.checkTest( characterAllPerks_[perk].xp,
            characterPz.getXp(character, perk), "LongBlade xp : ")

    perk = debugDiagnostics.Perks.SMALLBLADE

    debugDiagnostics.checkTest(5,
            characterAllPerks_[perk].currentLevel, "SmallBlade Level : ")

    debugDiagnostics.checkTest( characterAllPerks_[perk].xp,
            characterPz.getXp(character, perk), "SmallBlade xp : ")


    perk = debugDiagnostics.Perks.SPEAR

    debugDiagnostics.checkTest(5,
            characterAllPerks_[perk].currentLevel, "Spear Level : ")

    debugDiagnostics.checkTest( characterAllPerks_[perk].xp,
            characterPz.getXp(character, perk), "Spear xp : ")

    perk = debugDiagnostics.Perks.MAINTENANCE

    debugDiagnostics.checkTest(7,
            characterAllPerks_[perk].currentLevel, "Maintenance Level : ")

    debugDiagnostics.checkTest( characterAllPerks_[perk].xp,
            characterPz.getXp(character, perk), "Maintenance xp : ")

    --- **Crafting**
    perk = debugDiagnostics.Perks.WOODWORK

    debugDiagnostics.checkTest(10,
            characterAllPerks_[perk].currentLevel, "Woodwork Level : ")

    debugDiagnostics.checkTest( characterAllPerks_[perk].xp,
            characterPz.getXp(character, perk), "Woodwork xp : ")

    perk = debugDiagnostics.Perks.COOKING

    debugDiagnostics.checkTest(5,
            characterAllPerks_[perk].currentLevel, "Cooking Level : ")

    debugDiagnostics.checkTest( characterAllPerks_[perk].xp,
            characterPz.getXp(character, perk), "Cooking xp : ")

    perk = debugDiagnostics.Perks.FARMING

    debugDiagnostics.checkTest(5,
            characterAllPerks_[perk].currentLevel, "Farming Level : ")

    debugDiagnostics.checkTest( characterAllPerks_[perk].xp,
            characterPz.getXp(character, perk), "Farming xp : ")

    perk = debugDiagnostics.Perks.DOCTOR

    debugDiagnostics.checkTest(5,
            characterAllPerks_[perk].currentLevel, "Doctor Level : ")

    debugDiagnostics.checkTest( characterAllPerks_[perk].xp,
            characterPz.getXp(character, perk), "Doctor xp : ")

    perk = debugDiagnostics.Perks.ELECTRICITY

    debugDiagnostics.checkTest(5,
            characterAllPerks_[perk].currentLevel, "Electricity Level : ")

    debugDiagnostics.checkTest( characterAllPerks_[perk].xp,
            characterPz.getXp(character, perk), "Electricity xp : ")

    perk = debugDiagnostics.Perks.METALWELDING

    debugDiagnostics.checkTest(5,
            characterAllPerks_[perk].currentLevel, "MetalWelding Level : ")

    debugDiagnostics.checkTest( characterAllPerks_[perk].xp,
            characterPz.getXp(character, perk), "MetalWelding xp : ")

    perk = debugDiagnostics.Perks.MECHANICS

    debugDiagnostics.checkTest(5,
            characterAllPerks_[perk].currentLevel, "Mechanics Level : ")

    debugDiagnostics.checkTest( characterAllPerks_[perk].xp,
            characterPz.getXp(character, perk), "Mechanics xp : ")

    perk = debugDiagnostics.Perks.TAILORING

    debugDiagnostics.checkTest(5,
            characterAllPerks_[perk].currentLevel, "Tailoring Level : ")

    debugDiagnostics.checkTest( characterAllPerks_[perk].xp,
            characterPz.getXp(character, perk), "Tailoring xp : ")

    --- **Firearm**
    perk = debugDiagnostics.Perks.AIMING

    debugDiagnostics.checkTest(5,
            characterAllPerks_[perk].currentLevel, "Aiming Level : ")

    debugDiagnostics.checkTest( characterAllPerks_[perk].xp,
            characterPz.getXp(character, perk), "Aiming xp : ")

    perk = debugDiagnostics.Perks.RELOADING

    debugDiagnostics.checkTest(5,
            characterAllPerks_[perk].currentLevel, "Reloading Level : ")

    debugDiagnostics.checkTest( characterAllPerks_[perk].xp,
            characterPz.getXp(character, perk), "Reloading xp : ")

    -- **Survivalist**
    perk = debugDiagnostics.Perks.FISHING

    debugDiagnostics.checkTest(5,
            characterAllPerks_[perk].currentLevel, "Fishing Level : ")

    debugDiagnostics.checkTest( characterAllPerks_[perk].xp,
            characterPz.getXp(character, perk), "Fishing xp : ")

    perk = debugDiagnostics.Perks.TRAPPING

    debugDiagnostics.checkTest(5,
            characterAllPerks_[perk].currentLevel, "Trapping Level : ")

    debugDiagnostics.checkTest( characterAllPerks_[perk].xp,
            characterPz.getXp(character, perk), "Trapping xp : ")

    perk = debugDiagnostics.Perks.PLANTSCAVENGING

    debugDiagnostics.checkTest(5,
            characterAllPerks_[perk].currentLevel, "PlantScavenging Level : ")

    debugDiagnostics.checkTest( characterAllPerks_[perk].xp,
            characterPz.getXp(character, perk), "PlantScavenging xp : ")
end

local function tddModDataSkill()
    local characterMaxSkillModData = "characterMaxSkill"
    --- **Remove ModData**
    modDataManager.remove(characterMaxSkillModData)

    --- **Init Part 2**
    ---@type CharacterBaseObj
    local writeMaxSkillObj = skillLimiter.initCharacter()
    debugDiagnostics.checkTest(true, true, "WriteMaxSkillObj")

    --- **Init Part 1**
    ---@type CharacterBaseObj
    local readMaxSkillObj = skillLimiter.initCharacter()
    debugDiagnostics.checkTest(true, true, "ReadMaxSkillObj")

    ---@type table
    local table1 = writeMaxSkillObj:getPerkDetails()
    ---@type table
    local table2 = readMaxSkillObj:getPerkDetails()

    debugDiagnostics.checkTest(#table1,
            #table2, "MaxSkill table length" )

    --- **Check all Perks, currentLevel, maxLevel, xp**
    for i, v in ipairs(table1) do
        if v.perk == table2[i].perk and v.currentLevel == table2[i].currentLevel and
                v.maxLevel == table2[i].maxLevel and v.xp == table2[i].xp then
            debugDiagnostics.checkTest(true, true, "MaxSkill " .. tostring(v.perk) )
        end
    end

    --- **Remove ModData**
    modDataManager.remove(characterMaxSkillModData)
end

local function displaySkill()
    ---@type CharacterBaseObj
    local maxSkillObj =
        characterMaxSkill.getCreateMaxSkill( debugDiagnostics.characterUpdate() )

    for _, v in pairs(maxSkillObj:getPerkDetails()) do
        print("Perk - " .. tostring(v:getPerk()) ..
                " - CurrentLevel " .. tostring(v:getCurrentLevel()) ..
                " - MaxLevel " .. tostring(v:getMaxLevel()) ..
                " - Xp " .. tostring(v:getXp()) )
        debugDiagnostics.printLine()
    end
end

local function calculateMaxSkill()
    CreateCharacterMaxSkillObj =
        characterMaxSkill.getCreateMaxSkill( debugDiagnostics.characterUpdate() )

    for _, v in pairs(CreateCharacterMaxSkillObj:getPerkDetails()) do
        addAllPerks(v:getPerk(), v:getCurrentLevel(), v:getMaxLevel(), v:getXp())
    end
end

local function createCharacter()
    local character = debugDiagnostics.characterUpdate()

    debugDiagnostics.setVerbose(false)
    debugDiagnostics.deleteCharacter()
    debugDiagnostics.createCharacter()
    calculateMaxSkill()
    setCurrentPerksLevel(character)
    blockLevelX(character)
    calculateMaxSkill(character)

    tddSkill()
    tddModDataSkill()

    debugDiagnostics.deleteCharacter()
    debugDiagnostics.createBasicCharacter()
    debugDiagnostics.displayTest()
end

---@param character IsoGameCharacter
local function key24(character, key)
    if key == 24 then -- <<<< o
        print("Key = o > Display Skills \n")
        displaySkill()
    end
end

---@param character IsoGameCharacter
local function key34(character, key)
    if key == 34 then -- <<<< g
        print("Key = g > createCharacter \n")
        createCharacter()
    end
end

---@param character IsoGameCharacter
local function key35(character, key)
    if key == 35 then -- <<< h
        print("Key = h >  \n")

    end
end

---@param character IsoGameCharacter
local function key36(character, key)
    if key == 36 then -- <<<< j
        print("Key = j addXP_PZ >  \n")

    end
end

---@param character IsoGameCharacter
local function key37(character, key)
    if key == 37 then -- <<<< k
        print("Key = k >   \n")

    end
end

---@param character IsoGameCharacter
local function key17(character, key)
    if key == 17 then -- <<<< w
        print("Key = w >   \n")

    end
end

---@param character IsoGameCharacter
local function key18(character, key)
    if key == 18 then -- <<<< e
        print("Key = e >  \n")

    end
end

---@param character IsoGameCharacter
local function key16(character, key)
    if key == 16 then -- <<<< q
        print("Key = q > kill Character \n")
        character:die()
    end
end

local function onCustomUIKeyPressed(key)
    local character = getPlayer()

    --key16(character, key) -- q kill character
    --key17(character, key) -- w
    --key18(character, key) -- e
    --key24(character, key) -- o display skills
    key34(character, key) -- g createCharacter
    --key35(character, key) -- h
    --key36(character, key) -- j
    --key37(character, key) -- k
end

Events.OnCustomUIKeyPressed.Add(onCustomUIKeyPressed)
