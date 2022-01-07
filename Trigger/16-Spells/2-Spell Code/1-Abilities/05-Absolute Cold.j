library AbsoluteCold requires RandomShit, DivineBubble
    globals
        unit GLOB_ABSOLUTE_COLD_U = null
        real GLOB_ABSOLUTE_COLD_DMG = 0
    endglobals

    function AbsoluteIceFunc takes nothing returns boolean
        if IsUnitEnemy(GLOB_ABSOLUTE_COLD_U,GetOwningPlayer(GetFilterUnit())) and IsUnitSpellTargetCheck(GetFilterUnit(), GetOwningPlayer(GLOB_ABSOLUTE_COLD_U)) and IsUnitDivineBubbled(GetFilterUnit()) == false then
            call UsOrderU2(GLOB_ABSOLUTE_COLD_U,GetFilterUnit(),GetUnitX(GLOB_ABSOLUTE_COLD_U),GetUnitY(GLOB_ABSOLUTE_COLD_U),'A07W',"entanglingroots",GLOB_ABSOLUTE_COLD_DMG,1.0001,ABILITY_RLF_DAMAGE_PER_SECOND_EER1,ABILITY_RLF_DURATION_NORMAL)        
        endif
        return false
    endfunction

    function AbsoluteCold takes unit u,real dmg returns boolean
        set GLOB_ABSOLUTE_COLD_U = u 
        set GLOB_ABSOLUTE_COLD_DMG = dmg
        call GroupClear(ENUM_GROUP)
        call GroupEnumUnitsInArea(ENUM_GROUP, GetUnitX(u), GetUnitY(u), 500, AbsoluteIceFuncBool)
        return false
    endfunction

    function AbsoluteColdFunc takes nothing returns boolean
        if IsUnitEnemy(GLOB_ABSOLUTE_COLD_U,GetOwningPlayer(GetFilterUnit())) and IsHeroUnitId(GetUnitTypeId(GetFilterUnit())) and IsUnitSpellTargetCheck(GetFilterUnit(), GetOwningPlayer(GLOB_ABSOLUTE_COLD_U)) and IsUnitDivineBubbled(GetFilterUnit()) == false then
            call AddCooldowns(GetFilterUnit(),0.2)
        endif
        return false
    endfunction

    function AbsoluteColdCooldown takes unit u returns boolean
        set GLOB_ABSOLUTE_COLD_U = u 
        call GroupClear(ENUM_GROUP)
        call GroupEnumUnitsInArea(ENUM_GROUP,GetUnitX(u),GetUnitY(u),500,AbsoluteColdBool )
        return false
    endfunction
endlibrary