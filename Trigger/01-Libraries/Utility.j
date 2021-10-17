library Utility
    globals
        boolean array CurrentlyFighting
    endglobals
    function GetHeroPrimaryStat takes unit u returns integer
        local integer i = BlzGetUnitIntegerField(u, UNIT_IF_PRIMARY_ATTRIBUTE)
        if i == 1 then
            return 0
        elseif i == 2 then
            return 2
        else
            return 1
        endif
    endfunction

    function IsPrimaryStat takes unit u, integer stat returns boolean
        local integer i = BlzGetUnitIntegerField(u, UNIT_IF_PRIMARY_ATTRIBUTE)
        return (i == 1 and stat == 0) or (i == 2 and stat == 2) or (i == 3 and stat == 1)
    endfunction

    function SetCurrentlyFighting takes player p, boolean b returns nothing
        set CurrentlyFighting[GetPlayerId(p)] = b
    endfunction

    function SetAllCurrentlyFighting takes boolean b returns nothing
        local integer i = 0
        loop
            set CurrentlyFighting[i] = b
            set i = i + 1
            exitwhen i > 8
        endloop
    endfunction

    function HasPlayerFinishedLevel takes unit u, player p returns boolean
        return CurrentlyFighting[GetPlayerId(p)] == false
        //return (IsPlayerInForce(p,udg_force03) and udg_boolean02 == false and udg_units03[2] != u and udg_units03[1] != u and PvpPrepare = false) or BattleRoyal = true
    endfunction

    function CalculateNewCurrentHP takes unit u, real hpBonus returns nothing
        //call BJDebugMsg("calc new current hp")
        //call BJDebugMsg("current hp: " + R2S(GetUnitState(u, UNIT_STATE_LIFE)))
        //call BJDebugMsg("multiplier: (" + I2S(BlzGetUnitMaxHP(u)) + "/" + R2S((BlzGetUnitMaxHP(u) - hpBonus)) + ") = " + R2S((BlzGetUnitMaxHP(u) / (BlzGetUnitMaxHP(u) - hpBonus))))
        //call BJDebugMsg("result: " + R2S(GetUnitState(u, UNIT_STATE_LIFE) * (BlzGetUnitMaxHP(u) / (BlzGetUnitMaxHP(u) - hpBonus))))
        call SetUnitState(u, UNIT_STATE_LIFE, GetUnitState(u, UNIT_STATE_LIFE) * (BlzGetUnitMaxHP(u) / (BlzGetUnitMaxHP(u) - hpBonus)))
    endfunction
endlibrary