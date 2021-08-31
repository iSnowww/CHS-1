globals
    boolean GLOB_cuttting = false 
endglobals
 
 
 function SetTypeDamage takes unit u returns nothing

   if BlzGetEventDamageType() != DAMAGE_TYPE_SPIRIT_LINK then
        if BlzGetEventIsAttack() or GLOB_typeDmg == 2  then
            set GLOB_typeDmg = 0
            call BlzSetEventDamageType(DAMAGE_TYPE_NORMAL)
        else 
        
            call BlzSetEventDamageType(DAMAGE_TYPE_MAGIC)
        endif

        //Seer
        if GetUnitTypeId(u) == 'H01L' then
            if BlzGetEventDamageType() == DAMAGE_TYPE_NORMAL then
                call BlzSetEventDamageType(DAMAGE_TYPE_MAGIC)
            else
                call BlzSetEventDamageType(DAMAGE_TYPE_NORMAL)
            endif
        else
            //Staff of Power
            if  UnitHasItemS( GetEventDamageSource() ,'I080') then
                call BlzSetEventDamageType(DAMAGE_TYPE_MAGIC)
            endif
        endif
  endif

 endfunction
 
 
  function DivineBubbleEnd takes nothing returns nothing
    local timer tim = GetExpiredTimer()
    local unit u = LoadUnitHandle(HT,GetHandleId(tim),1)
    local effect eff = LoadEffectHandle(HT,GetHandleId(tim),2)
    call SaveBoolean(HT,GetHandleId(u),'A07S',false) 
    call DestroyEffect(eff)
    call UnitRemoveAbility(u, 'A08C')
    call UnitRemoveAbility(u, 'B01E')
    call FlushChildHashtable(HT,GetHandleId(tim))
    call DestroyTimer(tim)
    set tim = null
    set eff = null
    set u = null
 endfunction
 
 
 
 function Trig_Damage_Controller_Before_Actions takes nothing returns nothing
 	local unit TriigerU = GetTriggerUnit()
	local unit AttackerU= GetEventDamageSource()
	
	local integer PidT = GetPlayerId(GetOwningPlayer(TriigerU ))
	local integer PidA = GetPlayerId(GetOwningPlayer(AttackerU))
	
	local integer HandleId1 = GetHandleId(TriigerU) 	
	local unit GUS = udg_units01[GetConvertedPlayerId(GetOwningPlayer( AttackerU) ) ]
	local unit GUT = udg_units01[GetConvertedPlayerId(GetOwningPlayer( TriigerU) ) ]
	local damagetype  DmgType
	local real DMG_1 = 0
	local timer tim = null
	local real DMG_DF = 0
    local boolean  attack = BlzGetEventIsAttack()
    local real Admg
	local real DMG_M = 1
    local integer II = 0
    local integer CuId = GetUnitTypeId(AttackerU)
    local real luck = 1
    local real luck_t = 1
    local boolean AbilA = true
    local boolean Bfirst = false
    
    if GetOwningPlayer(TriigerU) == Player(11) then
        set GUT = TriigerU
    endif
    
    if GetOwningPlayer(AttackerU) == Player(11) then
        set GUS = AttackerU
    endif
    
    if AttackerU == null then
        set GUS = null
    endif

    if CuId == 'h015' or CuId == 'h014' or CuId == 'h00T' or CuId == 'n00V' then
        set AttackerU = GUS
    endif

    if CuId == 'e001' then
        set AttackerU = GUS
    endif

    set luck = GetUnitLuck(AttackerU)
    set luck_t = GetUnitLuck(TriigerU)
    
    call SetTypeDamage(AttackerU)
    set DmgType = BlzGetEventDamageType()

    if TypeDmg_b == 2 then
        set AbilA = false
    endif 
    set TypeDmg_b = 0

    //set attack damage
    if IsUnitType(AttackerU, UNIT_TYPE_HERO) and attack then
        set SpellData[GetHandleId(AttackerU)].real[7] = GetEventDamage()
    endif
    
    //Whirlwind
    if GetUnitAbilityLevel(AttackerU, 'A025') > 0 and DmgType == DAMAGE_TYPE_NORMAL and SpellData[GetHandleId(AttackerU)].boolean[4] == false then
        set SpellData[GetHandleId(AttackerU)].real[2] = GetEventDamage()
        call Whirlwind_Description(AttackerU, GetEventDamage())
    endif

    //Extradimensional Cooperation
    if GetUnitAbilityLevel(AttackerU, 'B01H') > 0 and AbilA and SpellData[GetHandleId(AttackerU)].boolean[5] == false then
        call CastExtradimensionalCoop(AttackerU, TriigerU, GetEventDamage(), DmgType != DAMAGE_TYPE_NORMAL)
    endif
    
    //Crits
    if DmgType ==  DAMAGE_TYPE_NORMAL then
        call TakePhysDmg(AttackerU,TriigerU)
    else
        call TakeMagickDmg(AttackerU,TriigerU)
    endif

    
    
    
    //Cutting
    set GLOB_cuttting = false
    set II =  GetUnitAbilityLevel(AttackerU,'A081')
    if II > 0 and attack and GetRandomReal(1,100) < 20*luck then
        call BlzSetEventDamage(GetEventDamage()+II*100)
        set GLOB_cuttting = true
    endif
    
    //Divine Bubble
    if GetUnitAbilityLevel(TriigerU,'A07S') > 0 then
        if LoadBoolean(HT,GetHandleId(TriigerU),'A07S') and GetUnitAbilityLevel(TriigerU, 'A08C') > 0 then
            call RemoveDebuff(TriigerU) 
        elseif BlzGetUnitAbilityCooldownRemaining(TriigerU,'A07S') <= 0.001 then
            set tim = CreateTimer()
            call RemoveDebuff(TriigerU) 
            call UnitAddAbility(TriigerU, 'A08C')
            call AbilStartCD(TriigerU,'A07S', 60)  
            call SaveBoolean(HT,GetHandleId(TriigerU),'A07S',true)	    
            call SaveUnitHandle(HT,GetHandleId(tim),1,GetTriggerUnit())
            call SaveEffectHandle(HT,GetHandleId(tim),2,AddSpecialEffectTarget( "RighteousGuard.mdx" , TriigerU , "origin" ) ) 
            call TimerStart(tim,1.50 + 0.15*I2R(GetUnitAbilityLevel(TriigerU,'A07S')) ,false, function DivineBubbleEnd)
        endif
    endif
    
	if GetEventDamage() == 0 then
        set TriigerU = null
        set AttackerU = null
		set GUS = null
		set GUT = null
		return
	endif
	
    //Storm Horn
	if GetUnitAbilityLevel(GetTriggerUnit() ,'B00B') >= 1 then
		if GetRandomReal(1,100) <= 14*luck_t then
			call BlzSetEventDamage(   0 )
			call DestroyEffect( AddSpecialEffectTargetFix("Abilities\\Spells\\Human\\Resurrect\\ResurrectTarget.mdl", GetTriggerUnit(), "chest"))
			set GUS = null
		    set GUT = null
		    return
		endif		
	endif

    //Aura of Immortality
	if GetUnitAbilityLevel(GetTriggerUnit() ,'B00D') >= 1 then
		if GetRandomInt(1,100) <= GetUnitAbilityLevel(GUT  ,'A02L') then
			call BlzSetEventDamage(   0 )
			call DestroyEffect( AddSpecialEffectTargetFix("Abilities\\Spells\\Items\\AIlm\\AIlmTarget.mdl", GetTriggerUnit(), "chest"))
	    	set GUS = null
		    set GUT = null
	    	return			
		endif		
	endif	
	
	
    //Dark Shield
    if  UnitHasItemS( TriigerU,'I060' )  then
        if   DmgType ==  DAMAGE_TYPE_NORMAL then
            if  BlzGetUnitAbilityCooldownRemaining(TriigerU, 'A08R') <= 0 then
                call AbilStartCD(TriigerU, 'A08R', 1)
                call BlzSetEventDamage(0) 
                call DestroyEffect( AddSpecialEffectTargetFix("Abilities\\Spells\\Items\\SpellShieldAmulet\\SpellShieldCaster.mdl", TriigerU, "chest")) 
                set tim = null
                set GUS = null
	            set GUT = null
	            set TriigerU = null
            	set AttackerU = null
                return
            endif 
        else 
            if  BlzGetUnitAbilityCooldownRemaining(TriigerU, 'A08Q') <= 0 then
                call AbilStartCD(TriigerU, 'A08Q', 3)
                call BlzSetEventDamage(0) 
                call DestroyEffect( AddSpecialEffectTargetFix("Abilities\\Spells\\Items\\SpellShieldAmulet\\SpellShieldCaster.mdl", TriigerU, "chest")) 
                set tim = null
                set GUS = null
	            set GUT = null
	            set TriigerU = null
            	set AttackerU = null
                return
            endif 
        endif      
        if  BlzGetUnitAbilityCooldownRemaining(TriigerU, 'A08S') <= 0 then
            call AbilStartCD(TriigerU, 'A08S', 6)
            call RemoveDebuff(TriigerU)  
            call DestroyEffect( AddSpecialEffectTargetFix("Abilities\\Spells\\Items\\AIta\\CrystalBallCaster.mdl", TriigerU, "chest")) 
            set tim = null
            set GUS = null
            set GUT = null
            set TriigerU = null
            set AttackerU = null
            return
        endif 
    endif 

    //Light Magic Shield
    if   UnitHasItemS( TriigerU,'I06K' ) and BlzGetUnitArmor(TriigerU)<=50  then
         call BlzSetEventDamage(  GetEventDamage()*0.7  )
    endif

    //Centuar Archer passive
    if GetUnitTypeId(AttackerU) == 'H01B' and attack then
        if BlzGetUnitAbilityCooldownRemaining(AttackerU, 'A08T') <= 0 then
            call AbilStartCD(AttackerU, 'A08T', 2)
            call ElemFuncStart(AttackerU,'H01B')
            call BlzSetEventDamage(GetEventDamage() + (BlzGetUnitMaxHP(TriigerU) * 0.06) + (GetEventDamage() * (1 + (0.05 * GetHeroLevel(AttackerU)))) )
            call DestroyEffect( AddSpecialEffectTargetFix("Objects\\Spawnmodels\\Human\\HCancelDeath\\HCancelDeath.mdl", TriigerU, "chest"))
         endif
     endif  
     
    //Hero's Hammer
    set II =  UnitHasItemI( AttackerU,'I064' )
    if  II > 0 and DmgType ==  DAMAGE_TYPE_NORMAL then 
        if BlzGetUnitAbilityCooldownRemaining(AttackerU,'A051') <= 0 then
	     call  AbilStartCD(AttackerU,'A051',15/(  BlzGetUnitAttackCooldown(AttackerU,0) ))
         call BlzSetEventDamage(GetEventDamage() + II*(2.2*GetHeroStr(AttackerU ,true)-GetHeroAgi(AttackerU ,true))  )  
         call DestroyEffect( AddSpecialEffectTargetFix("Abilities\\Weapons\\BallistaMissile\\BallistaMissileTarget.mdl", TriigerU, "chest"))  
        endif
    endif
        
    //Hammer of Chaos
    if  UnitHasItemS( AttackerU,'I06H' ) and  attack then
        if BlzGetUnitAbilityCooldownRemaining(AttackerU,'A04Y') <= 0 then
              call  AbilStartCD(AttackerU,'A04Y', 8 )
              call USOrder4field(AttackerU,GetUnitX(TriigerU),GetUnitY(TriigerU),'A04R',"stomp",GetEventDamage(),ABILITY_RLF_DAMAGE_INCREASE,500,ABILITY_RLF_CAST_RANGE ,1,ABILITY_RLF_DURATION_HERO,0.05,ABILITY_RLF_DURATION_NORMAL)
         endif       
    endif   
    
    //Cruelty
    set II =  GetUnitAbilityLevel(AttackerU,'A067')
    if II > 0 and  DmgType ==  DAMAGE_TYPE_NORMAL and (BlzGetUnitAbilityCooldownRemaining(AttackerU,'A067') <= 0.001 or CheckTimerZero(GUS,'A067') ) then
        call BlzSetEventDamage(GetEventDamage() +   GetEventDamage()*(2.5+I2R(II)/2) ) 
        call DestroyEffect( AddSpecialEffectTargetFix("Objects\\Spawnmodels\\Undead\\UndeadDissipate\\UndeadDissipate.mdl", TriigerU, "chest"))
        if ZetoTimerStart(AttackerU,'A067') then
            call  AbilStartCD(AttackerU,'A067', 6 )
        endif
    endif

    //Trident of Pain
    if  UnitHasItemS( AttackerU,'I061' )  then
        if   DmgType ==  DAMAGE_TYPE_NORMAL then
            if BlzGetUnitAbilityCooldownRemaining(AttackerU, 'A08X') <= 0 then
                call AbilStartCD(AttackerU, 'A08X', 12)
                call ElemFuncStart(AttackerU,'I061')
               call BlzSetEventDamage(GetEventDamage()*2.6)
               call CreateTextTagTimer( R2S(GetEventDamage()) + "!",1,GetUnitX(TriigerU),GetUnitY(TriigerU),50,1)
            elseif BlzGetUnitAbilityCooldownRemaining(AttackerU, 'A08Y') <= 0 then
                call AbilStartCD(AttackerU, 'A08Y', 12)
                call ElemFuncStart(AttackerU,'I061')
               call BlzSetEventDamage(GetEventDamage()*2.6)
               call CreateTextTagTimer( R2S(GetEventDamage()) + "!",1,GetUnitX(TriigerU),GetUnitY(TriigerU),50,1)
            elseif BlzGetUnitAbilityCooldownRemaining(AttackerU, 'A08Z') <= 0 then
                call AbilStartCD(AttackerU, 'A08Z', 12)
                call ElemFuncStart(AttackerU,'I061')
               call BlzSetEventDamage(GetEventDamage()*2.6)
               call CreateTextTagTimer( R2S(GetEventDamage()) + "!",1,GetUnitX(TriigerU),GetUnitY(TriigerU),50,1)
            endif
        endif
    endif

    //Ursa Warrior
    if GetUnitTypeId(AttackerU) == 'N00Q' and attack then
        call CastUrsaBleed(AttackerU, TriigerU, GetEventDamage(), DmgType !=  DAMAGE_TYPE_NORMAL)
    endif
    
    //Pvp Bonus
   if IsHeroUnitId( GetUnitTypeId(TriigerU)) then
       call BlzSetEventDamage(GetEventDamage()+  (GetEventDamage()*(GetUnitPvpBonus(AttackerU)-GetUnitPvpBonus(TriigerU)  )/100)   )
   endif 

   //Ogre Warrior
    if GetUnitTypeId(AttackerU) == 'H01C' and  DmgType ==  DAMAGE_TYPE_NORMAL then
        if BlzGetUnitAbilityCooldownRemaining(AttackerU, 'A08U') <= 0 then
            call AbilStartCD(AttackerU, 'A08U', 8)
            call ElemFuncStart(AttackerU,'H01C')
            call USOrder4field(AttackerU,GetUnitX(TriigerU),GetUnitY(TriigerU),'A047',"stomp",GetHeroStr(AttackerU,true) + 60*GetHeroLevel(AttackerU) ,ABILITY_RLF_DAMAGE_INCREASE,300,ABILITY_RLF_CAST_RANGE ,1,ABILITY_RLF_DURATION_HERO,1,ABILITY_RLF_DURATION_NORMAL)
         endif
     endif  
      
     //Ice Armor
    if GetUnitAbilityLevel(TriigerU,'A053')>0 and  BlzGetUnitAbilityCooldownRemaining(TriigerU,'A053') <= 0    then
          call DestroyEffect( AddSpecialEffectTargetFix("Abilities\\Spells\\Other\\FrostBolt\\FrostBoltMissile.mdl", TriigerU, "chest"))
          call BlzSetEventDamage( GetEventDamage()/5) 
          call  AbilStartCD(TriigerU,'A053', 2.05 -  0.05*I2R(GetUnitAbilityLevel(TriigerU,'A053')) )
    endif  

    //Blessed Protection
    if LoadTimerHandle(HT_timerSpell,HandleId1,3) != null then
		call BlzSetEventDamage(  GetEventDamage()/10) 
	endif

    //Pit Lord
    if GetUnitTypeId(AttackerU) == 'O007' then
        if BlzGetUnitAbilityCooldownRemaining(AttackerU, 'A08V') <= 0 then
            call AbilStartCD(AttackerU, 'A08V', 4)
            call ElemFuncStart(AttackerU,'O007')
            call UsOrderU2 (AttackerU,TriigerU,GetUnitX(AttackerU),GetUnitY(AttackerU),'A08N',"rainoffire", GetHeroLevel(AttackerU)*40, GetHeroLevel(AttackerU)*20, ABILITY_RLF_DAMAGE_HBZ2, ABILITY_RLF_DAMAGE_PER_SECOND_HBZ5)
        endif
    endif

    //Lich
	if GetUnitTypeId(AttackerU) == 'H018' and  DmgType !=  DAMAGE_TYPE_NORMAL then
        if BlzGetUnitAbilityCooldownRemaining(AttackerU, 'A08W') <= 0 then
            call AbilStartCD(AttackerU, 'A08W', 6)
            call ElemFuncStart(AttackerU,'H018')
            call UsOrderU2 (AttackerU,TriigerU,GetUnitX(AttackerU),GetUnitY(AttackerU),'A03J',"frostnova",GetHeroLevel(AttackerU)*60,GetHeroLevel(GUS)*60, ABILITY_RLF_AREA_OF_EFFECT_DAMAGE,ABILITY_RLF_SPECIFIC_TARGET_DAMAGE_UFN2)
        endif
	endif
	
    //Air Force
	if GetUnitAbilityLevel(GUS  ,'A02T') >= 1 then
        if GetUnitAbilityLevel(TriigerU,'Bams') > 0 or GetUnitAbilityLevel(TriigerU,'Bam2') > 0  then
        
            call BlzSetEventDamage(  GetEventDamage()  + (I2R(GetUnitAbilityLevel(GUS  ,'A02T'))*GetHeroAgi(GUS,true))/40  )
        else
            call BlzSetEventDamage(  GetEventDamage()  + (I2R(GetUnitAbilityLevel(GUS  ,'A02T'))*GetHeroAgi(GUS,true))/20  )
        endif
		call DestroyEffect( AddSpecialEffectTargetFix("Abilities\\Spells\\Items\\AIlb\\AIlbSpecialArt.mdl", TriigerU, "chest"))		
	endif

    //Grom Hellscream
    if GetUnitTypeId(GUS) == 'N024' and DmgType == DAMAGE_TYPE_NORMAL then
        call BlzSetEventDamage(GetEventDamage() + GetHeroStr(GUS, true))
        call DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Items\\AIfb\\AIfbSpecialArt.mdl", TriigerU, "chest"))		
    endif

    //Robes of the ARchmage
	if GetUnitAbilityLevel(AttackerU  ,'B00L') >= 1 and  DmgType !=  DAMAGE_TYPE_NORMAL  then
     	set DMG_M = DMG_M   +          (  BlzGetUnitMaxMana( TriigerU )  -  GetUnitState( TriigerU  , UNIT_STATE_MANA  )  )/90000
	endif
	
	if DmgType !=  DAMAGE_TYPE_NORMAL then 
        //Magic Power
    	if DMG_M != 1 or GetUnitMagicDmg(AttackerU) > 0 then
    		call BlzSetEventDamage(  GetEventDamage()*(DMG_M+GetUnitMagicDmg(AttackerU)/100 )   )
    	endif   
        
        //Magic Resistance
        set DMG_DF =  GetUnitMagicDef(TriigerU)   
        if DMG_DF > 0 then
           call BlzSetEventDamage(  GetEventDamage()*( 50/(50+DMG_DF) )   )        
        endif                
	endif
	
	//Block
	if GetUnitBlock(TriigerU) != 0 then
		set DMG_1 = GetEventDamage()	
		set DMG_1 = DMG_1 - GetUnitBlock(TriigerU) 
		if DMG_1 < 0 then
			call BlzSetEventDamage(0)
		else
			call BlzSetEventDamage(DMG_1 )
		endif
	
	endif

    if AbilA then
        if DmgType == DAMAGE_TYPE_NORMAL and not (GetUnitTypeId(AttackerU) == 'new1' or GetUnitTypeId(AttackerU) == 'nwe2' or GetUnitTypeId(AttackerU) == 'nwe3'  or GetUnitTypeId(AttackerU) == 'h009'  or GetUnitTypeId(AttackerU) == 'n00W' or GetUnitTypeId(AttackerU) == 'n01H') then
            
            //thorns
            if (GetUnitAbilityLevel(TriigerU, 'B01C') > 0 or GetUnitAbilityLevel(TriigerU, 'A08F') > 0) then
                set SpellData[HandleId1].boolean[1] = true
                if IsUnitType(AttackerU, UNIT_TYPE_HERO) then
                    call MagicDamage(TriigerU,AttackerU, GetEventDamage() * (GetUnitAbilityLevel(GUT, 'A08F') * 0.01), true)
                else
                    call MagicDamage(TriigerU,AttackerU, GetEventDamage() * (GetUnitAbilityLevel(GUT, 'A08F') * 0.02), true)
                endif
            endif
            
            //spiked carapace
            if GetUnitAbilityLevel(TriigerU, 'AUts') > 0 then
                set SpellData[HandleId1].boolean[1] = true
                call MagicDamage(TriigerU,AttackerU, GetEventDamage() * (GetUnitAbilityLevel(GUT, 'AUts') * 0.005), true)
            endif
        endif
        
        if DmgType == DAMAGE_TYPE_MAGIC or GetUnitTypeId(AttackerU) == 'nwe1' or GetUnitTypeId(AttackerU) == 'nwe2' or GetUnitTypeId(AttackerU) == 'nwe3'  or GetUnitTypeId(AttackerU) == 'h009'  or GetUnitTypeId(AttackerU) == 'n00W' or GetUnitTypeId(AttackerU) == 'n01H' then
            
            //wizardbane
            if GetUnitAbilityLevel(TriigerU, 'B01B') > 0 then
                set SpellData[HandleId1].boolean[1] = true
                if IsUnitType(AttackerU, UNIT_TYPE_HERO) then
                    call MagicDamage(TriigerU,AttackerU, GetEventDamage() * (GetUnitAbilityLevel(GUT, 'A088') * 0.01), true)
                else
                    call MagicDamage(TriigerU,AttackerU, GetEventDamage() * (GetUnitAbilityLevel(GUT, 'A088') * 0.02), true)
                endif
                call DestroyEffect(AddSpecialEffect("Abilities\\Weapons\\Bolt\\BoltImpact.mdl", GetUnitX(AttackerU), GetUnitY(AttackerU)))
            endif
        endif
    endif
    
    //Martial retribution
    if GetUnitAbilityLevel(TriigerU, 'A089') > 0 and BlzGetUnitAbilityCooldownRemaining(TriigerU,'A089') <= 0 then
        call MartialRetributionStore(TriigerU, GetEventDamage() * 0.5)
    endif

    if AbilA and DmgType == DAMAGE_TYPE_NORMAL then   
    
        //Liquid Fire
        set II = GetUnitAbilityLevel(AttackerU,'A06Q')
        if II > 0 then
        
            if GetUnitAbilityLevel(TriigerU,'B016') == 0 then
                set Bfirst = true
                else
                set Bfirst = false 
            endif
            call SetBuff(TriigerU,3,8)
            call PerodicDmg(AttackerU,TriigerU,40*II +  GetUnitMagicDmg(AttackerU)*5,0,1,3.01,'B016',Bfirst)
        endif
        
        //Envenomed Weapons
        set II = GetUnitAbilityLevel(AttackerU,'A06O')
        if II > 0 then
            if GetUnitAbilityLevel(TriigerU,'B015') == 0 then
                set Bfirst = true
            else
                set Bfirst = false 
            endif
            call SetBuff(TriigerU,2,11)
            call PerodicDmg(AttackerU,TriigerU,10*II,0.5,1,8.01,'B015',Bfirst)
        endif

        //Incinerate
        set II = GetUnitAbilityLevel(AttackerU,'A06M')
        if II > 0 then
            if GetUnitAbilityLevel(TriigerU,'B014') > 0 then
                set Admg = II*5 + LoadInteger(HT,GetHandleId(TriigerU),-300001)
            else
                set Admg = II*5
            endif
            call SaveInteger(HT,GetHandleId(TriigerU),-300001, R2I(Admg))
            call SaveInteger(HT,GetHandleId(TriigerU),-300002,II*100)
            call SaveUnitHandle(HT,GetHandleId(TriigerU),-300003,AttackerU)
            call SaveInteger(HT,GetHandleId(TriigerU),-300004,Glob_time)
            call SetBuff(TriigerU,1,5)
            
            if GetEventDamage() > 0 then
                call BlzSetEventDamage(GetEventDamage()+Admg)
            endif
        
        endif
    endif
    
    //Frostbite of the Soul
    set II = GetUnitAbilityLevel(TriigerU,'A080')
    if II > 0 and IsHeroUnitId(GetUnitTypeId(AttackerU)) then
        if BlzGetUnitAbilityCooldownRemaining(TriigerU,'A080') <= 0 then
            call  AbilStartCD(TriigerU,'A080', 9)
            call AddCooldowns(AttackerU,0.95+I2R(II)*0.05)
            call MagicDamage(TriigerU,AttackerU,200*II, false)
            call DestroyEffect( AddSpecialEffectTargetFix("Abilities\\Weapons\\FrostWyrmMissile\\FrostWyrmMissile.mdl", AttackerU, "chest"))
        endif
    endif 
	
    //Mystical armor
	set II =  UnitHasItemI( TriigerU,'I06E' )
    if  II > 0  then
        if GetRandomReal(1,100)  <= II*8*luck then
        
         if GetUnitState(TriigerU,UNIT_STATE_MANA) >= 750 then
            call CastRandomSpell1 (TriigerU,GetRandomAbility1_B(),15, AttackerU,GetUnitX(AttackerU),GetUnitY(AttackerU))
            call SetUnitState(TriigerU,UNIT_STATE_MANA,GetUnitState(TriigerU,UNIT_STATE_MANA)-750 )
         endif
        endif
    endif

	set GUS = null
	set GUT = null
	set TriigerU = null
	set AttackerU = null
endfunction

//===========================================================================
function InitTrig_Damage_Controller_Before takes nothing returns nothing
    set gg_trg_Damage_Controller_Before = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_Damage_Controller_Before, EVENT_PLAYER_UNIT_DAMAGING)
    call TriggerAddAction( gg_trg_Damage_Controller_Before, function Trig_Damage_Controller_Before_Actions )
endfunction
