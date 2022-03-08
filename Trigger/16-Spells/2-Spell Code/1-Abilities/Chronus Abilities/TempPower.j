library TempPower initializer init requires BuffLevel, RandomShit, TimeManipulation

    globals
        Table TpStruct
    endglobals

    function GetTpStruct takes integer id returns TempPowerStruct
        return TpStruct[id]
    endfunction

    struct TempPowerStruct extends array
        unit source
        integer endTick
        integer bonus1
        integer bonus2
        boolean enabled
    
        private method periodic takes nothing returns nothing
            if this.enabled == false or T32_Tick > this.endTick or HasPlayerFinishedLevel(this.source, GetOwningPlayer(this.source)) or not UnitAlive(this.source) then
                call this.stopPeriodic()
                call this.destroy()
            endif
        endmethod  
    
        static method create takes unit source, real duration returns thistype
            local thistype this = thistype.setup()
            
            set this.source = source
            set this.bonus1 = R2I(40 * GetUnitAbilityLevel(this.source, TEMPORARY_POWER_ABILITY_ID)*(1 + 0.02 * GetHeroLevel(this.source)))
            set this.bonus2 = R2I(10 * GetUnitAbilityLevel(this.source, TEMPORARY_POWER_ABILITY_ID)*(1 + 0.02 * GetHeroLevel(this.source)))
            set this.enabled = true

            call SetHeroStr(this.source, GetHeroStr(this.source, false) + this.bonus1, false)
            call SetHeroAgi(this.source, GetHeroAgi(this.source, false) + this.bonus1, false)
            call SetHeroInt(this.source, GetHeroInt(this.source, false) + this.bonus1, false)

            call SetHeroStat(this.source, GetHeroPrimaryStat(this.source), GetHeroStatBJ(GetHeroPrimaryStat(this.source), this.source, false) + this.bonus2)
            call ElemFuncStart(this.source,TEMPORARY_POWER_ABILITY_ID)
            set this.endTick = T32_Tick + R2I(duration * 32)
            call this.startPeriodic()
            return this
        endmethod
        
        method destroy takes nothing returns nothing
            call SetHeroStr(this.source, GetHeroStr(this.source, false) - this.bonus1, false)
            call SetHeroAgi(this.source, GetHeroAgi(this.source, false) - this.bonus1, false)
            call SetHeroInt(this.source, GetHeroInt(this.source, false) - this.bonus1, false)
            call SetHeroStat(this.source, GetHeroPrimaryStat(this.source), GetHeroStatBJ(GetHeroPrimaryStat(this.source), this.source, false) - this.bonus2)
            set this.source = null
            call this.recycle()
        endmethod
    
        implement T32x
        implement Recycle
    endstruct

    function TempPowerCast takes unit u, real duration returns nothing
        if GetTpStruct(GetHandleId(u)) == 0 then
            set TpStruct[GetHandleId(u)] = TempPowerStruct.create(u, duration)
        else
            set GetTpStruct(GetHandleId(u)).enabled = false
            set TpStruct[GetHandleId(u)] = TempPowerStruct.create(u, duration)
        endif
    endfunction

    private function init takes nothing returns nothing
        set TpStruct = Table.create()
    endfunction
endlibrary