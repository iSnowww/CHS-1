library StartFunction requires TimerUtils, DummyOrder RandomShit, RuneInit, BoneArmor
    globals
        hashtable HT_timerSpell = InitHashtable()
        integer array RoundTimer
    endglobals

    /*function USOrder4fieldTimer takes nothing returns nothing
    local timer t = GetExpiredTimer()
    local integer i = GetHandleId(t)
    local unit u1 = LoadUnitHandle(HT,i,1)
    local real x = LoadReal(HT,i,3)
    local real y = LoadReal(HT,i,4)
    local integer idsp = LoadInteger(HT,i,5)
    local string ordstr = LoadStr(HT,i,6)
    local real Field1 = LoadReal(HT,i,7)
    local abilityreallevelfield RealField1 = ConvertAbilityRealLevelField(LoadInteger(HT,i,8))
    local real Field2 = LoadReal(HT,i,9)
    local abilityreallevelfield RealField2 = ConvertAbilityRealLevelField(LoadInteger(HT,i,10))
    local real Field3 = LoadReal(HT,i,11)
    local abilityreallevelfield RealField3 = ConvertAbilityRealLevelField(LoadInteger(HT,i,12))
    local real Field4 = LoadReal(HT,i,13)
    local abilityreallevelfield RealField4 = ConvertAbilityRealLevelField(LoadInteger(HT,i,14))
    local unit CasteabilLevel = CreateUnit(GetOwningPlayer(u1),'h015',x,y, 0  )
        
    call FlushChildHashtable(HT,i)
    call ReleaseTimer(t)
    call UnitAddAbility(CasteabilLevel,idsp ) 


    call BlzSetAbilityRealLevelField( BlzGetUnitAbility(CasteabilLevel,idsp),RealField1,0,Field1)
    call BlzSetAbilityRealLevelField( BlzGetUnitAbility(CasteabilLevel,idsp),RealField2,0,Field2)
    call BlzSetAbilityRealLevelField( BlzGetUnitAbility(CasteabilLevel,idsp),RealField3,0,Field3)
    call BlzSetAbilityRealLevelField( BlzGetUnitAbility(CasteabilLevel,idsp),RealField4,0,Field4)

    call IssueImmediateOrder( CasteabilLevel, ordstr )
    call UnitApplyTimedLife(CasteabilLevel,'B000',2)


    set CasteabilLevel = null
    set t = null
    set u1 = null
endfunction */

