library Evasion requires CustomState, RandomShit, LuckyPants

    function EvasionCheck takes unit damageSource, real originalDamage, real returnDamage returns real
        local real percentage = (1 - (returnDamage / originalDamage)) * 100
        local texttag tx = CreateTextTag()

        if returnDamage != originalDamage then
            call SetTextTagText(tx,R2SW(percentage, 1, 0) + "%% miss", TEXT_SIZE)
        else
            call SetTextTagText(tx, "miss", TEXT_SIZE)
            set returnDamage = 0
            call BlzSetEventWeaponType(WEAPON_TYPE_WHOKNOWS)
        endif
        call SetTextTagPosUnit(tx, damageSource, - 15)
        call SetTextTagColor(tx, 255, 0, 0, 255)
        call SetTextTagLifespan(tx, 1.5)
        call SetTextTagFadepoint(tx, 1.2)
        call SetTextTagVelocity(tx, 0.0, 0.0355)
        call SetTextTagPermanent(tx, false)

        set tx = null
        return returnDamage
    endfunction

    function Evade takes unit damageSource, unit damageTarget, real damage returns real
        local real returnDamage = damage
        local integer abilLvl = 0

        if GetUnitMissChance(damageSource) > 0 and GetRandomReal(0, 100) > GetUnitMissChance(damageSource) then
            return damage
        endif

        if GetUnitAbilityLevel(damageSource, 'B027') > 0 then
            if GetRandomReal(0, 100) > GetHeroLevel(udg_units01[ScorchedEarthSource[GetHandleId(damageSource)] + 1]) * 0.5 then
                return damage
            endif
        endif

        if GetUnitEvasion(damageTarget) > 0 and GetRandomReal(0, 100) > GetUnitRealEvade(damageTarget) * 100 then
            return damage
        else
            //Lucky Pants
            if UnitHasItemS(damageTarget, LUCKY_PANTS_ITEM_ID) then
                call ActivateLuckyPants(damageTarget)
            endif

            //Trickster
            if GetUnitTypeId(damageTarget) == SATYR_TRICKSTER_UNIT_ID then
                //set TypeDmg_b = 2
                //set DamageIsAttack = true
                //set GLOB_typeDmg = 2
                //set udg_NextDamageIsAttack = true
                set udg_NextDamageType = DamageType_Onhit
                set udg_NextDamageAbilitySource = SATYR_TRICKSTER_UNIT_ID
                call Damage.applyAttack(damageTarget, damageSource, GetAttackDamage(damageTarget) * 1 + (0.02 * GetHeroLevel(damageTarget)), false, ATTACK_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS)
            endif
        endif

        //Trueshot aura
        set abilLvl = GetUnitAbilityLevel(damageSource, TRUESHOT_AURA_ABILITY_ID)
        if abilLvl > 0 then
            set returnDamage = returnDamage * (0.005 * abilLvl)
            set DamageIsTrue = true
        endif

        return EvasionCheck(damageSource, damage, returnDamage)
    endfunction
endlibrary