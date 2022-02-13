library trigger103 initializer init requires RandomShit, Functions

    globals
        integer ReflectionAuraChance = 0
        integer WizardbaneAuraChance = 0
        integer DrunkenMasterchance = 0
        integer SlowAuraChance = 0
        integer PulverizeChance = 0 
        integer LastBreathChance = 0
        integer FireshieldChance = 0
        integer CorrosiveSkinChance = 0 
        integer MulticastChance = 0
        integer FastMagicChance = 0
        integer ImmortalityAuraChance = 0
    endglobals

    function Trig_Generate_Next_Level_Conditions takes nothing returns boolean
        if(not(IsTriggerEnabled(GetTriggeringTrigger())==true))then
            return false
        endif
        return true
    endfunction


    function ResetRoundAbilities takes nothing returns nothing
        local integer index = roundAbilities.integer[0]
        loop
            set roundAbilities.integer[index] = 0
            set index = index - 1
            exitwhen index <= 0
        endloop
        set roundAbilities.integer[0] = 0
    endfunction


    function Trig_Generate_Next_Level_Func012C takes nothing returns boolean
        if(not((udg_integer02 + 1)> 1))then
            return false
        endif
        return true
    endfunction


    function Trig_Generate_Next_Level_Func014C takes nothing returns boolean
        if(not((udg_integer02 + 1)<= 8))then
            return false
        endif
        return true
    endfunction


    function AddRoundAbility takes integer abilityId returns nothing
        local integer index = roundAbilities.integer[0] + 1
        set roundAbilities[index] = abilityId
        set roundAbilities.integer[0] = index
    endfunction


    function CheckUnitAbilities takes nothing returns nothing
        local string s = ""
    
        if udg_integer10 == 1 then
            set s = s + "Bash "
            call AddRoundAbility('ACbh')
        endif
    
        if udg_integer24 == 1 then
            set s = s + "Hurl Boulder "
            call AddRoundAbility('A00W')
        endif
    
        if udg_integer25 == 1 then
            set s = s + "Rejuvenation "
            call AddRoundAbility('A00X')
        endif
    
        if udg_integer50 == 1 then
            set s = s + "Big Bad Voodoo "
            call AddRoundAbility('A018')
        endif
    
        if udg_integer54 == 1 then
            set s = s + "Blink "
            call AddRoundAbility('A01A')
        endif
    
        if udg_integer11 == 1 then
            set s = s + "Critical Strike "
            call AddRoundAbility('AOcr')
        endif
    
        if udg_integer12 == 1 then
            set s = s + "Evasion "
        endif
    
        if udg_integer51 == 1 then
            set s = s + "Faerie Fire "
            call AddRoundAbility('A016')
        endif
    
        if udg_integer18 == 1 then
            set s = s + "Lifesteal "
            call AddRoundAbility('SCva')
        endif
    
        if udg_integer23 == 1 then
            set s = s + "Mana Burn "
            call AddRoundAbility('A00V')
        endif
    
        if udg_integer21 == 1 then
            set s = s + "Shockwave "
            call AddRoundAbility('A00U')
        endif
    
        if udg_integer49 == 1 then
            set s = s + "Slow "
            call AddRoundAbility('A013')
        endif
    
        if udg_integer17 == 1 then
            set s = s + "Cleave "
            call AddRoundAbility('ACce')
        endif
    
        if udg_integer20 == 1 then
            set s = s + "Thorns Aura "
            call AddRoundAbility('A08F')
        endif
    
        if udg_integer55 == 1 then
            set s = s + "Thunder Clap "
            call AddRoundAbility('A01B')
        endif
    
        if ReflectionAuraChance == 1 then
            set s = s + "Reflection Aura "
            call AddRoundAbility('A093')
        endif
    
        if WizardbaneAuraChance == 1 then
            set s = s + "Wizardbane Aura  "
            call AddRoundAbility('A088')
        endif
    
        if DrunkenMasterchance == 1 then
            set s = s + "Drunken Master "
            call AddRoundAbility('Acdb')
        endif
    
        if SlowAuraChance == 1 then
            set s = s + "Slow Aura "
            call AddRoundAbility('AOr2')
        endif
    
        if PulverizeChance == 1 then
            set s = s + "Pulverize "
            call AddRoundAbility('Awar')
        endif
    
        if LastBreathChance == 1 then
            set s = s + "Last Breath "
            call AddRoundAbility('A05R')
        endif
    
        if CorrosiveSkinChance == 1 then
            set s = s + "Corrosive Skin "
            call AddRoundAbility('A00Q')
        endif
    
        if MulticastChance == 1 then
            set s = s + "Multicast "
            call AddRoundAbility('A04F')
        endif
    
        if FastMagicChance == 1 then
            set s = s + "Fast Magic "
            call AddRoundAbility('A03P')
        endif

        if ImmortalityAuraChance == 1 then
            set s = s + "Aura of Immortality"
            call AddRoundAbility('A02L')
        endif
    
        if s == "" then
            set RoundAbilities = "|cff77fc94No abilities|r "
        else
            set RoundAbilities = "|cff77fc94" + s + "|r"
        endif
    endfunction


    function Trig_Generate_Next_Level_Func018A takes nothing returns nothing
        call DeleteUnit(GetEnumUnit())
    endfunction


    function Trig_Generate_Next_Level_Func021Func001Func001C takes nothing returns boolean
        if(not(GetPlayerSlotState(ConvertedPlayer(udg_integer40))!=PLAYER_SLOT_STATE_EMPTY))then
            return false
        endif
        if(not(IsPlayerInForce(ConvertedPlayer(udg_integer40),udg_force02)!=true))then
            return false
        endif
        return true
    endfunction


    function UnitAddNewAbilities takes unit u returns nothing
        if udg_integer11 == 1 then
            call SetUnitAbilityLevel(u, 'AOcr', IMinBJ(R2I(udg_integer02 * 0.2), 30))
        endif
    
        if DrunkenMasterchance == 1 then
            call UnitAddAbility(u, 'Acdb')
            call FuncEditParam('Acdb',u)
            call SetUnitAbilityLevel(u, 'Acdb', IMinBJ(R2I(udg_integer02 * 0.3), 30))
        endif
    
        if ReflectionAuraChance == 1 then
            call UnitAddAbility(u, 'A093')
            call SetUnitAbilityLevel(u, 'A093', IMinBJ(R2I(udg_integer02 * 0.4), 30))
        endif
    
        if WizardbaneAuraChance == 1 then
            call UnitAddAbility(u, 'A088')
            call SetUnitAbilityLevel(u, 'A088', IMinBJ(R2I(udg_integer02 * 0.4), 30))
        endif
    
        if SlowAuraChance == 1 then
            call UnitAddAbility(u, 'AOr2')
            call SetUnitAbilityLevel(u, 'AOr2', IMinBJ(R2I(udg_integer02 * 0.75), 30))
        endif
    
        if PulverizeChance == 1 then
            call UnitAddAbility(u, 'Awar')
            call SetUnitAbilityLevel(u, 'Awar', IMinBJ(R2I(udg_integer02 * 0.4), 30))
        endif
    
        if LastBreathChance == 1 then
            call UnitAddAbility(u, 'A05R')
            call FuncEditParam('A05R', u)
            call SetUnitAbilityLevel(u, 'A05R', IMinBJ(R2I(udg_integer02 * 0.2), 30))
        endif
    
        if CorrosiveSkinChance == 1 then
            call UnitAddAbility(u, 'A00Q')
            call SetUnitAbilityLevel(u, 'A00Q', IMinBJ(R2I(udg_integer02 * 0.6), 30))
        endif
    
        if MulticastChance == 1 then
            call UnitAddAbility(u, 'A04F')
            call SetUnitAbilityLevel(u, 'A04F', IMinBJ(R2I(udg_integer02 * 0.5), 30))
        endif
    
        if FastMagicChance == 1 then
            call UnitAddAbility(u, 'A03P')
            call SetUnitAbilityLevel(u, 'A03P', IMinBJ(R2I(udg_integer02 * 0.6), 30))
        endif

        if ImmortalityAuraChance == 1 then
            call UnitAddAbility(u, 'A02L')
            call SetUnitAbilityLevel(u, 'A02L', IMinBJ(R2I(udg_integer02 * 0.6), 30))
        endif
    endfunction


    function Trig_Generate_Next_Level_Actions takes nothing returns nothing
        local integer newAbilChance = 50
        local integer oldAbilChance = 20
        local real magicPowerBonus = 0
        local real magicDefBonus = 0
        local real evasionBonus = 0
        local real blockBonus = 0
        local integer damageBonus = 0
        local string s = ""
        local integer temp = 0
        set RoundCreepInfo[0] = ""
        set RoundCreepInfo[1] = ""
        set RoundCreepInfo[2] = ""
        set RoundCreepInfo[3] = ""
        set RoundCreepInfo[4] = ""
        set RoundCreepInfo[5] = ""
        set RoundCreepInfo[6] = ""
        set RoundCreepInfo[7] = ""
        call DisableTrigger(GetTriggeringTrigger())
        call ConditionalTriggerExecute(udg_trigger104)
        call ResetRoundAbilities()
        if udg_integer02 < 15 then
            set udg_integer04 = udg_integers02[GetRandomInt(1,udg_integer22 - 2)]
        else
            set udg_integer04 = udg_integers02[GetRandomInt(1,udg_integer22)]
        endif
        set udg_integer09 = GetRandomInt(GetRandomInt(150, 150 + udg_integer02 * 2),400)
        set udg_integer05 = GetRandomInt(1,udg_integer02)
        
        if udg_integer02 > 25 then
            set newAbilChance = 20
        endif
        if udg_integer02 > 40 then
            set oldAbilChance = 15
        endif
        if udg_integer02 > 5 then
            set udg_integer10 = GetRandomInt(1,20)
            set udg_integer24 = GetRandomInt(1,20)
            set udg_integer25 = GetRandomInt(1,20)
            set udg_integer49 = GetRandomInt(1, oldAbilChance)
            set SlowAuraChance = GetRandomInt(1, newAbilChance)
            set ImmortalityAuraChance = GetRandomInt(1, newAbilChance)
        endif
        if(Trig_Generate_Next_Level_Func012C())then
            set udg_integer50 = GetRandomInt(1,oldAbilChance)
            set udg_integer54 = GetRandomInt(1,oldAbilChance)
            if udg_integer04 != 'n01H' and udg_integer04 != 'n00W' then
                set udg_integer11 = GetRandomInt(1,oldAbilChance)
                set udg_integer21 = GetRandomInt(1,oldAbilChance)
                if udg_integer02 > 5 then
                    set udg_integer55 = GetRandomInt(1,oldAbilChance)    
                endif
            else
                set udg_integer11 = 0
                set udg_integer21 = 0
                set udg_integer55 = 0
            endif
            set udg_integer12 = GetRandomInt(1,oldAbilChance)
            set udg_integer51 = GetRandomInt(1,oldAbilChance)
            set udg_integer18 = GetRandomInt(1,oldAbilChance)
            set udg_integer23 = GetRandomInt(1,oldAbilChance)
            
            
            set udg_integer17 = GetRandomInt(1,oldAbilChance)
            set udg_integer20 = 0
            set ReflectionAuraChance = 0
            set WizardbaneAuraChance = 0
            if GetRandomInt(1, oldAbilChance) == 1 then
                set temp = GetRandomInt(1,4)
                if temp == 1 then
                    set udg_integer20 = 1
                elseif temp == 2 then
                    set ReflectionAuraChance = 1
                elseif temp == 3 then
                    set WizardbaneAuraChance = 1
                elseif udg_integer02 > 20 then
                    if udg_integer02 > 40 then
                        set udg_integer20 = GetRandomInt(1,2)
                        set ReflectionAuraChance = GetRandomInt(1,2)
                        set WizardbaneAuraChance = GetRandomInt(1,2)
                    else
                        set udg_integer20 = GetRandomInt(1,3)
                        set ReflectionAuraChance = GetRandomInt(1,3)
                        set WizardbaneAuraChance = GetRandomInt(1,3)
                    endif
                endif
            endif
            
            
        endif
        if udg_integer02 > 10 then
            if udg_integer04 != 'n01H' and udg_integer04 != 'n00W' then
                set DrunkenMasterchance = GetRandomInt(1,oldAbilChance)
                set PulverizeChance = GetRandomInt(1,newAbilChance)
            endif
            set FireshieldChance = GetRandomInt(1,newAbilChance)
            set CorrosiveSkinChance = GetRandomInt(1,newAbilChance)
        endif
        if udg_integer02 >= 35 then
            set MulticastChance = GetRandomInt(1,newAbilChance + 10)
            set FastMagicChance = GetRandomInt(1,newAbilChance + 6)
        endif
    
        if udg_integer02 == 28 or udg_integer02 == 38 or udg_integer02 == 48 then
            set LastBreathChance = 1
        else  
            set LastBreathChance = 2
        endif
    
        if(Trig_Generate_Next_Level_Func014C())then
            set udg_integer03 = GetRandomInt(2,(udg_integer02 / 2 + 4))
        else
            set udg_integer03 = GetRandomInt(2,25)
        endif
    
        if udg_integer02 > 0 then
            call CheckUnitAbilities()
        endif

        set udg_integer02 =(udg_integer02 + 1)
        call ForGroupBJ(udg_group05,function Trig_Generate_Next_Level_Func018A)
        call GroupClear(udg_group05)
        set udg_integer28 = 1
        loop
            exitwhen udg_integer28 > udg_integer03
            set udg_integer40 = 1
            if udg_integer28 > 4 then
                set udg_integer50 = 2
            endif
            loop
                exitwhen udg_integer40 > 8
                if udg_integer02 > 1 then
                    set ShowCreepAbilButton[udg_integer40 - 1] = true
                endif
                
                //Creep upgrade bonuses
                if udg_integer04 != 'n01H' and udg_integer04 != 'n00W' then
                    set magicPowerBonus = 1 *(BonusNeutral + BonusNeutralPlayer[udg_integer40 - 1])
                    set damageBonus = ((BonusNeutral + BonusNeutralPlayer[udg_integer40 - 1] )* udg_integer02)
                else
                    set magicPowerBonus = 0
                endif
                set magicDefBonus = 0.09 *(BonusNeutral + BonusNeutralPlayer[udg_integer40 - 1] )
                set evasionBonus = 0.06 *(BonusNeutral + BonusNeutralPlayer[udg_integer40 - 1] )
                set blockBonus = 0.12 *(BonusNeutral + BonusNeutralPlayer[udg_integer40 - 1] )
                if udg_integer02 < 40 then
                    set damageBonus = damageBonus / 2
                endif
    
                if(Trig_Generate_Next_Level_Func021Func001Func001C())then
                    call CreateNUnitsAtLoc(1,udg_integer04,Player(11),OffsetLocation(GetRectCenter(udg_rects01[udg_integer40]),GetRandomReal(- 600.00,600.00),GetRandomReal(- 600.00,600.00)),GetRandomDirectionDeg())
                    call GroupAddUnitSimple(GetLastCreatedUnit(),udg_group05)
                    //call UnitAddAbility(GetLastCreatedUnit(),'A057')
                    //call BlzUnitDisableAbility(GetLastCreatedUnit(),'A057',false,true)
    
                    call BlzSetUnitBaseDamage(GetLastCreatedUnit(),BlzGetUnitBaseDamage(GetLastCreatedUnit(),0) + damageBonus,0)
    
                    call SetUnitMagicDmg(GetLastCreatedUnit(), magicPowerBonus)
                    call SetUnitMagicDef(GetLastCreatedUnit(), magicDefBonus + (0.25 *(udg_integer02)))
                    call SetUnitEvasion(GetLastCreatedUnit(), evasionBonus)	
                    call SetUnitBlock(GetLastCreatedUnit(), blockBonus)			
    
                    if udg_integer02 < 3 then
                        call BlzSetUnitBaseDamage(GetLastCreatedUnit(),BlzGetUnitBaseDamage(GetLastCreatedUnit(),0)- 3,0)
    
                    elseif udg_integer02 < 8  then
                        call BlzSetUnitBaseDamage(GetLastCreatedUnit(),BlzGetUnitBaseDamage(GetLastCreatedUnit(),0)+ 1 * udg_integer02,0)
                        call BlzSetUnitMaxHP(GetLastCreatedUnit(), BlzGetUnitMaxHP(GetLastCreatedUnit())+ 3 * udg_integer02)
                        call SetWidgetLife(GetLastCreatedUnit(),BlzGetUnitMaxHP(GetLastCreatedUnit()) )
                    elseif udg_integer02 < 11  then
                        call BlzSetUnitArmor(GetLastCreatedUnit() , BlzGetUnitArmor(GetLastCreatedUnit()) + udg_integer02 / 3) 
                        call BlzSetUnitBaseDamage(GetLastCreatedUnit(),BlzGetUnitBaseDamage(GetLastCreatedUnit(),0)+ 2 * udg_integer02,0)
                        call BlzSetUnitMaxHP(GetLastCreatedUnit(), BlzGetUnitMaxHP(GetLastCreatedUnit())+ 10 * udg_integer02)
                        call SetWidgetLife(GetLastCreatedUnit(),BlzGetUnitMaxHP(GetLastCreatedUnit()) ) 		
                    elseif udg_integer02 < 19  then
                        call BlzSetUnitArmor(GetLastCreatedUnit() , BlzGetUnitArmor(GetLastCreatedUnit()) + udg_integer02 * 1) 
                        call BlzSetUnitBaseDamage(GetLastCreatedUnit(),BlzGetUnitBaseDamage(GetLastCreatedUnit(),0)+ 6 * udg_integer02,0)
                        call BlzSetUnitMaxHP(GetLastCreatedUnit(), BlzGetUnitMaxHP(GetLastCreatedUnit())+ 40 * udg_integer02)
                        call SetWidgetLife(GetLastCreatedUnit(),BlzGetUnitMaxHP(GetLastCreatedUnit()) )                	
                    elseif udg_integer02 < 24  then
                        call BlzSetUnitArmor(GetLastCreatedUnit() , BlzGetUnitArmor(GetLastCreatedUnit()) + udg_integer02 * 3) 
                        call BlzSetUnitBaseDamage(GetLastCreatedUnit(),BlzGetUnitBaseDamage(GetLastCreatedUnit(),0)+ 14 * udg_integer02,0)
                        call BlzSetUnitMaxHP(GetLastCreatedUnit(), BlzGetUnitMaxHP(GetLastCreatedUnit())+ 45 * udg_integer02)
                        call SetWidgetLife(GetLastCreatedUnit(),BlzGetUnitMaxHP(GetLastCreatedUnit()) )		    
    
                    elseif udg_integer02 < 35  then
                        call BlzSetUnitArmor(GetLastCreatedUnit() , BlzGetUnitArmor(GetLastCreatedUnit()) + udg_integer02 * 5) 
                        call BlzSetUnitBaseDamage(GetLastCreatedUnit(),BlzGetUnitBaseDamage(GetLastCreatedUnit(),0)+ 55 * udg_integer02,0)
                        call BlzSetUnitMaxHP(GetLastCreatedUnit(), BlzGetUnitMaxHP(GetLastCreatedUnit())+ 70 * udg_integer02)
                        call SetWidgetLife(GetLastCreatedUnit(),BlzGetUnitMaxHP(GetLastCreatedUnit()) )				    
    
                    elseif udg_integer02 < 41  then
                        call BlzSetUnitArmor(GetLastCreatedUnit() , BlzGetUnitArmor(GetLastCreatedUnit()) + udg_integer02 * 12) 
                        call BlzSetUnitBaseDamage(GetLastCreatedUnit(),BlzGetUnitBaseDamage(GetLastCreatedUnit(),0)+ 200 * udg_integer02,0)
                        call BlzSetUnitMaxHP(GetLastCreatedUnit(), BlzGetUnitMaxHP(GetLastCreatedUnit())+ 150 * udg_integer02)
                        call SetWidgetLife(GetLastCreatedUnit(),BlzGetUnitMaxHP(GetLastCreatedUnit()) )				    
                    elseif udg_integer02 < 45  then
                        call BlzSetUnitArmor(GetLastCreatedUnit() , BlzGetUnitArmor(GetLastCreatedUnit()) + udg_integer02 * 18) 
                        call BlzSetUnitBaseDamage(GetLastCreatedUnit(),BlzGetUnitBaseDamage(GetLastCreatedUnit(),0)+ 400 * udg_integer02,0)
                        call BlzSetUnitMaxHP(GetLastCreatedUnit(), BlzGetUnitMaxHP(GetLastCreatedUnit())+ 305 * udg_integer02)
                        call SetWidgetLife(GetLastCreatedUnit(),BlzGetUnitMaxHP(GetLastCreatedUnit()) )	
                    elseif udg_integer02 < 49  then
    
                        call BlzSetUnitArmor(GetLastCreatedUnit() , BlzGetUnitArmor(GetLastCreatedUnit()) + udg_integer02 * 20) 
                        call BlzSetUnitBaseDamage(GetLastCreatedUnit(),BlzGetUnitBaseDamage(GetLastCreatedUnit(),0)+ 500 * udg_integer02,0)
                        call BlzSetUnitMaxHP(GetLastCreatedUnit(), BlzGetUnitMaxHP(GetLastCreatedUnit())+ 600 * udg_integer02)
                        call SetWidgetLife(GetLastCreatedUnit(),BlzGetUnitMaxHP(GetLastCreatedUnit()) )	                                 
                    else
                        call BlzSetUnitArmor(GetLastCreatedUnit() , BlzGetUnitArmor(GetLastCreatedUnit()) + udg_integer02 * 20) 
                        call BlzSetUnitBaseDamage(GetLastCreatedUnit(),BlzGetUnitBaseDamage(GetLastCreatedUnit(),0)+ 900 * udg_integer02,0)
                        call BlzSetUnitMaxHP(GetLastCreatedUnit(), BlzGetUnitMaxHP(GetLastCreatedUnit())+ 1500 * udg_integer02)
                        call SetWidgetLife(GetLastCreatedUnit(),BlzGetUnitMaxHP(GetLastCreatedUnit()) )	             			    
                    endif
    
    
    
    
                    call SetUnitScalePercent(GetLastCreatedUnit(),(85.00 +((I2R(udg_integer02)- 1.00)* 0.50)),100,100)
                    call UnitAddNewAbilities(GetLastCreatedUnit())
                    call ConditionalTriggerExecute(udg_trigger99)
                    call ConditionalTriggerExecute(udg_trigger100)
                    call SetUnitMoveSpeed(GetLastCreatedUnit(),I2R(udg_integer09))
                    call SetUnitAbilityLevelSwapped('A000',GetLastCreatedUnit(),(R2I(udg_real01)/ 2))
                    call SetUnitAbilityLevelSwapped('A002',GetLastCreatedUnit(),udg_integer05)
                    call PauseUnitBJ(true,GetLastCreatedUnit())
                    call SetUnitInvulnerable(GetLastCreatedUnit(),true)
                    call ShowUnitHide(GetLastCreatedUnit())
    
                    if SantaHatOn then
                        call UnitAddAbility(GetLastCreatedUnit(), 'A0B1')
                    endif
                    
                    if udg_integer04 != 'n01H' and udg_integer04 != 'n00W' then
                        call BlzSetUnitBaseDamage(GetLastCreatedUnit(),R2I(BlzGetUnitBaseDamage(GetLastCreatedUnit(),0) * 0.5),0)
                    endif
    
                    //call BJDebugMsg("rci: " + I2S(udg_integer40 - 1))
                    if RoundCreepInfo[udg_integer40 - 1] == "" then
                        //call BJDebugMsg("a")
                        set RoundCreepTitle = "|cffdd9bf1" + I2S(udg_integer03) + " |r|cff77d2fc" + GetObjectName(udg_integer04) + "|r"
                        set s = RoundCreepTitle + ": "
                        set RoundCreepInfo[udg_integer40 - 1] = "|cfff19b9bHit points|r: " + I2S(BlzGetUnitMaxHP(GetLastCreatedUnit())) + "|n"
                        //call BJDebugMsg("b")
                        if IsUnitType(GetLastCreatedUnit(), UNIT_TYPE_MELEE_ATTACKER) then
                            set RoundCreepInfo[udg_integer40 - 1] = RoundCreepInfo[udg_integer40 - 1] + "|cffebde71Range|r: Melee |n"
                        else
                            set RoundCreepInfo[udg_integer40 - 1] = RoundCreepInfo[udg_integer40 - 1] + "|cff82f373Range|r: " + I2S(R2I(BlzGetUnitWeaponRealField(GetLastCreatedUnit(), UNIT_WEAPON_RF_ATTACK_RANGE, 0))) + "|n"
                            set s = s + "|cff82f373Ranged|r: "
                        endif
                        //call BJDebugMsg("c")
                        if udg_integer04 == 'n01H' or udg_integer04 == 'n00W' then
                            set RoundCreepInfo[udg_integer40 - 1] = RoundCreepInfo[udg_integer40 - 1] + "|cff9bddf1Damage Type|r: magic |n"
                            set s = s + "|cff9bddf1Magic Damage|r: "
                        else
                            set RoundCreepInfo[udg_integer40 - 1] = RoundCreepInfo[udg_integer40 - 1] + "|cfff167daDamage Type|r: physical |n"
                        endif
                        //call BJDebugMsg("d")
                        if BonusNeutral == 0 and BonusNeutralPlayer[udg_integer40 - 1] == 0 then
                            set RoundCreepInfo[udg_integer40 - 1] = RoundCreepInfo[udg_integer40 - 1] + "|cfff19bb8Damage|r: " + I2S(BlzGetUnitBaseDamage(GetLastCreatedUnit(), 0) + BlzGetUnitDiceNumber(GetLastCreatedUnit(), 0) + BlzGetAbilityIntegerLevelField(BlzGetUnitAbility(GetLastCreatedUnit(), 'A000'), ABILITY_ILF_ATTACK_BONUS, (R2I(udg_real01)/ 2) - 1)) + " - " + I2S(BlzGetUnitBaseDamage(GetLastCreatedUnit(), 0) + (BlzGetUnitDiceNumber(GetLastCreatedUnit(), 0) * BlzGetUnitDiceSides(GetLastCreatedUnit(), 0) ) + BlzGetAbilityIntegerLevelField(BlzGetUnitAbility(GetLastCreatedUnit(), 'A000'), ABILITY_ILF_ATTACK_BONUS, (R2I(udg_real01)/ 2) - 1)) + "|n"
                            set RoundCreepInfo[udg_integer40 - 1] = RoundCreepInfo[udg_integer40 - 1] + "|cff9babf1Armor|r: " + I2S(R2I(BlzGetUnitArmor(GetLastCreatedUnit()))) + "|n"
                            set RoundCreepInfo[udg_integer40 - 1] = RoundCreepInfo[udg_integer40 - 1] + "|cff78729eBlock|r: " + I2S(R2I(GetUnitBlock(GetLastCreatedUnit()))) + "|n"
                            set RoundCreepInfo[udg_integer40 - 1] = RoundCreepInfo[udg_integer40 - 1] + "|cff9bc7f1Magic power|r: " + I2S(R2I(GetUnitMagicDmg(GetLastCreatedUnit()))) + "|n"
                            set RoundCreepInfo[udg_integer40 - 1] = RoundCreepInfo[udg_integer40 - 1] + "|cff9bf1a9Magic protection|r: " + I2S(R2I(GetUnitMagicDef(GetLastCreatedUnit()))) + "|n"
                            set RoundCreepInfo[udg_integer40 - 1] = RoundCreepInfo[udg_integer40 - 1] + "|cfff1cc9bEvasion|r: " + I2S(R2I(GetUnitEvasion(GetLastCreatedUnit())))
                        else
                            set RoundCreepInfo[udg_integer40 - 1] = RoundCreepInfo[udg_integer40 - 1] + "|cfff19bb8Damage|r: " + I2S(BlzGetUnitBaseDamage(GetLastCreatedUnit(), 0) + BlzGetUnitDiceNumber(GetLastCreatedUnit(), 0) + BlzGetAbilityIntegerLevelField(BlzGetUnitAbility(GetLastCreatedUnit(), 'A000'), ABILITY_ILF_ATTACK_BONUS, (R2I(udg_real01)/ 2) - 1) - damageBonus) + " - " + I2S(BlzGetUnitBaseDamage(GetLastCreatedUnit(), 0) + (BlzGetUnitDiceNumber(GetLastCreatedUnit(), 0) * BlzGetUnitDiceSides(GetLastCreatedUnit(), 0) + BlzGetAbilityIntegerLevelField(BlzGetUnitAbility(GetLastCreatedUnit(), 'A000'), ABILITY_ILF_ATTACK_BONUS, (R2I(udg_real01)/ 2) - 1) - damageBonus )) + " + |cfff19bb8" + I2S(R2I(damageBonus)) + "|r|n"
                            set RoundCreepInfo[udg_integer40 - 1] = RoundCreepInfo[udg_integer40 - 1] + "|cff9babf1Armor|r: " + I2S(R2I(BlzGetUnitArmor(GetLastCreatedUnit()))) + "|n"
                            set RoundCreepInfo[udg_integer40 - 1] = RoundCreepInfo[udg_integer40 - 1] + "|cff78729eBlock|r: " + I2S(R2I(GetUnitBlock(GetLastCreatedUnit()) - blockBonus)) + " + |cff78729e" + I2S(R2I(blockBonus)) + "|r|n"
                            set RoundCreepInfo[udg_integer40 - 1] = RoundCreepInfo[udg_integer40 - 1] + "|cff9bc7f1Magic power|r: " + I2S(R2I(GetUnitMagicDmg(GetLastCreatedUnit()) - magicPowerBonus)) + "+ |cff9bc7f1" + I2S(R2I(magicPowerBonus)) + "|r|n"
                            set RoundCreepInfo[udg_integer40 - 1] = RoundCreepInfo[udg_integer40 - 1] + "|cff9bf1a9Magic protection|r: " + I2S(R2I(GetUnitMagicDef(GetLastCreatedUnit()) - magicDefBonus)) + " + |cff9bf1a9" + I2S(R2I(magicDefBonus)) + "|r|n"
                            set RoundCreepInfo[udg_integer40 - 1] = RoundCreepInfo[udg_integer40 - 1] + "|cfff1cc9bEvasion|r: " + I2S(R2I(GetUnitEvasion(GetLastCreatedUnit()) - evasionBonus)) + " + |cfff1cc9b" + I2S(R2I(evasionBonus)) + "|r"
                        endif
                        //call BJDebugMsg("e")
                        set s = s + RoundAbilities
                        call DisplayTimedTextToPlayer(Player(udg_integer40 - 1), 0, 0, 20, "Next: " + s)
                        //call BJDebugMsg("f")
                    endif
                    //call BJDebugMsg("rci finish: " + I2S(udg_integer40 - 1))
                else
                endif
                set udg_integer40 = udg_integer40 + 1
            endloop
            set udg_integer28 = udg_integer28 + 1
        endloop
    endfunction


    private function init takes nothing returns nothing
        set udg_trigger103 = CreateTrigger()
        call TriggerAddCondition(udg_trigger103,Condition(function Trig_Generate_Next_Level_Conditions))
        call TriggerAddAction(udg_trigger103,function Trig_Generate_Next_Level_Actions)
    endfunction


endlibrary
