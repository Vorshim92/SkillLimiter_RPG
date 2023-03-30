---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by lele.
--- DateTime: 01/02/23 19:11
--- function ISSkillProgressBar:renderPerkRect()
--- ISSkillProgressBar:updateTooltip(lvlSelected)--- event add Xp

local characterMaxLevelCombats, characterMaxLevelPerks = {}

local function OnGameStart()
    local character = getPlayer()

    characterMaxLevelCombats, characterMaxLevelPerks =
    getCreateCharacterMaxSkill(character)
end

local function AddXP(character, perk, level)
    checkLevelMax(character, perk, characterMaxLevelCombats, characterMaxLevelPerks)
end

Events.AddXP.Add(AddXP)
Events.OnGameStart.Add(OnGameStart)
