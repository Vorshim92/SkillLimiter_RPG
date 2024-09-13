---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by lele.
--- DateTime: 01/02/23 19:11
--- function ISSkillProgressBar:renderPerkRect()
--- ISSkillProgressBar:updateTooltip(lvlSelected)
-- -----------------------------------------------------------------

--- Version 03-11-23 11:56

---@class SkillLimiter

require("lib/CharacterBaseObj")

local blockLevel = require("BlockLevel")
local characterMaxSkill = require("CharacterMaxSkill")
local codePerkDetails = require("CodePerkDetails")
local debugDiagnostics = require("lib/DebugDiagnostics")
local errHandler = require("lib/ErrHandler")
local modDataManager = require("lib/ModDataManager")
local characterPz = require("lib/CharacterPZ")


-- @type CharacterBaseObj
local CreateCharacterMaxSkillObj -- = CharacterBaseObj:new()

local SkillLimiter = {}

---@type string
local characterMaxSkillModData = "characterMaxSkill"

-- **Create Character Max Skill and create ModData**
---@return CharacterBaseObj
--- - IsoGameCharacter : zombie.characters.IsoGameCharacter
function SkillLimiter.initCharacter()
    --- **Init Part 1**

    CreateCharacterMaxSkillObj = CharacterBaseObj:new()

    ---@type table
    local characterMaxSkillTable -- = {}

    --- **Check if ModData exists**
    if modDataManager.isExists(characterMaxSkillModData) then
        print("SkillLimiter - ModData exists")
        --- **Read ModData, get all stats of the character**
        characterMaxSkillTable = modDataManager.read(characterMaxSkillModData)

        --- **Decode ModData**
        CreateCharacterMaxSkillObj = codePerkDetails.decodePerkDetails(characterMaxSkillTable)
    else
        print("SkillLimiter - ModData not exists")
        --- **Init Part 2**

        -- --- **Remove ModData** useless
        -- modDataManager.remove(characterMaxSkillModData)

        --- **Get skill obj**
        CreateCharacterMaxSkillObj =
            characterMaxSkill.getCreateMaxSkill( debugDiagnostics.characterUpdate() )

        --- **Encode ModData**
        characterMaxSkillTable =
            codePerkDetails.encodePerkDetails(CreateCharacterMaxSkillObj)

        --- **Save ModData**
        modDataManager.save(characterMaxSkillModData, characterMaxSkillTable)
    end

    return CreateCharacterMaxSkillObj
end

--- **Delete modData when character is death**
--- - Triggered when a character or zombie is killed
---@param character IsoGameCharacter
---@return void
local function OnCharacterDeath(character)
    --- **Kill player**
    if getPlayer():isDead() then
        --- **Delete ModData**
        modDataManager.remove(characterMaxSkillModData)
    end
end

--- **Check Level Max**
--- - Triggered when a player gains XP.
---@param character IsoGameCharacter
---@param perk PerkFactory.Perk
---@param level int
---@return void
--- - IsoGameCharacter : zombie.characters.IsoGameCharacter
--- - PerkFactory.Perk : zombie.characters.skills.PerkFactory.Perk
function SkillLimiter.AddXP(character, perk, level)

    --- **Check if character is null**
    if not character then
        errHandler.errMsg("SkillLimiter.AddXP(character, perk, level)",
                errHandler.err.IS_NULL_CHARACTERS)
        return nil
    end

    --- **Check if perk is null**
    if not perk then
        errHandler.errMsg("SkillLimiter.AddXP(character, perk, level)",
                errHandler.err.IS_NULL_PERK)
        return nil
    end

    --- **Check if level is null**
    if not level then
        errHandler.errMsg("SkillLimiter.AddXP(character, perk, level)",
                errHandler.err.IS_NULL_LEVEL)
        return nil
    end

    --- **Check if CreateCharacterMaxSkillObj is null**
    if not CreateCharacterMaxSkillObj then
        errHandler.errMsg("SkillLimiter.AddXP(character, perk, level)",
                " CreateCharacterMaxSkillObj " .. errHandler.err.IS_NULL)
        return nil
    end

    print("gli XP guadagnati sono: " .. level .. " e sono per: " .. perk:getName())
    -- fix loop 
    if level <= 0 then
        print("SkillLimiter: gli XP sono negativi quindi non continuo")
        return
    end

    blockLevel.calculateBlockLevel(character, perk, level, CreateCharacterMaxSkillObj)
end

function SkillLimiter.checkLevelMax(character, perk)
    local currentPerkLevel = characterPz.getPerkLevel_PZ(character, perk)
    print("checkLevelMax: livello attuale del perk: " .. currentPerkLevel .. " e nome del perk è : " .. perk:getName())
    local maxLevel = characterPz.EnumNumbers.TEN
    local result = false
    for _, v in pairs(CreateCharacterMaxSkillObj:getPerkDetails()) do
        if v:getPerk() == perk then
            print("checkLevelMax: dentro if v:getPerk() == perk")
            -- print("checkLevelMax: v:getCurrentLevel(): ", v:getCurrentLevel())
            print("checkLevelMax: v:getMaxLevel(): ", v:getMaxLevel())
            if currentPerkLevel == maxLevel then
                result = true
                return result
            end
        
            if currentPerkLevel >= v:getMaxLevel() then
                print("checkLevelMax: dentro if currentPerkLevel >= v:getMaxLevel() " .. currentPerkLevel .. " >= " .. v:getMaxLevel())
                result = true
            end
            break
        end
    end
    return result 
end

--- **Init Character**
--- - Triggered after the start of a new game, and after a saved game has been loaded.
local function OnGameStart()
    CreateCharacterMaxSkillObj = SkillLimiter.initCharacter()
end

--- **Init Character**
--- - Triggered when a player is being created.
local function OnCreatePlayer(playerIndex, player)
    --- **Remove ModData** 
    -- modDataManager.remove(characterMaxSkillModData)
    if modDataManager.isExists(characterMaxSkillModData) then
        print("SkillLimiter.OnCreatePlayer - ModData exists")
    end
    
    --- **Init Create Character Max Skill object from initCharacter()**
    CreateCharacterMaxSkillObj = SkillLimiter.initCharacter()
end

Events.OnCharacterDeath.Add(OnCharacterDeath)
Events.AddXP.Add(SkillLimiter.AddXP)
-- Events.OnGameStart.Add(function ()
--     -- per capire in che momento viene chiamato questo  evento, se prima o dopo moddata
--     print("OnGameStart nasce qui")
--     -- OnGameStart()
-- end)
-- OnCreatePlayer non si può usare perché in quel momento non esistono ancora i ModData quindi verrebero cancellati da modDataManager.remove
Events.OnCreatePlayer.Add(OnCreatePlayer)


-- Events.OnInitGlobalModData.Add(function (isNewGame)
--     modData.request(characterMaxSkillModData)
-- end)
-- Events.OnReceiveGlobalModData.Add(function (key, modData)
--     print("OnReceiveGlobalModData: ", key)
--     -- forse questo non può funzionare se non viene prima chiamato 
--     if key == characterMaxSkillModData then
--         OnGameStart()
--     end
-- end)



return SkillLimiter