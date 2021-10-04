library PoisonRune initializer init requires RandomShit

    globals
        Table PoisonRuneBonus
    endglobals

    struct PoisonRuneDuration extends array
        integer pid
        integer level
        integer endTick
    
        private static integer instanceCount = 0
        private static thistype recycle = 0
        private thistype recycleNext

    
        private method periodic takes nothing returns nothing
            if T32_Tick > this.endTick then
                call this.stopPeriodic()
                call this.destroy()
            endif
        endmethod  
    
        static method create takes integer pid, integer level returns thistype
            local thistype this
    
            if (recycle == 0) then
                set instanceCount = instanceCount + 1
                set this = instanceCount
            else
                set this = recycle
                set recycle = recycle.recycleNext
            endif

            set this.pid = pid
            set this.level = level

            set this.endTick = T32_Tick + R2I(10 * 32)
            call this.startPeriodic()
            return this
        endmethod
        
        method destroy takes nothing returns nothing
            set PoisonRuneBonus[this.pid] = PoisonRuneBonus[this.pid] - this.level
            set recycleNext = recycle
            set recycle = this
        endmethod
    
        implement T32x
    endstruct

    function PoisonRune takes nothing returns boolean
        local integer pid = GetPlayerId(GetOwningPlayer(GLOB_RUNE_U))
        local real power = GLOB_RUNE_POWER * 100
        local integer levels = R2I(power / 20) + 1

        set PoisonRuneBonus[pid] = PoisonRuneBonus[pid] + levels
        call PoisonRuneDuration.create(pid, levels)
        return false
    endfunction

    private function init takes nothing returns nothing
        set PoisonRuneBonus = Table.create()
    endfunction
endlibrary