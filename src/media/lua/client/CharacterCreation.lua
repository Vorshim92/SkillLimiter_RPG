---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by lele.
--- DateTime: 25/10/23 19:42
---

---@class CharacterCreation

require("lib/CharacterBaseObj")

local characterLib = require("CharacterLib")
local debugDiagnostics = require("lib/DebugDiagnostics")
local errHandler = require("lib/ErrHandler")
local group = require("Group")
local perkFactoryPZ = require("lib/PerkFactoryPZ")

local CharacterCreation = {}

---@type table
local mergeTraitsPerks_ = {}

---@type table
local characterAllPerks_ = {}

--- **Remove perks from mergeTraitsPerks_**
---@param key PerkFactory.Perk
---@return void
--- - PerkFactory.Perk : zombie.characters.skills.PerkFactory.Perk
local function removeTraitsPerks(key)
    mergeTraitsPerks_[key] = nil
end

--- **Merge Traits and Perks into mergeTraitsPerks_**
---@param perk PerkFactory.Perk
---@return void
--- - PerkFactory.Perk : zombie.characters.skills.PerkFactory.Perk
local function addTraitsPerks(perk)
    if not mergeTraitsPerks_[perk] then
        mergeTraitsPerks_[perk] = "unusedValue"
    end
end

--- **Add All Perks to characterAllPerks_**
---@param perk PerkFactory.Perk
---@param currentLevel int
---@param maxLevel int
---@param group_ string
---@return void
--- - PerkFactory.Perk : zombie.characters.skills.PerkFactory.Perk
local function addAllPerks(perk, currentLevel, maxLevel, group_)
    characterAllPerks_[perk] = {
        ---@type PerkFactory.Perk
        perk = perk,
        ---@type int
        currentLevel = currentLevel,
        ---@type int
        maxLevel = maxLevel,
        ---@type string
        group = group_
    }
end

--- **Set Group**
---@param perk PerkFactory.Perk
---@param group_ string
---@return void
--- - PerkFactory.Perk : zombie.characters.skills.PerkFactory.Perk
local function setGroup(perk, group_)
    characterAllPerks_[perk].group = group_
end

--- **Merge all Trait and Perk From Profession**
---@param character IsoGameCharacter
---@return void
--- - IsoGameCharacter : zombie.characters.IsoGameCharacter
local function mergeTraitPerkFromProfession(character)
    --- **Check if character is null**
    if not character then
        errHandler.errMsg("mergeTraitPerkFromProfession(character)",
                errHandler.err.IS_NULL_CHARACTER)
        return nil
    end

    ---@type CharacterBaseObj
    local CharacterProfessionObj = characterLib.getPerkProfession(character)

    ---@type CharacterBaseObj
    local CharacterTraitsPerkObj = characterLib.getTraitsPerk(character)

    --- **Merge Traits and Perks profession into a table**
    for _, v in pairs(CharacterProfessionObj:getPerkDetails()) do
        addTraitsPerks(v:getPerk())
    end

    --- **Merge Traits and Perks into a table**
    for _, v in pairs(CharacterTraitsPerkObj:getPerkDetails()) do
        addTraitsPerks(v:getPerk())
    end

end

--- **Add All Perks to characterAllPerks_**
---@param character IsoGameCharacter
---@return void
--- - IsoGameCharacter : zombie.characters.IsoGameCharacter
local function characterAllPerks(character)
    --- **Check if character is null**
    if not character then
        errHandler.errMsg("characterAllPerks(character)",
                errHandler.err.IS_NULL_CHARACTER)
        return nil
    end

    -- @type CharacterBaseObj
    local CharacterAllPerksObj = characterLib.getAllPerks(character)

    for _, v in pairs(CharacterAllPerksObj:getPerkDetails()) do
        addAllPerks(v:getPerk(), v:getCurrentLevel(), "", "")
    end
end

--- **Set No Limits Group**
---@return void
local function setNoLimitsGroup()
    ---@type PerkFactory.Perk
    local fitness = debugDiagnostics.Perks.FITNESS
    ---@type PerkFactory.Perk
    local strength = debugDiagnostics.Perks.STRENGTH

    --- **set no limits group**
    setGroup(fitness, group.NO_LIMITS )
    setGroup(strength, group.NO_LIMITS )

    --- **Remove perks from Trait & Perk**
    removeTraitsPerks(fitness)
    removeTraitsPerks(strength)
end

--- **Set Profession Group**
---@return void
local function setProfessionGroup()
    for perk, _ in pairs(mergeTraitsPerks_) do
        setGroup(perk, group.PROFESSION)
    end
end

--- **Set Combat Group**
--- - Feature disabled, check CharacterMaxSkill
--- - **!!!!! DANGER !!!!!** Possible conflict with Profession group
---@return void
local function setCombatGroup()
    for perk, _ in pairs(mergeTraitsPerks_) do
        --- **Possible conflict with Profession group**
        if "combat" == perkFactoryPZ.getParent_PZ(perk) then
            setGroup(perk, group.COMBAT)
        end
    end
end

--- **Set Generic Group**
---@return void
local function setGenericGroup()
    for perk, value in pairs(characterAllPerks_) do
        if value.group == "" then
            setGroup(perk, group.GENERIC)
        end
    end
end

--- **Create rules for the character**
---@param character IsoGameCharacter
---@return table PerkFactory.Perk perk, int currentlevel, int maxlevel, string group
--- - IsoGameCharacter : zombie.characters.IsoGameCharacter
function CharacterCreation.getCharacterCreation(character)
    --- **Check if character is null**
    if not character then
        errHandler.errMsg("CharacterCreation.getCharacterCreation(character)",
                errHandler.err.IS_NULL_CHARACTER)
        return nil
    end

    characterAllPerks(character)
    mergeTraitPerkFromProfession(character) --roba inutile??

    setNoLimitsGroup()
    setProfessionGroup()
    --- **Feature disabled, check CharacterMaxSkill **
    -- setCombatGroup()
    setGenericGroup()

    return characterAllPerks_
end


return CharacterCreation