library trigger138 initializer init requires RandomShit

    function Trig_Receive_Prize_Conditions takes nothing returns boolean
        if(not(CountUnitsInGroup(udg_group03)> 0))then
            return false
        endif
        return true
    endfunction


    function Trig_Receive_Prize_Func002A takes nothing returns nothing
        if(Trig_Receive_Prize_Func002Func003C())then
            call SetPlayerState(GetOwningPlayer(GetEnumUnit()), PLAYER_STATE_RESOURCE_GOLD, GetPlayerState(GetOwningPlayer(GetEnumUnit()), PLAYER_STATE_RESOURCE_GOLD) + udg_integer15)
            call GroupRemoveUnitSimple(GetEnumUnit(),udg_group03)
        else
        endif
    endfunction


    function Trig_Receive_Prize_Actions takes nothing returns nothing
        call ForGroupBJ(udg_group03,function Trig_Receive_Prize_Func002A)
        call TriggerSleepAction(0.50)
        call ConditionalTriggerExecute(GetTriggeringTrigger())
    endfunction


    private function init takes nothing returns nothing
        set udg_trigger138 = CreateTrigger()
        call TriggerAddCondition(udg_trigger138,Condition(function Trig_Receive_Prize_Conditions))
        call TriggerAddAction(udg_trigger138,function Trig_Receive_Prize_Actions)
    endfunction


endlibrary