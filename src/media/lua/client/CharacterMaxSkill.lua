-----
----- Generated by EmmyLua(https://github.com/EmmyLua)
----- Created by lele.
----- DateTime: 19/03/23 09:20
-----

---@class CharacterMaxSkill

local characterPz = require("lib/CharacterPZ")
local perkFactoryPZ = require("lib/PerkFactoryPZ")
require("lib/CharacterObj")

---Defines maximum character level
---@param levelCurrentPerk int
---@return int
local function getCharacterMaxLevelPerkObj(levelCurrentPerk)
    if not levelCurrentPerk then
        return nil
    end

    local result

    if levelCurrentPerk == characterPz.EnumNumbers.ZERO then -- 0
        result = characterPz.EnumNumbers.FIVE -- max levelPerk 5
    elseif levelCurrentPerk == characterPz.EnumNumbers.ONE then -- 1
        result = characterPz.EnumNumbers.SIX -- max levelPerk 6
    elseif levelCurrentPerk == characterPz.EnumNumbers.TWO then -- 2
        result = characterPz.EnumNumbers.EIGHT -- max levelPerk 8
    elseif levelCurrentPerk >= characterPz.EnumNumbers.THREE then -- 3
        result = characterPz.EnumNumbers.TEN -- max levelPerk 10
    end

    return result
end

---Get Combat Max Level
---@param combatCurrentPerk int
---@return int Combat Max Level
local function getCharacterMaxLevelCombatObj(combatCurrentPerk)
    if not combatCurrentPerk then
        return nil
    end

    local result

    if combatCurrentPerk == characterPz.EnumNumbers.ZERO then -- 0
        result = characterPz.EnumNumbers.FIVE -- max levelPerk 5
    elseif combatCurrentPerk == characterPz.EnumNumbers.ONE then -- 1
        result = characterPz.EnumNumbers.SEVEN -- max levelPerk 7
    elseif combatCurrentPerk >= characterPz.EnumNumbers.TWO then -- 2
        result = characterPz.EnumNumbers.TEN -- max levelPerk 10
    end

    return result
end

local function getCharacterProfessionMaxLevel( levelCurrentPerk )
    return getCharacterMaxLevelPerkObj(levelCurrentPerk)
end

--- Get Create Character Max Skill
---@param character IsoGameCharacter
---@return CharacterObj getPerkDetails() -- table PerkFactory.Perk perk, int level, float xp
--- - IsoGameCharacter : zombie.characters.IsoGameCharacter
function getCreateCharacterMaxSkill(character)
    if not character then
        return nil
    end

    local combat = "Combat"

    local CharacterCreationObj = CharacterObj:new()
    CharacterCreationObj = getCharacterCreation(character)

    for _, v in pairs(CharacterCreationObj:getPerkDetails()) do
        if v:getFlag() == true then
            v:setLevel( getCharacterProfessionMaxLevel(v:getLevel()))
        else
            if combat == perkFactoryPZ.getParent_PZ( v:getPerk() )  then
                v:setLevel( getCharacterMaxLevelCombatObj(0))
            else
                v:setLevel( getCharacterMaxLevelPerkObj(0))
            end
        end
    end

    return CharacterCreationObj
end