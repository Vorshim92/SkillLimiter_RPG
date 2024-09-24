---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by lele.
--- DateTime: 30/10/23 17:52
---

---@class CodePerkDetails

require("lib/CharacterBaseObj")
require("lib/PerkDetailsObj")

local perkFactoryPZ = require("lib/PerkFactoryPZ")
local dataValidator = require("lib/DataValidator")
local errHandler = require("lib/ErrHandler")

local CodePerkDetails = {}

--- **Encode Perk Details convert the CharacterObj into a table. The ModData only accepts a table**
---@param characterObj CharacterBaseObj
---@return table
function CodePerkDetails.encodePerkDetails(characterObj)
    --- **Check if characterObj is null**
    if not characterObj then
        errHandler.errMsg("CharacterLib.encodePerkDetails(characterObj)",
                "characterObj " .. errHandler.err.IS_NULL)
    end

    ---@type table
    local lines = {}

for _, v in pairs(characterObj:getPerkDetails()) do
    print(v.perk:getId())
    lines[v.perk:getId()] = {
        currentLevel = v:getCurrentLevel(),
        maxLevel = v:getMaxLevel(),
        xp = v:getXp()
    }
end


    return lines
end

--- **Decode Perk Details convert a table into CharacterObj**
---@param characterPerkDetails table
---@return CharacterBaseObj getPerkDetails()
--- - IsoGameCharacter : zombie.characters.IsoGameCharacter
function CodePerkDetails.decodePerkDetails(characterPerkDetails)
    --- **Check if characterPerkDetails is table**
    if not dataValidator.isTable(characterPerkDetails) then
        errHandler.errMsg("CharacterLib.decodePerkDetails(characterPerkDetails)",
                "characterPerkDetails " .. errHandler.err.IS_NOT_TABLE)
        return nil
    end

    -- @type CharacterBaseObj
    local CharacterObj01 = CharacterBaseObj:new()

    -- @param perk PerkFactory.Perk
    -- @param currentlevel int
    -- @param maxLevel
    -- @param xp float
    for perkName, details in pairs(characterPerkDetails) do
    -- @type PerkDetailsObj
    local PerkDetailsObj01 = PerkDetailsObj:new()
    print("decodePerk name/id: ", perkName)
    --- **Set Perk**
    PerkDetailsObj01:setPerk(perkName)
    --- **Set Current Level**
    PerkDetailsObj01:setCurrentLevel(details.currentLevel)
    print("decodePerk current level: ", details.currentLevel)
    --- **Set Max Level**
    PerkDetailsObj01:setMaxLevel(details.maxLevel)
    print("decodePerk max level: ", details.maxLevel)
    --- **Set Xp**
    PerkDetailsObj01:setXp(details.xp)
    print("decodePerk xp: ", details.xp)
    --- **Save Perk Details**
    CharacterObj01:savePerkDetails(PerkDetailsObj01)
end

    return CharacterObj01
end

return CodePerkDetails