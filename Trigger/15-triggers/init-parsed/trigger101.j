library trigger101 initializer init requires RandomShit

    function Trig_Creep_AutoCast_Func001Func001Func002Func002003001003001001 takes nothing returns boolean
        return(IsUnitAliveBJ(GetFilterUnit())==true)
    endfunction


    function Trig_Creep_AutoCast_Func001Func002Func002Func001003001001001003001001 takes nothing returns boolean
        return(IsUnitAliveBJ(GetFilterUnit())==true)
    endfunction


    function Trig_Creep_AutoCast_Func001Func003Func002Func002003001001003001001 takes nothing returns boolean
        return(IsUnitAliveBJ(GetFilterUnit())==true)
    endfunction


    function Trig_Creep_AutoCast_Func001Func004Func002Func002003001003001001 takes nothing returns boolean
        return(IsUnitAliveBJ(GetFilterUnit())==true)
    endfunction


    function Trig_Creep_AutoCast_Func001Func005Func002Func002003001003001001 takes nothing returns boolean
        return(IsUnitAliveBJ(GetFilterUnit())==true)
    endfunction


    function Trig_Creep_AutoCast_Func001Func006Func002Func001003001003001001 takes nothing returns boolean
        return(IsUnitAliveBJ(GetFilterUnit())==true)
    endfunction


    function Trig_Creep_AutoCast_Func001Func008Func002Func002003001003001001 takes nothing returns boolean
        return(IsUnitAliveBJ(GetFilterUnit())==true)
    endfunction


    function Trig_Creep_AutoCast_Func001A takes nothing returns nothing
    
        if (IsUnitAliveBJ(GetEnumUnit())==true) then
    
            if(Trig_Creep_AutoCast_Func001Func001C())then
                set udg_integer14 = GetRandomInt(1,5)
                if(Trig_Creep_AutoCast_Func001Func001Func002C())then
                    if(Trig_Creep_AutoCast_Func001Func001Func002Func001C())then
                        call SetUnitAbilityLevelSwapped('A00V',GetEnumUnit(),((udg_integer02 * 4)/ udg_integer03))
                    else
                        call SetUnitAbilityLevelSwapped('A00V',GetEnumUnit(),(((udg_integer02 * 4)/ udg_integer03)/ 2))
                    endif
                    call IssueTargetOrderBJ(GetEnumUnit(),"manaburn",GroupPickRandomUnit(GetUnitsInRangeOfLocMatching(300.00,GetUnitLoc(GetEnumUnit()),Condition(function Trig_Creep_AutoCast_Func001Func001Func002Func002003001003))))
                else
                endif
            else
            endif
            if(Trig_Creep_AutoCast_Func001Func002C())then
                set udg_integer14 = GetRandomInt(1,5)
                if(Trig_Creep_AutoCast_Func001Func002Func002C())then
                    call IssuePointOrderLocBJ(GetEnumUnit(),"blink",OffsetLocation(GetUnitLoc(GroupPickRandomUnit(GetUnitsInRangeOfLocMatching(800.00,GetUnitLoc(GetEnumUnit()),Condition(function Trig_Creep_AutoCast_Func001Func002Func002Func001003001001001003)))),GetRandomReal(- 100.00,100.00),GetRandomReal(- 100.00,100.00)))
                else
                endif
            else
            endif
            if(Trig_Creep_AutoCast_Func001Func003C())then
                set udg_integer14 = GetRandomInt(1,5)
                if(Trig_Creep_AutoCast_Func001Func003Func002C())then
                    if(Trig_Creep_AutoCast_Func001Func003Func002Func001C())then
                        call SetUnitAbilityLevelSwapped('A00U',GetEnumUnit(),((udg_integer02 * 4)/ udg_integer03))
                    else
                        call SetUnitAbilityLevelSwapped('A00U',GetEnumUnit(),(((udg_integer02 * 4)/ udg_integer03)/ 2))
                    endif
                    call IssuePointOrderLocBJ(GetEnumUnit(),"shockwave",GetUnitLoc(GroupPickRandomUnit(GetUnitsInRangeOfLocMatching(800.00,GetUnitLoc(GetEnumUnit()),Condition(function Trig_Creep_AutoCast_Func001Func003Func002Func002003001001003)))))
                else
                endif
            else
            endif
            if(Trig_Creep_AutoCast_Func001Func004C())then
                set udg_integer14 = GetRandomInt(1,5)
                if(Trig_Creep_AutoCast_Func001Func004Func002C())then
                    if(Trig_Creep_AutoCast_Func001Func004Func002Func001C())then
                        call SetUnitAbilityLevelSwapped('A00W',GetEnumUnit(),((udg_integer02 * 4)/ udg_integer03))
                    else
                        call SetUnitAbilityLevelSwapped('A00W',GetEnumUnit(),(((udg_integer02 * 4)/ udg_integer03)/ 2))
                    endif
                    call IssueTargetOrderBJ(GetEnumUnit(),"creepthunderbolt",GroupPickRandomUnit(GetUnitsInRangeOfLocMatching(800.00,GetUnitLoc(GetEnumUnit()),Condition(function Trig_Creep_AutoCast_Func001Func004Func002Func002003001003))))
                else
                endif
            else
            endif
            if(Trig_Creep_AutoCast_Func001Func005C())then
                set udg_integer14 = GetRandomInt(1,5)
                if(Trig_Creep_AutoCast_Func001Func005Func002C())then
                    if(Trig_Creep_AutoCast_Func001Func005Func002Func001C())then
                        call SetUnitAbilityLevelSwapped('A00X',GetEnumUnit(),((udg_integer02 * 4)/ udg_integer03))
                    else
                        call SetUnitAbilityLevelSwapped('A00X',GetEnumUnit(),(((udg_integer02 * 4)/ udg_integer03)/ 2))
                    endif
                    call IssueTargetOrderBJ(GetEnumUnit(),"rejuvination",GroupPickRandomUnit(GetUnitsInRangeOfLocMatching(400.00,GetUnitLoc(GetEnumUnit()),Condition(function Trig_Creep_AutoCast_Func001Func005Func002Func002003001003))))
                else
                endif
            else
            endif
            if(Trig_Creep_AutoCast_Func001Func006C())then
                set udg_integer14 = GetRandomInt(1,5)
                if(Trig_Creep_AutoCast_Func001Func006Func002C())then
                    call IssueTargetOrderBJ(GetEnumUnit(),"slow",GroupPickRandomUnit(GetUnitsInRangeOfLocMatching(600.00,GetUnitLoc(GetEnumUnit()),Condition(function Trig_Creep_AutoCast_Func001Func006Func002Func001003001003))))
                else
                endif
            else
            endif
            if(Trig_Creep_AutoCast_Func001Func007C())then
                set udg_integer14 = GetRandomInt(1,5)
                if(Trig_Creep_AutoCast_Func001Func007Func002C())then
                    if(Trig_Creep_AutoCast_Func001Func007Func002Func001C())then
                        call IssueImmediateOrderBJ(GetEnumUnit(),"voodoo")
                    else
                    endif
                else
                endif
            else
            endif
            if(Trig_Creep_AutoCast_Func001Func008C())then
                set udg_integer14 = GetRandomInt(1,5)
                if(Trig_Creep_AutoCast_Func001Func008Func002C())then
                    if(Trig_Creep_AutoCast_Func001Func008Func002Func001C())then
                        call SetUnitAbilityLevelSwapped('A016',GetEnumUnit(),((udg_integer02 * 4)/ udg_integer03))
                    else
                        call SetUnitAbilityLevelSwapped('A016',GetEnumUnit(),(((udg_integer02 * 4)/ udg_integer03)/ 2))
                    endif
                    call IssueTargetOrderBJ(GetEnumUnit(),"faeriefire",GroupPickRandomUnit(GetUnitsInRangeOfLocMatching(700.00,GetUnitLoc(GetEnumUnit()),Condition(function Trig_Creep_AutoCast_Func001Func008Func002Func002003001003))))
                else
                endif
            else
            endif
            if(Trig_Creep_AutoCast_Func001Func009C())then
                set udg_integer14 = GetRandomInt(1,5)
                if(Trig_Creep_AutoCast_Func001Func009Func002C())then
                    if(Trig_Creep_AutoCast_Func001Func009Func002Func001C())then
                        if(Trig_Creep_AutoCast_Func001Func009Func002Func001Func002C())then
                            call SetUnitAbilityLevelSwapped('A01B',GetEnumUnit(),((udg_integer02 * 4)/ udg_integer03))
                        else
                            call SetUnitAbilityLevelSwapped('A01B',GetEnumUnit(),(((udg_integer02 * 4)/ udg_integer03)/ 2))
                        endif
                        call IssueImmediateOrderBJ(GetEnumUnit(),"thunderclap")
                    else
                    endif
                else
                endif
            else
            endif
        endif
    endfunction


    function Trig_Creep_AutoCast_Actions takes nothing returns nothing
        local group GRP = GetUnitsOfPlayerMatching(Player(11),null)
        call ForGroupBJ(GRP,function Trig_Creep_AutoCast_Func001A)
        call DestroyGroup(GRP)
        set GRP = null
    endfunction


    private function init takes nothing returns nothing
        set udg_trigger101 = CreateTrigger()
        call TriggerRegisterTimerEventPeriodic(udg_trigger101,1.00)
        call TriggerAddAction(udg_trigger101,function Trig_Creep_AutoCast_Actions)
    endfunction


endlibrary