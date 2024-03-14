-------------------------------------------------------------------------------------
-- Title: Mik's Combat Event Helper
-- Author: Mik
-- Maintainer: Athene
-------------------------------------------------------------------------------------
local _G = _G or getfenv(0)
local fstrike = _G.fstrike or {}

fstrike.lastMaxRank = 0

fstrike.flamestrike = function()
    local currentTime = GetTime()
    -- check if at least 5 seconds since last max rank
    if currentTime - fstrike.lastMaxRank >= 5 then
        CastSpellByName("Flamestrike(Rank 6)")
        fstrike.lastMaxRank = currentTime
    else
        CastSpellByName("Flamestrike(Rank 5)")
    end
end

fstrike.makeSlashCommand = function(aName, aBehaviour)
    local nameUpperCase = string.upper(aName)
    _G["SLASH_" .. nameUpperCase .. 1] = "/" .. aName
    SlashCmdList[nameUpperCase] = aBehaviour
end

fstrike.makeSlashCommand("flamestrike", function(msg)
    fstrike.flamestrike(msg)
end)
