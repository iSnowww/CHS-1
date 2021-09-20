function  FunctionAttackSpeedA takes unit u returns nothing
    local real r1 = LoadReal(HT, GetHandleId(u),-1001 )
    local real r2 = 0
    local real i1 = I2R(GetUnitAbilityLevel(u,'A02O'))
    local real i2 = UnitHasItemI(u,'I066')
	


    if i1 > 0 then
        set r2 = 0.92 -  0.02*i1

    else

       set  r2 = r1 
    endif

    set r2 = r2 + i2 * 1.4

    if GetUnitAbilityLevel(u, 'B01Q') > 0 then
        set r2 = r2 + 0.4
    endif

    if UnitHasItemS(u,'I06B') then
      set r2 = r2*0.8
    endif

    if GetUnitTypeId(u) == 'O00A' then

	set r2 =  r2*100/(I2R(100+GetHeroLevel(u))) 
    endif

  //  call DisplayTextToPlayer(GetLocalPlayer(),0,0,R2S(r2))
    call BlzSetUnitAttackCooldown(u,r2,0)



endfunction



function AABfunction takes unit u returns nothing
    //Mysterious Talent
    if GetUnitAbilityLevel(u,'A05Z') > 0 and BlzGetUnitAbilityCooldownRemaining(u,'A05Z') <= 0.001 and BlzIsUnitInvulnerable(u) == false then
        call MysteriousTalent(u)
        call AbilStartCD(u,'A05Z',45-GetUnitAbilityLevel(u,'A05Z') ) 
    endif

    //Holy Shield
    if GetUnitAbilityLevel(u,'A066') > 0 and BlzGetUnitAbilityCooldownRemaining(u,'A066') <= 0.001 and BlzIsUnitInvulnerable(u) == false and GetWidgetLife(u)/I2R(BlzGetUnitMaxHP(u)) < 0.75 then
        call UseSpellsHolyShield(u)
        call AbilStartCD(u,'A066',10 ) 
    endif

    //Runestone of Creation
    if GetUnitAbilityLevel(u,'A073') > 0 and BlzGetUnitAbilityCooldownRemaining(u,'A073') <= 0.001 and BlzIsUnitInvulnerable(u) == false and GetUnitState(u,UNIT_STATE_MANA) >= 2000 then
        call CreateRandomRune(0,GetUnitX(u),GetUnitY(u),u )
        call SetUnitState(u,UNIT_STATE_MANA,GetUnitState(u,UNIT_STATE_MANA)-2000)
        call AbilStartCD(u,'A073',20 ) 
    endif

    //Earthquake
    if GetUnitAbilityLevel(u,'A07L') > 0 and BlzGetUnitAbilityCooldownRemaining(u,'A07L') <= 0.001 and BlzIsUnitInvulnerable(u) == false and CheckProc(u, 600) then
        call USOrder4field(u,GetUnitX(u),GetUnitY(u),'A07M',"thunderclap",GetUnitAbilityLevel(u,'A07L')*100,ABILITY_RLF_DAMAGE_INCREASE,600,ABILITY_RLF_CAST_RANGE ,0.5,ABILITY_RLF_DURATION_HERO,0.5,ABILITY_RLF_DURATION_NORMAL)
        call AbilStartCD(u,'A07L',5 ) 
    endif
endfunction

function FunUpdateSkill takes integer i returns nothing
    local integer i1= 1
    local player Pl= Player(i)
    local integer SpellId= 0
    local string textureS= ""
    local integer unitId = GetUnitTypeId(udg_units01[NumPlayerLast[i] + 1])

    if unitId != 0 then
        if GetLocalPlayer() == Pl then
            set textureS = LoadStr(HT_data, unitId, 1)
            call BlzFrameSetVisible(SpellUP[100], true)
            call BlzFrameSetTexture(SpellFR[100], textureS, 0, true)
        endif
    else
        if GetLocalPlayer() == Pl then
            call BlzFrameSetVisible(SpellUP[100], false)
        endif
    endif

    if NumPlayerLast[i] == 11 then
        loop
            exitwhen i1 > 21
            set SpellId= roundAbilities[i1]
            if SpellId != 0 then
                set textureS=BlzGetAbilityIcon(SpellId)

                if GetLocalPlayer() == Pl then
                    call BlzFrameSetVisible(SpellUP[100 + i1], true)
                    call BlzFrameSetTexture(SpellFR[100 + i1], textureS, 0, true)
                endif
            else
                if GetLocalPlayer() == Pl then
                    call BlzFrameSetVisible(SpellUP[100 + i1], false)
                endif
            endif
            set i1=i1 + 1
        endloop
    else
        loop
            exitwhen i1 > 21
            set SpellId=GetInfoHeroSpell(udg_units01[NumPlayerLast[i] + 1] , i1)
            if SpellId != 0 then
                set textureS=BlzGetAbilityIcon(SpellId)

                if GetLocalPlayer() == Pl then
                call BlzFrameSetVisible(SpellUP[100 + i1], true)
                call BlzFrameSetTexture(SpellFR[100 + i1], textureS, 0, true)
                endif
            else
                if GetLocalPlayer() == Pl then
                call BlzFrameSetVisible(SpellUP[100 + i1], false)
                endif
            endif
            set i1=i1 + 1
        endloop
    endif

    set Pl = null