function FunctionTimerSpell takes nothing returns nothing
    local timer startbattle = GetExpiredTimer()
    local timer nTimer = null
    local timer oTimer = null
    local unit Herou = LoadUnitHandle(HT_timerSpell,GetHandleId(startbattle),1)
    local integer startType = LoadInteger(HT_timerSpell, GetHandleId(startbattle), 4)
    local integer pid = GetPlayerId(GetOwningPlayer(Herou))
    local real abilLevel = 0
    local real heroLevel = 0
    local real ChronusLevel = 1 + (0.05 * I2R(GetUnitAbilityLevel(Herou,'A03Y')))
    local real r4 = 0
    local real r5 = 0
    local integer i = 0
    local integer i1 = 0
    local unit U = null
        
    if Herou != null and (IsPlayerInForce(GetOwningPlayer(Herou), udg_force07) or GetPlayerSlotState(GetOwningPlayer(Herou)) != PLAYER_SLOT_STATE_PLAYING) then
        call SetUnitInvulnerable(Herou, false)
        call KillUnit(Herou)
        return
    endif
    set heroLevel = GetHeroLevel(Herou)

    call ResetTimeManipulation(Herou, startType)
        
    //Hero Buff
    set abilLevel = GetUnitAbilityLevel(Herou,'A03Q')
    if abilLevel > 0 then
        call HeroBuffStruct.create(Herou, R2I(abilLevel), R2I(heroLevel), ChronusLevel, (7 +(heroLevel * 0.09)) * ChronusLevel)
    endif
    
    //Temporary Inisibility
    set abilLevel = GetUnitAbilityLevel(Herou,'A03U')    
    if abilLevel > 0 then
        call TempInvisStruct.create(Herou, (1.8 + (0.2 * abilLevel)) * ChronusLevel)
    endif
        
    //Temporary Power
    set abilLevel = GetUnitAbilityLevel(Herou,'A04E')    
    if abilLevel > 0 then
        call TempPowerStruct.create(Herou, (8 + (0.02 * heroLevel)) * ChronusLevel)
    endif
        
    //Holy Enlightenment
    set abilLevel = GetUnitAbilityLevel(Herou,'A04K')    
    if abilLevel > 0 and startType != 6 then
        call ElemFuncStart(Herou,'A04K')
        set r4 = 50 *(heroLevel + 3)*(heroLevel + 4)- 110  
        set r5 = GetHeroXP(Herou)

        if GetUnitAbilityLevel(Herou,'Asal') > 0 then   
            call AddHeroXP(Herou,   R2I((r4 - r5)*(abilLevel * 1.5))/ 200  , true) 
        else
            call AddHeroXP(Herou,   R2I((r4 - r5)*(abilLevel * 1.5))/ 100  , true) 
        endif
    endif
    
    //Cheater Magic
    set abilLevel = GetUnitAbilityLevel(Herou,'A040')    
    if abilLevel > 0 then
        call CheaterMagicStruct.create(Herou, (2.75 + (0.25 * abilLevel))* ChronusLevel)
    endif
        
    //Blessed Protection
    set abilLevel = GetUnitAbilityLevel(Herou,'A045')    
    if abilLevel > 0 then
        call BlessedProtectionStruct.create(Herou, (2.70 + (0.3 * abilLevel))* ChronusLevel)
    endif
        
    //Ancient Runes
    set abilLevel = GetUnitAbilityLevel(Herou,'A09O')    
    if abilLevel > 0 then
        call ElemFuncStart(Herou,'A09O')
        call CreateRandomRune(- 60 + 10 * abilLevel,GetRandomReal(- 100,100)+ GetUnitX(Herou) ,GetRandomReal(- 100,100)+ GetUnitY(Herou)   ,Herou)
        call CreateRandomRune(- 60 + 10 * abilLevel,GetRandomReal(- 100,100)+ GetUnitX(Herou) ,GetRandomReal(- 100,100)+ GetUnitY(Herou)   ,Herou)
        call CreateRandomRune(- 60 + 10 * abilLevel,GetRandomReal(- 100,100)+ GetUnitX(Herou) ,GetRandomReal(- 100,100)+ GetUnitY(Herou)   ,Herou)   
    endif
        
    //Shining Runestone
    set i1 = UnitHasItemI( Herou,'I08L' )
    set i = 0
    call ElemFuncStart(Herou,'I08L')
    if i1 > 0 then
        loop 
            exitwhen i >= R2I(i1)
            call CreateRandomRune(0,GetRandomReal(- 100,100)+ GetUnitX(Herou) ,GetRandomReal(- 100,100)+ GetUnitY(Herou)   ,Herou)
            set i = i + 1
        endloop
    endif
        
    //Grunt
    if GetUnitTypeId(Herou) == 'H01J' then
        call GruntsGruntStruct.create(Herou, ChronusLevel)
    endif
        
    //Bone Armor
    if UnitHasItemS(Herou,'I07O') then
        call ElemFuncStart(Herou,'I07O')
        set U = CreateUnit(GetOwningPlayer(Herou),'u003',GetUnitX(Herou),GetUnitY(Herou),0)
        call UnitApplyTimedLife(U,'A041',40 * ChronusLevel)
        set U = CreateUnit(GetOwningPlayer(Herou),'u003',GetUnitX(Herou),GetUnitY(Herou),0)
        call UnitApplyTimedLife(U,'A041',40 * ChronusLevel)
        set U = CreateUnit(GetOwningPlayer(Herou),'u003',GetUnitX(Herou),GetUnitY(Herou),0)
        call UnitApplyTimedLife(U,'A041',40 * ChronusLevel)
        set U = CreateUnit(GetOwningPlayer(Herou),'u003',GetUnitX(Herou),GetUnitY(Herou),0)
        call UnitApplyTimedLife(U,'A041',40 * ChronusLevel)
        call StartBoneArmor(Herou)
    endif
        
    //Fearless Defenders
    set abilLevel = GetUnitAbilityLevel(Herou,'A041')   
    if abilLevel > 0 then
        call ElemFuncStart(Herou,'A041')
        set U = CreateUnit( GetOwningPlayer(Herou),'h01A',GetUnitX(Herou)+ 40 * CosBJ(- 30 + GetUnitFacing(Herou)),GetUnitY(Herou)+ 40 * SinBJ(- 30 + GetUnitFacing(Herou)),GetUnitFacing(Herou) )
        call BlzSetUnitMaxHP(U, BlzGetUnitMaxHP(U)- 500 + R2I((abilLevel * 10000)*(1 +(heroLevel * 0.038) )) )
        call BlzSetUnitBaseDamage(U, BlzGetUnitBaseDamage(U,0) - 10 + R2I((abilLevel * 100)*(1 +(heroLevel * 0.038)) ),0)
        call SetWidgetLife(U,BlzGetUnitMaxHP(U) )
        call UnitApplyTimedLife(U,'A041',(8 + (heroLevel * 0.09)) * ChronusLevel)
        call DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Human\\Resurrect\\ResurrectTarget.mdl",U,"head"))

        set U = CreateUnit( GetOwningPlayer(Herou),'h01A',GetUnitX(Herou)+ 40 * CosBJ(30 + GetUnitFacing(Herou)),GetUnitY(Herou)+ 40 * SinBJ(30 + GetUnitFacing(Herou)),GetUnitFacing(Herou) )
        call BlzSetUnitMaxHP(U, BlzGetUnitMaxHP(U)- 500 + R2I((abilLevel * 10000)*(1 +(heroLevel * 0.038) )) )
        call BlzSetUnitBaseDamage(U, BlzGetUnitBaseDamage(U,0) - 10 + R2I((abilLevel * 100)*(1 +(heroLevel * 0.038)) ),0)
        call SetWidgetLife(U,BlzGetUnitMaxHP(U) )
        call UnitApplyTimedLife(U,'A041',(8 + (heroLevel * 0.09)) * ChronusLevel)
        call DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Human\\Resurrect\\ResurrectTarget.mdl",U,"head"))       

        call TimeManipulation(Herou, (8 + (heroLevel * 0.09)) * ChronusLevel)
    endif

    //Faerie Dragon
    if GetUnitTypeId(Herou) == 'O008' then
        set r4 = GetUnitX(Herou)+ 40 * CosBJ(- 30 + GetUnitFacing(Herou))
        set r5 = GetUnitY(Herou)+ 40 * SinBJ(- 30 + GetUnitFacing(Herou))
        call DestroyEffect(AddSpecialEffect(FX_BLINK, r4, r5))
        set U = CreateUnit(GetOwningPlayer(Herou), 'e001', r4, r5, GetUnitFacing(Herou))

        call BlzSetUnitAttackCooldown(U, BlzGetUnitAttackCooldown(Herou, 0), 0)
        call SetUnitAbilityLevelSwapped('A000',U,R2I(GetHeroLevel(Herou)/ 3))
        call UnitSetAttackSpeed(U, GetHeroLevel(Herou) * 0.03)
    endif

    //Magic Blade
    set i1 = UnitHasItemI( Herou,'I06I' )
    if i1 > 0 then
        call ElemFuncStart(Herou,'I06I')
        call SetUnitState(Herou, UNIT_STATE_MANA, GetUnitState(Herou, UNIT_STATE_MANA)- 35000 * i1  )
    endif
        
    //Armor of Ancestors
    set i1 = UnitHasItemI( Herou,'I07G' )
    if i1 > 0 then
        call ElemFuncStart(Herou,'I07G')
        call BlzSetUnitArmor(Herou,BlzGetUnitArmor(Herou)+ i1 * 20 * NumberOfUnit[pid] )
        call AddUnitBlock(Herou,i1 * 20 * NumberOfUnit[pid])
        call SaveInteger(HT,GetHandleId(Herou),54001,LoadInteger(HT,GetHandleId(Herou),54001)+ i1 * 20 * NumberOfUnit[pid] ) 
    endif
        
    //Book of Necromancy
    set i1 = UnitHasItemI( Herou,'I06J' )
    if i1 > 0 then
        call ElemFuncStart(Herou,'I06J')
        call SetPlayerTechResearchedSwap( 'R000', ( i1 + GetPlayerTechCountSimple('R000', GetOwningPlayer(Herou)) ), GetOwningPlayer(Herou) )
        call SetPlayerTechResearchedSwap( 'R001', ( i1 + GetPlayerTechCountSimple('R001', GetOwningPlayer(Herou)) ), GetOwningPlayer(Herou) )    
        call SetPlayerTechResearchedSwap( 'R002', ( i1 + GetPlayerTechCountSimple('R002', GetOwningPlayer(Herou)) ), GetOwningPlayer(Herou) )
                
    endif 

    //Gnome
    if GetUnitTypeId(Herou) == 'H019' then
        call ElemFuncStart(Herou,'H019')
        call USOrder4field(Herou,GetUnitX(Herou),GetUnitY(Herou),'A03Z',"stomp",55 * heroLevel,ABILITY_RLF_DAMAGE_INCREASE,1800,ABILITY_RLF_SPECIFIC_TARGET_DAMAGE_HTC2 ,1 +(heroLevel * 0.04),ABILITY_RLF_DURATION_HERO,2 +(heroLevel * 0.08),ABILITY_RLF_DURATION_NORMAL)
        call TimeManipulation(Herou, 2 +(heroLevel * 0.08))
    endif
            
    //Rapid Recovery
    set abilLevel = GetUnitAbilityLevel(Herou,'A03X')    
    if abilLevel > 0 then
        call ElemFuncStart(Herou,'A03X')
        call USOrder4field(Herou,GetUnitX(Herou),GetUnitY(Herou),'A03W',"battleroar", (BlzGetUnitMaxHP(Herou) * 0.002 * abilLevel)*(1 + 0.02 * heroLevel),ABILITY_RLF_LIFE_REGENERATION_RATE, (GetUnitState(Herou, UNIT_STATE_MAX_MANA) * 0.002 * abilLevel)*(1 + 0.02 * heroLevel),ABILITY_RLF_MANA_REGEN ,(8 +(heroLevel * 0.2))* ChronusLevel,ABILITY_RLF_DURATION_HERO,(8 +(heroLevel * 0.2))* ChronusLevel,ABILITY_RLF_DURATION_NORMAL)
        call TimeManipulation(Herou, (8 +(heroLevel * 0.2))* ChronusLevel)
    endif
        
    //Demon Curse
    set abilLevel = GetUnitAbilityLevel(Herou,'A042')    
    if abilLevel > 0 then
        call ElemFuncStart(Herou,'A042')
        call USOrder4field(Herou,GetUnitX(Herou),GetUnitY(Herou),'A043',"howlofterror",0,ABILITY_RLF_DAMAGE_INCREASE_PERCENT_ROA1,(10 * abilLevel)*(1 + 0.02 * heroLevel),ABILITY_RLF_DAMAGE_HBZ2 ,(8 +(heroLevel * 0.09))* ChronusLevel,ABILITY_RLF_DURATION_HERO,(8 +(heroLevel * 0.09))* ChronusLevel,ABILITY_RLF_DURATION_NORMAL)
        call TimeManipulation(Herou, (8 +(heroLevel * 0.09))* ChronusLevel)
    endif

    //Time Manipulation
    if GetUnitAbilityLevel(Herou, 'A0AS') > 0 then
        call TimeManipulationStart(Herou)
    endif
    
    call FlushChildHashtable(HT_timerSpell,GetHandleId(startbattle )) 
    call ReleaseTimer(startbattle)
    set U = null
    set Herou = null
    set startbattle = null
    set nTimer = null
