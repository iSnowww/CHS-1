library ChaosRune requires ChaosMagic
    globals
        group GL_GR = CreateGroup()
        boolexpr RuneOfChaos_b
        integer GLOB_LVL_abil = 0
        integer unitsHit
        boolexpr BOOLEXPR_TRUE = null
    endglobals


    function CastRuneOfChaos takes unit u returns boolean
        
        if IsUnitEnemy(GLOB_RUNE_U,GetOwningPlayer(u)) and GetWidgetLife(u) > 0.405 then
            set RandomSpellLoc = Location(GetUnitX(u), GetUnitY(u))
            call CastRandomSpell(GLOB_RUNE_U, 0, u, RandomSpellLoc, false, GLOB_LVL_abil)
            call RemoveLocation(RandomSpellLoc)
            set RandomSpellLoc = null
        endif
            
        call GroupRemoveUnit(GL_GR, u)
        return false
    endfunction

    function RuneOfChaos takes nothing returns boolean
        local unit u = GLOB_RUNE_U
        local real power = GLOB_RUNE_POWER 
        local integer lvl = 10 + R2I((power - 1)* 10)
        local integer lp = 0
        local integer i = 0
        if lvl > 30 then
            set lp = (lp + lvl - 30)/ 3
            set lvl = 30
        endif
        
        loop
            set GLOB_LVL_abil = lvl
            call GroupClear(GL_GR)
            call EnumTargettableUnitsInRange(GL_GR, GetUnitX(u), GetUnitY(u), 400 + 75 * power, GetOwningPlayer(u), false)
            call CastRuneOfChaos(BlzGroupUnitAt(GL_GR, GetRandomInt(0, BlzGroupGetSize(GL_GR))))
            call CastRuneOfChaos(BlzGroupUnitAt(GL_GR, GetRandomInt(0, BlzGroupGetSize(GL_GR))))
            call CastRuneOfChaos(BlzGroupUnitAt(GL_GR, GetRandomInt(0, BlzGroupGetSize(GL_GR))))
            set i = i + 1
            exitwhen i >= lp
        endloop

        set u = null
        return false
    endfunction
endlibrary