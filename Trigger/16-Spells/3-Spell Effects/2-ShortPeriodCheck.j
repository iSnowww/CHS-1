function Trig_ShortPeriodCheck_Actions takes nothing returns nothing
    local integer II = 0
    local integer i1 = 0
    local integer i2 = 0
    local string s = null
    local string s2 = null
    local string s3 = null
    local unit u
    local integer hid = 0
    
    loop
        exitwhen II > 8
        set u = udg_units01[II]
        set hid = GetHandleId(u)
        if GetWidgetLife(u) > 0.405 then

            //Power of Ice
            if GetUnitAbilityLevel(u ,'A02Z') >= 1 then
                if CheckProc(u, 610) then
                    call ElemFuncStart(u,'A02Z')
                    call USOrderA(u,GetUnitX(u),GetUnitY(u),'A02Y',"fanofknives", 200 + GetUnitAbilityLevel(u ,'A02Z')*50 + GetHeroLevel(u)*(0.8 + 0.2*GetUnitAbilityLevel(u ,'A02Z')), ConvertAbilityRealLevelField('Ocl1') )
                endif
                
            endif
            
            //Absolute Blood
            set i1 = GetUnitAbilityLevel(u,'A07R')
            if i1 > 0 then
                    set s = GetDesriptionAbility('A07R',i1-1)
                    if LoadReal(HT,hid,-93001) == 0 then
                        set s2 = "50"
                    else
                         set s2 = I2S(R2I(LoadReal(HT,hid,-93001)))
                    endif
                    
                    set s3 = ReplaceText("2000",s2,s)
                    set s3 = ReplaceText(",0000,", R2S(   LoadReal(HT,hid,-93000) ) ,s3)
                if GetLocalPlayer() == GetOwningPlayer(u) then
                    call BlzSetAbilityExtendedTooltip('A07R',s3  , i1-1  ) 
                endif
            
            endif
            
            //Ancient Blood
            set i1 = GetUnitAbilityLevel(u,'A07T')
            if i1 > 0 then
                set s = GetDesriptionAbility('A07T',i1-1)
                if LoadReal(HT,hid,82341) == 0 then
                    set s2 =    "20000"
                else
                     set s2 = I2S(R2I(LoadReal(HT,hid,82341)*(1- I2R(i1)*0.01 ) ))
                endif
                
                set s3 = ReplaceText("20,000",s2,s) 
                set s3 = ReplaceText(",0000,", R2S(   LoadReal(HT,hid,82340) ) ,s3)
                    
                if GetLocalPlayer() == GetOwningPlayer(u) then
                    call BlzSetAbilityExtendedTooltip('A07T',s3  , i1-1  ) 
                endif
            
            endif
                    
            //Absolute Cold
            set i1 = GetUnitAbilityLevel(u,'A07V')
            if i1 > 0 then
                set i2 =  LoadInteger(HT,hid,-41256)
                if i2 == 4 then
                    set i2 = 0
                    call AbsoluteCold(u,GetClassUnitSpell(u,9)*20*i1 )
                else
                    set i2 = i2 + 1
                  
                endif
                call SaveInteger(HT,hid,-41256,i2)
            endif
            
            //Divine Gift
            set i1 = GetUnitAbilityLevel(u,'A082')
            if i1 > 0 then
                set i2 =  LoadInteger(HT,hid,-41257)
                if i2 == 8 then
                    set i2 = 0
                    call SetWidgetLife(u,GetWidgetLife(u)+2500*i1)
                    call AddSpecialEffectTargetTimer( "Abilities\\Spells\\Human\\Resurrect\\ResurrectTarget.mdl", u, "chest",3, false)
                    call RemoveDebuff( u )
                else
                    set i2 = i2 + 1
                  
                endif
                call SaveInteger(HT,hid,-41257,i2)
            endif       
            
            //Blood Elf Mage
            if GetUnitTypeId(u) == 'H001' then
                set i1 = R2I(GetUnitState(u, UNIT_STATE_MAX_MANA))
                set i1 = R2I((i1 - ModuloInteger(i1, 1000)) / 1000)
                set i2 = LoadInteger(DataUnitHT, hid, 542)
                if i1 != i2 then
                    call AddUnitMagicDmg(u, 0 - i2)
                    call AddUnitMagicDmg(u, i1)
                    call SaveInteger(DataUnitHT, hid, 542, i1)
                endif
            endif

            //Head Hunter
            if GetUnitTypeId(u) == 'N00I' then
                set i1 = R2I(GetHeroStr(u, true) * (0.57 + (0.03 * GetHeroLevel(u))))
                set i2 = LoadInteger(DataUnitHT, hid, 542)
                if i1 != i2 then
                    call BlzSetUnitRealField(u,ConvertUnitRealField('uhpr'),(BlzGetUnitRealField(u,ConvertUnitRealField('uhpr')) - i2) + i1)
                    call SaveInteger(DataUnitHT, hid, 542, i1)
                endif
            endif

            //Abomination
            if GetUnitTypeId(u) == 'H005' then
                if CheckProc(u, 350) then
                    call ElemFuncStart(u,'H005')
                endif

            //Yeti
            elseif GetUnitTypeId(u) == 'O00B' then
               if BlzGetUnitArmor(u) <= 50 + (2 * GetHeroLevel(u)) then
                    if GetUnitAbilityLevel(u, 'A092') == 0 then
                        call UnitAddAbility(u, 'A092')
                    endif
                   set i1 = LoadInteger(DataUnitHT,hid,542)
                   set i2 = 20*GetHeroLevel(u)-i1
                   call SetHeroStr(u,GetHeroStr(u,false)+ i2, false)
                   call SaveInteger(DataUnitHT,hid,542,20*GetHeroLevel(u))
               else
                   set i1 = LoadInteger(DataUnitHT,hid,542)
                   call SetHeroStr(u,GetHeroStr(u,false)-i1, false)
                   call SaveInteger(DataUnitHT,hid,542,0)
                   call UnitRemoveAbility(u, 'A092')
               endif
            endif
        endif
    set II = II + 1
    endloop

    set u = null
endfunction

//===========================================================================
function InitTrig_ShortPeriodCheck takes nothing returns nothing
    set gg_trg_ShortPeriodCheck = CreateTrigger(  )
    call TriggerRegisterTimerEventPeriodic( gg_trg_ShortPeriodCheck, 1 )
    call TriggerAddAction( gg_trg_ShortPeriodCheck, function Trig_ShortPeriodCheck_Actions )
endfunction

