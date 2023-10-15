---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by lele.
--- DateTime: 07/05/23 15:11
---

---@class PerkFactoryPZ

local PerkFactoryPZ = {}

local errHandler = require("lib/ErrHandler")

--- **Get Perk**
---@param perk PerkFactory
---@return PerkFactory.Perk perk
--- - PerkFactory.Perk : zombie.characters.skills.PerkFactory.Perk
function PerkFactoryPZ.getPerk_PZ(perk)
    if not perk then
        errHandler.errMsg("PerkFactoryPZ.getPerk_PZ(perk)", errHandler.err.IS_NULL_PERK)
        return nil
    end

    return PerkFactory.getPerk(perk)
end

--- **Get Perk from name**
---@param perk String
---@return PerkFactory.Perk perk
--- - PerkFactory.Perk : zombie.characters.skills.PerkFactory.Perk
function PerkFactoryPZ.getPerkByName_PZ(perk)
    if not perk then
        errHandler.errMsg("PerkFactoryPZ.getPerkByName_PZ(perk)", errHandler.err.IS_NULL_PERK)
        return nil
    end

    return PerkFactory.getPerkFromName(perk)
end

--- **Convert Level To Xp**
---@param level int
---@param perk PerkFactory.Perk
---@return float Xp
--- - PerkFactory.Perk : zombie.characters.skills.PerkFactory.Perk
function PerkFactoryPZ.convertLevelToXp(perk, level)
    local characterPz = require("lib/CharacterPZ")

    -- Perks.Sprinting:getXp1()
    ---@type int
    local result

    if not perk or not level then
        errHandler.errMsg("PerkFactoryPZ.convertLevelToXp(perk, level)",
                errHandler.err.IS_NULL_PERK .. " or " .. "level " .. errHandler.err.IS_NULL)
        return nil
    end

    if level == characterPz.EnumNumbers.ONE then
        result = PerkFactoryPZ.getPerk_PZ(perk):getXp1()
    elseif level == characterPz.EnumNumbers.TWO then
        result = PerkFactoryPZ.getPerk_PZ(perk):getXp2()
    elseif level == characterPz.EnumNumbers.THREE then
        result = PerkFactoryPZ.getPerk_PZ(perk):getXp3()
    elseif level == characterPz.EnumNumbers.FOUR then
        result = PerkFactoryPZ.getPerk_PZ(perk):getXp4()
    elseif level == characterPz.EnumNumbers.FIVE then
        result = PerkFactoryPZ.getPerk_PZ(perk):getXp5()
    elseif level == characterPz.EnumNumbers.SIX then
        result = PerkFactoryPZ.getPerk_PZ(perk):getXp6()
    elseif level == characterPz.EnumNumbers.SEVEN then
        result = PerkFactoryPZ.getPerk_PZ(perk):getXp7()
    elseif level == characterPz.EnumNumbers.EIGHT then
        result = PerkFactoryPZ.getPerk_PZ(perk):getXp8()
    elseif level == characterPz.EnumNumbers.NINE then
        result = PerkFactoryPZ.getPerk_PZ(perk):getXp9()
    elseif level == characterPz.EnumNumbers.TEN then
        result = PerkFactoryPZ.getPerk_PZ(perk):getXp10()
    end

    return result

end

--- **Get Parent_PZ**
---@param perk PerkFactory.Perk
---@return String
--- - PerkFactory.Perk : zombie.characters.skills.PerkFactory.Perk
function PerkFactoryPZ.getParent_PZ(perk)
    if not perk then
        errHandler.errMsg("PerkFactoryPZ.getParent_PZ(perk)", errHandler.err.IS_NULL_PERK)
        return nil
    end

    return perk:getParent():getName()
end


return PerkFactoryPZ