endfunction




function Trig_LongPeriodCheck_Actions takes nothing returns nothing
    local integer II = 0

    local real ARMORN = 0
    local real ARMORN2 = 0
    local real ARMFIN = 0
    local real ARMG = 0
    local real HpR = 0
    local real MpR = 0
    local integer MANA1 = 0
    local integer MANA2 = 0

    local real r1 = 0
    local real r2 = 0

    local integer i1 = 0
    local integer i2 = 0


    local real Agi1 = 0
    local real Agi2 = 0
    local real Str1 = 0
    local real Str2 = 0
    local real Int1 = 0
    local real Int2 = 0

    local real Smat1 = 0
    local real Smat2 = 0
    local real HpBonus = 0
    local unit u

    loop
    exitwhen   II > 8



        call FunUpdateSkill(II)
        set u = udg_units01[II]
        if GetWidgetLife(u) > 0.405 then
            call FunctionAttackSpeedA(u)
            
            //Double Armor
            if GetUnitAbilityLevel(u ,'B00F') >= 1 then
                set ARMORN = BlzGetUnitArmor(u)
                set ARMORN2 = LoadReal(HT,GetHandleId(u),11)
                set ARMFIN  = ARMORN - ARMORN2
                set ARMG  = ARMFIN  - ARMORN2 
                call SaveReal(HT,GetHandleId(u),11,ARMORN2+ARMG  )
                
                call BlzSetUnitArmor(u,ARMORN + ARMG   )
            elseif LoadReal(HT,GetHandleId(u),11) != 0 then
                call BlzSetUnitArmor(u, BlzGetUnitArmor(u) - LoadReal(HT,GetHandleId(u),11)   )
                call SaveReal(HT,GetHandleId(u),11,0)
            endif
            
            //Panda Relic
            if GetUnitAbilityLevel(u ,'B00S') >= 1 then
                set Agi1 = GetHeroAgi(u,false)
                set Agi2 = LoadReal(HT,GetHandleId(u),1001)
                set Smat1 = R2I((Agi1-Agi2)*0.35)  //?????? ????
                
                call SaveReal(HT,GetHandleId(u),1001 ,Smat1   )
                call SetHeroAgi(u,R2I(Agi1+Smat1-Agi2 ) ,false)
                
                set Str1 = GetHeroStr(u,false)
                set Str2 = LoadReal(HT,GetHandleId(u),1002)
                set Smat1 = R2I((Str1-Str2)*0.35)  //?????? ????
                
                call SaveReal(HT,GetHandleId(u),1002 ,Smat1   )
                call SetHeroStr(u,R2I(Str1+Smat1-Str2 ) ,false)
                
                set Int1 = GetHeroInt(u,false)
                set Int2 = LoadReal(HT,GetHandleId(u),1003)
                set Smat1 = R2I((Int1-Int2)*0.35)  //?????? ????
                
                call SaveReal(HT,GetHandleId(u),1003 ,Smat1   )
                call SetHeroInt(u,R2I(Int1+Smat1-Int2 ) ,false)
            elseif (LoadReal(HT,GetHandleId(u),1001) != 0) or (LoadReal(HT,GetHandleId(u),1002) != 0) or (LoadReal(HT,GetHandleId(u),1003) != 0) then
                call SetHeroAgi(u,R2I(GetHeroAgi(u,false) - (LoadReal(HT,GetHandleId(u),1001)) ) ,false)	
                call SaveReal(HT,GetHandleId(u),1001,0)
                
                call SetHeroStr(u,R2I(GetHeroStr(u,false) - (LoadReal(HT,GetHandleId(u),1002)) ) ,false)	
                call SaveReal(HT,GetHandleId(u),1002,0)
                
                call SetHeroInt(u,R2I(GetHeroInt(u,false) - (LoadReal(HT,GetHandleId(u),1003)) ) ,false)	
                call SaveReal(HT,GetHandleId(u),1003,0)		
            endif
            
            //Relic of Magic
            if GetUnitAbilityLevel(u ,'B00Q') >= 1 then	
                   set HpR =  BlzGetUnitMaxHP(u)  - GetWidgetLife(u) 
                   
                   if HpR > 0 then
                       set MpR = GetUnitState(u, UNIT_STATE_MANA)/100 
                       
                       if MpR  >  HpR then
                           call SetUnitState(u, UNIT_STATE_MANA, GetUnitState(u, UNIT_STATE_MANA) - HpR  )
                           call SetWidgetLife(u,  GetWidgetLife(u) + HpR) 
                       else
                           call SetUnitState(u, UNIT_STATE_MANA, GetUnitState(u, UNIT_STATE_MANA) - MpR  )
                           call SetWidgetLife(u,  GetWidgetLife(u) + MpR)      
                       endif
                   endif
            endif

            if GetWidgetLife(u) > 0 then
                set HpBonus = 0
                //Heart of a Hero
                if GetUnitAbilityLevel(u ,'B00N') >= 1 then
                    set HpBonus = HpBonus + 1
                endif
                
                //Absolute Light
                set i1 = GetUnitAbilityLevel(u ,'A07P')
                if i1 >= 1  then
                    set i1 = i1*GetClassUnitSpell(u,8)
                    set HpBonus = HpBonus + 0.005*I2R(i1)
                endif
                
                //Divine Gift
                set i1 = GetUnitAbilityLevel(u ,'A082')
                if i1 >= 1 then
                    set HpBonus = HpBonus + 0.05*I2R(i1)
                endif
                
                call SetUnitProcHp(u,HpBonus)
                
                
                if BlzIsUnitInvulnerable(u) == false  then

                    //Absolute Dark
                    set i1 = GetUnitAbilityLevel(u ,'A07Q')
                    if i1 >= 1  then
                        set i1 = i1*GetClassUnitSpell(u,7)
                        call AoeDrainAura(u, (0.5*I2R(i1)),500,false)
                    endif
                    
                    //Drain aura
                    set i1 = GetUnitAbilityLevel(u ,'A023')
                    if i1 >= 1  then
                        call AoeDrainAura(u, I2R(i1) * 0.0002,500,true)
                    endif
                endif
                call AABfunction(u)
                
                //Banshee
                if GetUnitTypeId(u) == 'H01I' then
                    set i1 = (BlzGetUnitMaxHP(u)*3)/4
                    set i2 = LoadInteger(HT,GetHandleId(u),'H01I')
                    
                    call BlzSetUnitMaxMana(u,BlzGetUnitMaxMana(u)+i1-i2   )
                    call SaveInteger(HT,GetHandleId(u),'H01I',i1  )
                
                endif
                
                
                //Robes of the Archmage
                if GetUnitAbilityLevel(u ,'B00L') >= 1 then

                    set ARMORN =      R2I( (BlzGetUnitMaxMana( u )  -  GetUnitState( u  , UNIT_STATE_MANA  )  )/300 )
                    set ARMORN2 = LoadReal(HT,GetHandleId(u),291)

                    set ARMFIN  = BlzGetUnitArmor(u)

                    set ARMG  = ARMORN  + ARMFIN  - ARMORN2

                    call SaveReal(HT,GetHandleId(u),291,ARMORN  )
                    call BlzSetUnitArmor(u,ARMG  )

                elseif LoadReal(HT,GetHandleId(u),291) != 0 then
                    call BlzSetUnitArmor(u, BlzGetUnitArmor(u) - LoadReal(HT,GetHandleId(u),291)   )
                    call SaveReal(HT,GetHandleId(u),291,0)
                endif
            endif
                
            //Absolute Fire
            set i1 = GetUnitAbilityLevel(u ,'A07B')
            set i2 = LoadInteger(HT,GetHandleId(u),'A07B')
            if i1 >= 1 or i2 != 0 then
                set i1 = i1*GetClassUnitSpell(u,1)
                call AddUnitMagicDmg(u ,   0.5*I2R(i1-i2)  )	
                call SaveInteger(HT,GetHandleId(u),'A07B',i1)	
            endif

            //Absolute Water
            set i1 = GetUnitAbilityLevel(u ,'A07C')
            set i2 = LoadInteger(HT,GetHandleId(u),'A07C')
            if i1 >= 1 or i2 != 0 then
                set i1 = i1*GetClassUnitSpell(u,2)
                call BlzSetUnitMaxMana(u,BlzGetUnitMaxMana(u) + 100*(i1-i2)    )
                call SaveInteger(HT,GetHandleId(u),'A07C',i1)	
            endif
            
            //Absolute Wind
            set i1 = GetUnitAbilityLevel(u ,'A07E')
            set i2 = LoadInteger(HT,GetHandleId(u),'A07E')
            if i1 >= 1 or i2 != 0 then
                set i1 = i1*GetClassUnitSpell(u,3)
                call AddUnitEvasion(u ,   0.5*I2R(i1-i2)  )
                call SetHeroAgi(u,GetHeroAgi(u,false)+10*(i1-i2),false     )
                call SaveInteger(HT,GetHandleId(u),'A07E',i1)	
            endif
            
            //Absolute Earth
            set i1 = GetUnitAbilityLevel(u ,'A07D')
            set i2 = LoadInteger(HT,GetHandleId(u),'A07D')
            if i1 >= 1 or i2 != 0 then
                set i1 = i1*GetClassUnitSpell(u,4)
                call AddUnitBlock(u ,   20*I2R(i1-i2)  )	
                call SaveInteger(HT,GetHandleId(u),'A07D',i1)	
            endif

            //Absolute Blood
            set i1 = GetUnitAbilityLevel(u ,'A07R')
            set i2 = LoadInteger(HT,GetHandleId(u),'A07R')
            if i1 >= 1 or i2 != 0 then
                set i1 = i1*GetClassUnitSpell(u,11)
                call SetHeroStr(u,GetHeroStr(u,false)+12*(i1-i2),false     )
                call SaveInteger(HT,GetHandleId(u),'A07R',i1)	
            endif

            //Brilliance Aura
            set i1 = GetUnitAbilityLevel(u, 'AHab')
            if i1 > 0 then
                call SetUnitState(u, UNIT_STATE_MANA, GetUnitState(u, UNIT_STATE_MANA) + ((0.0001 * i1) * GetUnitState(u, UNIT_STATE_MAX_MANA)))
            endif

            //Absolute Wild
            set i1 = GetUnitAbilityLevel(u ,'A07K')
            set i2 = LoadInteger(HT,GetHandleId(u),'A07K')
            if i1 >= 1 or i2 != 0 then
                set i1 = i1*GetClassUnitSpell(u,5)
                call AddUnitSummonStronger(u ,   1*I2R(i1-i2)  )	
                call SaveInteger(HT,GetHandleId(u),'A07K',i1)	
            endif

            //Thunder Witch
            if GetUnitTypeId(u) == 'O001' then
                if BlzGetUnitAbilityCooldownRemaining(u, 'A08P') == 0 and CheckProc(u, 610) then
                    call ElemFuncStart(u,'O001')
                    call USOrderA(u,GetUnitX(u),GetUnitY(u),'A036',"fanofknives",  30+GetHeroLevel(u)*30 , ConvertAbilityRealLevelField('Ocl1') )
                    call AbilStartCD(u, 'A08P', 1)
                endif
            endif

            //Mana Bonus
            if GetUnitAbilityLevel(u ,'A02X') >= 1 then
                set MANA1  = LoadInteger(HT,GetHandleId(u),12)
                set MANA2  =  10000*GetUnitAbilityLevel(u ,'A02X')
                if MANA1 != MANA2 then
                    call BlzSetUnitMaxMana(u, BlzGetUnitMaxMana(u) + MANA2-MANA1 )
                    call SaveInteger(HT,GetHandleId(u),12,MANA2  )
                endif
            elseif LoadInteger(HT,GetHandleId(u),12) != 0 then
                call BlzSetUnitMaxMana(u, BlzGetUnitMaxMana(u) -LoadInteger(HT,GetHandleId(u),12)  )
                call SaveInteger(HT,GetHandleId(u),12,0 )	
            endif
        endif
        set II = II + 1
    endloop

    set u = null
endfunction

//===========================================================================
function InitTrig_LongPeriodCheck takes nothing returns nothing
    set gg_trg_LongPeriodCheck = CreateTrigger(  )
    call TriggerRegisterTimerEventPeriodic( gg_trg_LongPeriodCheck, 0.1 )
    call TriggerAddAction( gg_trg_LongPeriodCheck, function Trig_LongPeriodCheck_Actions )
endfunction

