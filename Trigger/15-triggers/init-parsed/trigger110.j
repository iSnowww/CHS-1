library trigger110 initializer init requires RandomShit

    function Trig_Sudden_Death_Timer_Func002Func001A takes nothing returns nothing
        call SetUnitMoveSpeed(GetEnumUnit(),(GetUnitMoveSpeed(GetEnumUnit())+ 25.00))
        if GetUnitAbilityLevel(GetEnumUnit(), 'AOcr') == 0 then
            call UnitAddAbility(GetEnumUnit(), 'AOcr')
        elseif GetUnitAbilityLevel(GetEnumUnit(), 'AOcr') < 10 then
            call SetUnitAbilityLevel(GetEnumUnit(), 'AOcr', 10)
        endif
    endfunction


    function Trig_Sudden_Death_Timer_Func002Func002Func001A takes nothing returns nothing
        call UnitAddAbilityBJ('Atru',GetEnumUnit())
        call UnitAddAbilityBJ('A00W',GetEnumUnit())
        call UnitAddAbilityBJ('A01B',GetEnumUnit())
        if UnitGetAttackDamage(GetEnumUnit()) < 1000000 then
            if UnitGetAttackDamage(GetEnumUnit()) == 0 then
                call UnitSetAttackDamage(GetEnumUnit(), R2I(BlzGetUnitBaseDamage(GetEnumUnit(), 0) * 0.1) + 1)
            endif
            call UnitSetAttackDamage(GetEnumUnit(), R2I(UnitGetAttackDamage(GetEnumUnit()) * 1.1) + 1)
        endif
    endfunction


    function Trig_Sudden_Death_Timer_Func002Func002Func002Func001001001 takes nothing returns boolean
        return(IsPlayerInForce(GetFilterPlayer(),udg_force03)!=true)
    endfunction


    function Trig_Sudden_Death_Timer_Func002Func002Func002Func001A takes nothing returns nothing
        call SetUnitLifeBJ(udg_units01[GetConvertedPlayerId(GetEnumPlayer())],(GetUnitStateSwap(UNIT_STATE_LIFE,udg_units01[GetConvertedPlayerId(GetEnumPlayer())])- 1))
    endfunction


    function Trig_Sudden_Death_Timer_Actions takes nothing returns nothing
        set udg_integer39 =(udg_integer39 + 1)
        if udg_integer39 == 120 or udg_integer39 == 240 or udg_integer39 == 480 or udg_integer39 == 720 then
            call UpdateSuddenDeathTimer()
        endif
        if(Trig_Sudden_Death_Timer_Func002C())then
            call ForGroupBJ(GetUnitsInRectOfPlayer(GetPlayableMapRect(),Player(11)),function Trig_Sudden_Death_Timer_Func002Func001A)
            if(Trig_Sudden_Death_Timer_Func002Func002C())then
                call ForGroupBJ(GetUnitsInRectOfPlayer(GetPlayableMapRect(),Player(11)),function Trig_Sudden_Death_Timer_Func002Func002Func001A)
                if(Trig_Sudden_Death_Timer_Func002Func002Func002C())then
                    call ForForce(GetPlayersMatching(Condition(function Trig_Sudden_Death_Timer_Func002Func002Func002Func001001001)),function Trig_Sudden_Death_Timer_Func002Func002Func002Func001A)
                else
                endif
            else
            endif
        else
        endif
    endfunction


    private function init takes nothing returns nothing
        set udg_trigger110 = CreateTrigger()
        call DisableTrigger(udg_trigger110)
        call TriggerRegisterTimerEventPeriodic(udg_trigger110,0.25)
        call TriggerAddAction(udg_trigger110,function Trig_Sudden_Death_Timer_Actions)
    endfunction


endlibrary