endfunction

function FixAbilityU takes unit u returns nothing
    local integer i1 = 0

    set i1 = LoadInteger(HT,GetHandleId(u),54021)
        
    if i1 != 0 then 
        call SetHeroStr(u,GetHeroStr(u,false)- i1,false)
        call SetHeroAgi(u,GetHeroAgi(u,false)- i1,false)
        call SetHeroInt(u,GetHeroInt(u,false)- i1,false)
        call SaveInteger(HT,GetHandleId(u),54021,0)
    endif
endfunction

function StartFunctionSpell takes unit Hero, integer i1 returns nothing
    local timer startbattle = NewTimer()
        
    if i1 != 6 then
        call FixAbilityU (Hero)
    endif    
    
    call SaveInteger(HT_timerSpell,GetHandleId(startbattle),4, i1)
    call SaveUnitHandle(HT_timerSpell,GetHandleId(startbattle),1,Hero)     
    if i1 == 2 then
        call TimerStart(startbattle,4.25,false,function FunctionTimerSpell )
        
    else
        set RoundTimer[GetPlayerId(GetOwningPlayer(Hero))] = T32_Tick + R2I(0.05 * 32)
        call TimerStart(startbattle,0.05,false,function FunctionTimerSpell )   
    endif
    set startbattle = null
    //	call DisplayTextToPlayer(GetLocalPlayer(),0,0,"yea"+I2S(i1) )
endfunction
endlibrary
