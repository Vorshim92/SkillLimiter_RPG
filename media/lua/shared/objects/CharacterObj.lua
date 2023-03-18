-----
----- Generated by EmmyLua(https://github.com/EmmyLua)
----- Created by lele.
----- DateTime: 16/03/23 17:44
-----

---@class CharacterObj

--require("media.lua.shared.objects.PerkDetailsObj001")
require("media.lua.shared.objects.PerkDetailsObj001")

CharacterObj = {
    profession = "",
    perkDetails_LIST = {PerkDetailsObj_}
}

function CharacterObj:newObject(t)
    t = t or {}
    setmetatable(t, self)
    self.__index = self
    return t
end

---Current Character
---@param profession string
---@param perk PerkFactory.Perk
---@param level int
---@param xp float
function CharacterObj:currentCharacter(profession, perk, level, xp)
    self.profession = profession

    PerkDetailsObj:addPerkDetails(perk, level, xp)
end

function CharacterObj:addPerkDetails(perk, level, xp)
    PerkDetailsObj = PerkDetailsObj:newObject(nil)

    PerkDetailsObj:addPerkDetails(perk, level, xp)
    table.insert(self.perkDetails_LIST, PerkDetailsObj)
end

---Get object PerkDetailsObj
---@return PerkDetailsObj
function CharacterObj:getPerkDetailsObj()
    return PerkDetailsObj
end

---Get Perk Details
---@return table perk, level, xp
function CharacterObj:getPerkDetails()
    return self.perkDetails_LIST
end

function CharacterObj:setProfession(profession)
    self.profession = profession
end

function CharacterObj:getProfession()
    return self.profession
end
