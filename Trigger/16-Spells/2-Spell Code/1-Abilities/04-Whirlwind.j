library Whirlwind requires Utility, AoeDamage

    function CastWhirlwind takes unit caster, real x, real y, integer lvl returns nothing
        call AddSpecialEffectTimer( "war3mapImported\\SpinFX2.mdx", GetUnitX(caster), GetUnitY(caster), 0.5, true)
        call AreaDamage(caster, GetUnitX(caster), GetUnitY(caster), RMaxBJ(GetUnitDamage(caster, 0), 50 * lvl), 500, false, 'A025')
    endfunction
endlibrary