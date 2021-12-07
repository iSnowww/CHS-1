library Functions requires RandomShit, ExtradimensionalCooperation, EndOfRoundItem, ArenaRing, Glory
    globals 
        hashtable HT_SpellPlayer = InitHashtable()
    endglobals

    function LoadCountHeroSpell takes unit u,integer list returns integer 
        return LoadInteger(HT_SpellPlayer,GetHandleId(u),- list)
    endfunction

    function SetInfoHeroSpell takes unit u, integer num, integer id returns nothing
        call SaveInteger(HT_SpellPlayer,GetHandleId(u),num,id)
        call SaveInteger(HT_SpellPlayer,GetHandleId(u),id,num)
    endfunction

    function SaveCountHeroSpell takes unit u,integer count,integer list returns nothing 
        call SaveInteger(HT_SpellPlayer,GetHandleId(u),- list,count)
    endfunction

    function RemoveInfoHeroSpell takes unit u, integer id returns nothing
        local integer num = LoadInteger(HT_SpellPlayer,GetHandleId(u),id)
        call SaveInteger(HT_SpellPlayer,GetHandleId(u),num,0)
        call SaveInteger(HT_SpellPlayer,GetHandleId(u),id,0)
    endfunction

    function AddSpellPlayerInfo takes integer id, unit u, integer list returns nothing
        local integer i1 = 1 + 10 * list
        local integer Count = LoadCountHeroSpell(u,list)
        local integer Current = 1
        local integer InfoId 
        local boolean HaveSpell = false
        loop
            set InfoId = GetInfoHeroSpell(u,i1)
            if  (InfoId == 0) and (Current == 0) then
                set Current = i1
            endif

            if id == InfoId then
                set HaveSpell = true
            endif

            set i1 = i1 + 1
            exitwhen  (i1 > 10 + 10 * list) or  (HaveSpell)
        endloop
        if HaveSpell == false then
            set Count = Count + 1
            call SaveCountHeroSpell(u,Count,list)
            call SetInfoHeroSpell(u,Count + list * 10,id)
        endif 

        //  call DisplayTextToPlayer(GetLocalPlayer(),0,0,I2S(LoadCountHeroSpell(u) ))
    endfunction

    function SpellLearnedFunc takes unit u, integer abilId returns nothing

        if GetUnitTypeId(u) == TAUREN_UNIT_ID then
            call SpiritTaurenRuneBonus(u, abilId)
        endif
    endfunction

    function FuncEditParam takes integer abilId, unit u returns nothing
        local integer i1 = 0
        local integer i2 = 0
        local integer NumAbility

        if IsUnitType(u, UNIT_TYPE_HERO) and IsAbsolute(abilId) == false then
            call AddSpellPlayerInfo(abilId,u,0)

            call SetChanellOrder(u,abilId,GetInfoHeroSpell(u,abilId)  )
        endif

        if abilId == 'AEev' then
            set i1 = GetUnitAbilityLevel(u,abilId)
            set i2 = LoadInteger(HT,GetHandleId(u),- 10001) 
            call AddUnitEvasion(u ,   2 * I2R(i1 - i2)  )	
            call SaveInteger(HT,GetHandleId(u),- 10001,i1)
        endif

        if abilId == 'Acdb' then
            set i1 = GetUnitAbilityLevel(u,abilId)
            set i2 = LoadInteger(HT,GetHandleId(u),- 10002) 
            call AddUnitEvasion(u ,   1 * I2R(i1 - i2)  )	
            call SaveInteger(HT,GetHandleId(u),- 10002,i1)
        endif    

        if abilId == 'Assk' then
            set i1 = GetUnitAbilityLevel(u,abilId)
            set i2 = LoadInteger(HT,GetHandleId(u),- 10003) 
            call AddUnitBlock(u ,   50 * I2R(i1 - i2)  )	
            call SaveInteger(HT,GetHandleId(u),- 10003,i1)
        endif 

        if abilId == 'A05S' then
            set i1 = GetUnitAbilityLevel(u,abilId)
            set i2 = LoadInteger(HT,GetHandleId(u),- 10004) 
            call AddUnitMagicDef(u ,   3 * I2R(i1 - i2)  )	
            call SaveInteger(HT,GetHandleId(u),- 10004,i1)
            call SetPlayerAbilityAvailable(GetOwningPlayer(u), 'A05S', false)
            call SetPlayerAbilityAvailable(GetOwningPlayer(u), 'A05S', true)
        endif 

        if abilId == 'A06V' then
            set i1 = GetUnitAbilityLevel(u,abilId)
            set i2 = LoadInteger(HT,GetHandleId(u),- 10005) 
            call AddUnitLuck(u ,   0.01 * I2R(i1 - i2)  )	
            call SaveInteger(HT,GetHandleId(u),- 10005,i1)
        endif 

        if GetUnitAbilityLevel(u, 'A0AC') > 0 then
            call AbsolutePoisonLearned(u)
        endif

        if abilId == 'A05Z' or abilId == 'A05U' or abilId == 'A0AS' and GetUnitAbilityLevel(u,abilId) == 1 then
            call BlzStartUnitAbilityCooldown(u,abilId,60)
        endif

        if abilId == 'A05Z' then
            call MysteriousTalentUpdateDesc(u)
        endif


        if abilId == 'A02O' then     
            if LoadReal(HT, GetHandleId(u),1 ) == 0 then 
                call SaveReal(HT,GetHandleId(u),1, BlzGetUnitAttackCooldown(u,0)    )
            endif
            call SaveReal(HT,GetHandleId(u),'A02O', 0.02 * I2R(GetUnitAbilityLevel(u,abilId))   )	
            //     call BlzSetUnitAttackCooldown(u, 0.92 - (0.02*I2R(GetUnitAbilityLevel(u,abilId)) ),0  )
        endif
    endfunction

    function FunResetAbility takes integer abilId, unit u returns nothing
        local integer i1 = 0
        local integer i2 = 0

        call RemoveInfoHeroSpell(u,abilId)

        if abilId == 'AEev' then
            set i1 = GetUnitAbilityLevel(u,abilId)
            set i2 = LoadInteger(HT,GetHandleId(u),- 10001) 
            call AddUnitEvasion(u ,   2 * I2R(i1 - i2)  )	
            call SaveInteger(HT,GetHandleId(u),- 10001,i1)
        endif

        if abilId == 'Acdb' then
            set i1 = GetUnitAbilityLevel(u,abilId)
            set i2 = LoadInteger(HT,GetHandleId(u),- 10002) 
            call AddUnitEvasion(u ,   I2R(i1 - i2)  )	
            call SaveInteger(HT,GetHandleId(u),- 10002,i1)
        endif 

        if abilId == 'Assk' then
            set i1 = GetUnitAbilityLevel(u,abilId)
            set i2 = LoadInteger(HT,GetHandleId(u),- 10003) 
            call AddUnitBlock(u ,   50 * I2R(i1 - i2)  )	
            call SaveInteger(HT,GetHandleId(u),- 10003,i1)
        endif 

        if abilId == 'A05S' then
            set i1 = GetUnitAbilityLevel(u,abilId)
            set i2 = LoadInteger(HT,GetHandleId(u),- 10004) 
            call AddUnitMagicDef(u ,   3 * I2R(i1 - i2)  )	
            call SaveInteger(HT,GetHandleId(u),- 10004,i1)
        endif 

        if abilId == 'A082' then
            set i1 = GetUnitAbilityLevel(u,abilId)
            set i2 = LoadInteger(HT,GetHandleId(u),- 10005) 
            call AddUnitLuck(u ,   0.01 * I2R(i1 - i2)  )	
            call SaveInteger(HT,GetHandleId(u),- 10005,i1)
        endif 

        if abilId == 'A0AC' then
            call AbsolutePoisonLearned(u)
        endif

        if GetUnitTypeId(u) == TAUREN_UNIT_ID then
            call SpiritTaurenRuneBonusReset(u, abilId)
        endif

        if abilId == 'A02O' then
            if LoadReal(HT, GetHandleId(u),1 ) != 0 then
                //   call BlzSetUnitAttackCooldown(u,LoadReal(HT, GetHandleId(u),1 ) ,0 ) 
            endif
        endif
    endfunction

    function FunctionStartUnit takes unit U returns nothing
        if LoadReal(HT, GetHandleId(U),1 ) == 0 then 
            call SaveReal(HT,GetHandleId(U),- 1001, BlzGetUnitAttackCooldown(U,0)    )
            call SaveInteger(HT,GetHandleId(U),- 1000,  BlzGetUnitIntegerField(U,UNIT_IF_PRIMARY_ATTRIBUTE)    )
        endif
    endfunction

    function Func_completeLevel takes unit u returns nothing
        local player p = GetOwningPlayer(u)
        local integer pid = GetPlayerId(p)
        local integer i1 = 0 
        local real gloryBonus = 0

        //Armor of the Ancestors
        set i1 = LoadInteger(HT,GetHandleId(u),54001)
        if i1 != 0 then 
            call BlzSetUnitArmor(u,BlzGetUnitArmor(u)- i1)
            call AddUnitBlock(u,- i1)
            call SaveInteger(HT,GetHandleId(u),54001,0)
            set NumberOfUnit[pid] = 0
        endif

        //Murloc Warrior
        set i1 = LoadInteger(HT,GetHandleId(u),54021)
        if i1 != 0 then 
            call SetHeroStr(u,GetHeroStr(u,false)- i1,false)
            call SetHeroAgi(u,GetHeroAgi(u,false)- i1,false)
            call SetHeroInt(u,GetHeroInt(u,false)- i1,false)
            call SaveInteger(HT,GetHandleId(u),54021,0)
        endif

        //Golden Armor
        set i1 = GetValidEndOfRoundItems(u,'I07H') 
        if i1 > 0 then
            call AddUnitBlock(u,15 * i1)
            call AddUnitMagicDef(u,1 * i1)
        endif

        //Extra-dimensional Cooperation
        if GetUnitAbilityLevel(u, 'A08I') > 0 then
            call ResetExtraDimensional(u)
        endif

        //Time Manipulation
        if GetUnitAbilityLevel(u, 'A0AS') > 0 then
            set TimeManipulationTable[GetHandleId(u)].boolean[1] = false
            set TimeManipulationTable[GetHandleId(u)].real[2] = 0
            call BlzEndUnitAbilityCooldown(u, 'A0AS')
        endif

        //Wolf Rider - Thrall
        if GetUnitTypeId(u) == 'U000' and (T32_Tick - RoundTimer[pid]) / 32 < 8 + (0.01 * GetHeroLevel(u)) then
            set i1 = R2I(10 + (GetHeroLevel(u) * 1))
            set SpeedFreakBonus[GetHandleId(u)].integer[4] = SpeedFreakBonus[GetHandleId(u)].integer[4] + i1
            call SetBonus(u, 0, SpeedFreakBonus[GetHandleId(u)].integer[4])
            call DisplayTextToPlayer(p,0,0,"|cfffff56eSpeed Freak|r: |cff88ff00+" + I2S(i1) + " agility.|r")
            call SetHeroAgi(u, GetHeroAgi(u, false) + i1, true)
        endif

        //Round glory
        set Glory[pid] = Glory[pid] + GetPlayerGloryBonus(pid)
        call ResourseRefresh(Player(pid)) 
        call AdjustPlayerStateBJ( Income[pid],p,PLAYER_STATE_RESOURCE_GOLD)
        call DisplayTextToPlayer(p,0,0,"|cffffee00Gold Income|r: +" + I2S(Income[pid])  + " - |cff00aa0eLumber|r: +" + I2S(LumberGained[pid]) + " - |cff7af0f8Glory|r: +" + I2S(R2I((200 + GloryRoundBonus[pid]))))

        if Income[pid] == 0 then 
            call DisplayTextToPlayer(p,0,0,"You can increase your income in Power Ups Shop II")       
        endif

        if ModuloInteger(udg_integer02, 3) == 0 then
            call Hints_DisplayHint(pid)
        endif

        if (udg_integer02 == 15 or udg_integer02 == 30) then
            set Lives[pid] = Lives[pid] + 1
            call DisplayTextToPlayer(p,0,0,"|cff85ff3eRound|r: " + I2S(udg_integer02) + "|r: |cffecff3e+1 life|r for you being you.")
        endif
    endfunction
endlibrary