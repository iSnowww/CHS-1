//! import "C:\CHS\CHS\Trigger\01-Libraries\1-AbilityData.j"
//! import "C:\CHS\CHS\Trigger\01-Libraries\1-RandomShit.j"
//! import "C:\CHS\CHS\Trigger\01-Libraries\2-InitAbilities.j"
//! import "C:\CHS\CHS\Trigger\01-Libraries\3-Quest.j"
//! import "C:\CHS\CHS\Trigger\01-Libraries\4-NewTable.j"
//! import "C:\CHS\CHS\Trigger\01-Libraries\5-PlayerInfo.j"
//! import "C:\CHS\CHS\Trigger\01-Libraries\Absolutes.j"
//! import "C:\CHS\CHS\Trigger\01-Libraries\Alloc.j"
//! import "C:\CHS\CHS\Trigger\01-Libraries\AllowAbilityCheck.j"
//! import "C:\CHS\CHS\Trigger\01-Libraries\BigNum.j"
//! import "C:\CHS\CHS\Trigger\01-Libraries\Command.j"
//! import "C:\CHS\CHS\Trigger\01-Libraries\DamageEngine.j"
//! import "C:\CHS\CHS\Trigger\01-Libraries\DamageOverTimeSpells.j"
//! import "C:\CHS\CHS\Trigger\01-Libraries\DelayedPrinter.j"
//! import "C:\CHS\CHS\Trigger\01-Libraries\DummyId.j"
//! import "C:\CHS\CHS\Trigger\01-Libraries\ErrorMessage.j"
//! import "C:\CHS\CHS\Trigger\01-Libraries\FileIO.j"
//! import "C:\CHS\CHS\Trigger\01-Libraries\GroupUtils.j"
//! import "C:\CHS\CHS\Trigger\01-Libraries\HeroLvlTable.j"
//! import "C:\CHS\CHS\Trigger\01-Libraries\IdLibrary.j"
//! import "C:\CHS\CHS\Trigger\01-Libraries\ListT.j"
//! import "C:\CHS\CHS\Trigger\01-Libraries\Math.j"
//! import "C:\CHS\CHS\Trigger\01-Libraries\MathRound.j"
//! import "C:\CHS\CHS\Trigger\01-Libraries\NewBonus.j"
//! import "C:\CHS\CHS\Trigger\01-Libraries\OrderIds.j"
//! import "C:\CHS\CHS\Trigger\01-Libraries\PlayerUtils.j"
//! import "C:\CHS\CHS\Trigger\01-Libraries\RecycleUnit.j"
//! import "C:\CHS\CHS\Trigger\01-Libraries\SellItem.j"
//! import "C:\CHS\CHS\Trigger\01-Libraries\SpellFormula.j"
//! import "C:\CHS\CHS\Trigger\01-Libraries\StableSpells.j"
//! import "C:\CHS\CHS\Trigger\01-Libraries\StaticQueue.j"
//! import "C:\CHS\CHS\Trigger\01-Libraries\StringFunctions.j"
//! import "C:\CHS\CHS\Trigger\01-Libraries\StringHashEx.j"
//! import "C:\CHS\CHS\Trigger\01-Libraries\StructRecycleModule.j"
//! import "C:\CHS\CHS\Trigger\01-Libraries\SummonSpells.j"
//! import "C:\CHS\CHS\Trigger\01-Libraries\T32.j"
//! import "C:\CHS\CHS\Trigger\01-Libraries\TempStateBonus.j"
//! import "C:\CHS\CHS\Trigger\01-Libraries\Terrain_Pathability.j"
//! import "C:\CHS\CHS\Trigger\01-Libraries\TimerUtils.j"
//! import "C:\CHS\CHS\Trigger\01-Libraries\Utility.j"
//! import "C:\CHS\CHS\Trigger\02-description\1-AbilDis.j"
//! import "C:\CHS\CHS\Trigger\02-description\2-InitDescription.j"
//! import "C:\CHS\CHS\Trigger\02-description\3-FunctionDes.j"
//! import "C:\CHS\CHS\Trigger\03-FixFunction\1-Debug.j"
//! import "C:\CHS\CHS\Trigger\03-FixFunction\2-Fix.j"
//! import "C:\CHS\CHS\Trigger\04-Buffs\1-Damage.j"
//! import "C:\CHS\CHS\Trigger\04-Buffs\2-BuffSys.j"
//! import "C:\CHS\CHS\Trigger\04-Buffs\3-PereodicDmg.j"
//! import "C:\CHS\CHS\Trigger\04-Buffs\4-InitInfoBuffs.j"
//! import "C:\CHS\CHS\Trigger\06-channel\1-Order.j"
//! import "C:\CHS\CHS\Trigger\07-Init\1-CustomState.j"
//! import "C:\CHS\CHS\Trigger\07-Init\2-Variable.j"
//! import "C:\CHS\CHS\Trigger\07-Init\3-UnitStateSys.j"
//! import "C:\CHS\CHS\Trigger\08-Fun\1-VampirsmController.j"
//! import "C:\CHS\CHS\Trigger\08-Fun\2-Multi.j"
//! import "C:\CHS\CHS\Trigger\08-Fun\3-AOE DMG.j"
//! import "C:\CHS\CHS\Trigger\08-Fun\5-Functions.j"
//! import "C:\CHS\CHS\Trigger\08-Fun\Glory.j"
//! import "C:\CHS\CHS\Trigger\09-SpellStart\1-StartFunction.j"
//! import "C:\CHS\CHS\Trigger\10-Tome\1-Toms.j"
//! import "C:\CHS\CHS\Trigger\11-Heros\Blademaster.j"
//! import "C:\CHS\CHS\Trigger\11-Heros\Dark Avatar.j"
//! import "C:\CHS\CHS\Trigger\11-Heros\FixDeath.j"
//! import "C:\CHS\CHS\Trigger\11-Heros\NagaSiren.j"
//! import "C:\CHS\CHS\Trigger\11-Heros\PandaSkin.j"
//! import "C:\CHS\CHS\Trigger\11-Heros\Pyromancer.j"
//! import "C:\CHS\CHS\Trigger\11-Heros\SkeletonBrute.j"
//! import "C:\CHS\CHS\Trigger\11-Heros\SpiritTauren.j"
//! import "C:\CHS\CHS\Trigger\11-Heros\Thunder Witch.j"
//! import "C:\CHS\CHS\Trigger\11-Heros\UrsaWarrior.j"
//! import "C:\CHS\CHS\Trigger\11-Heros\Witch Doctor.j"
//! import "C:\CHS\CHS\Trigger\11-Heros\WolfRider.j"
//! import "C:\CHS\CHS\Trigger\11-Heros\Xesil.j"
//! import "C:\CHS\CHS\Trigger\13-Frame\3-bonus1.j"
//! import "C:\CHS\CHS\Trigger\13-Frame\4-Init.j"
//! import "C:\CHS\CHS\Trigger\13-Frame\5-UpdateFrame.j"
//! import "C:\CHS\CHS\Trigger\13-Frame\MousehoverInfo.j"
//! import "C:\CHS\CHS\Trigger\13-Frame\UnitInfo.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\04-Cooldown.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\06-FixUnit.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\07-InitHash.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\13-InitData.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\15-HeroLvl.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\BuildStorage.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\CreepDeath.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\DeathInvul.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\Hotkeys.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\LevelUpStats.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\PvpSuddenDeathTimerWindow.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\SuddenDeathTimerWindow.j"
//! import "C:\CHS\CHS\Trigger\17-Elements\1-ElementStartAbility.j"
//! import "C:\CHS\CHS\Trigger\17-Elements\2-InitElements.j"
//! import "C:\CHS\CHS\Trigger\18-Rune\3-RuneState.j"
//! import "C:\CHS\CHS\Trigger\18-Rune\4-RuneEvent.j"
//! import "C:\CHS\CHS\Trigger\18-Rune\6-InitRune.j"
//! import "C:\CHS\CHS\Trigger\18-Rune\7-InitRuneTrigger.j"
//! import "C:\CHS\CHS\Trigger\19-Spell Effectiveness\1-InitBoolx.j"
//! import "C:\CHS\CHS\Trigger\19-Spell Effectiveness\2-EffectInit.j"
//! import "C:\CHS\CHS\Trigger\20-Commands\DebugCommand.j"
//! import "C:\CHS\CHS\Trigger\20-Commands\LoadCommand.j"
//! import "C:\CHS\CHS\Trigger\20-Commands\SaveCommand.j"
//! import "C:\CHS\CHS\Trigger\21-SaveCode\DebugCode.j"
//! import "C:\CHS\CHS\Trigger\21-SaveCode\PlayerTracking.j"
//! import "C:\CHS\CHS\Trigger\21-SaveCode\SaveCore.j"
//! import "C:\CHS\CHS\Trigger\21-SaveCode\SaveFile.j"
//! import "C:\CHS\CHS\Trigger\21-SaveCode\SaveHelperLib.j"
//! import "C:\CHS\CHS\Trigger\21-SaveCode\SaveSystem.j"
//! import "C:\CHS\CHS\Trigger\21-SaveCode\SyncHelper.j"
//! import "C:\CHS\CHS\Trigger\Draft Mode\DisabledSpells.j"
//! import "C:\CHS\CHS\Trigger\Draft Mode\EconomicSpellIndex.j"
//! import "C:\CHS\CHS\Trigger\Draft Mode\Functions.j"
//! import "C:\CHS\CHS\Trigger\Draft Mode\OnDraftBuy.j"
//! import "C:\CHS\CHS\Trigger\11-Heros\1-Lich\1-Event lich.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\01-Items\1-Full Restore.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\01-Items\1-ItemBonus.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\01-Items\ArenaRing.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\01-Items\EndOfRoundItem.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\01-Items\ItemDrop.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\Duels\PvpRoundRobin.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\Duels\RoundRobinTest.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\main-init.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\shared-library.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\1-Spell Lib\2-SpellDataTable.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\1-Spell Lib\3-RandomAbilityData.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\1-Spell Lib\6-AbsoluteAbilityLevelup.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\1-Spell Lib\7-PhoenixProccCheck.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\1-Spell Lib\8-Timer Functions.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\1-Spell Lib\BuffLevel.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\1-Spell Lib\CastSpellOnTarget.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\1-Spell Lib\DelayedBuffRemoval.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\1-Spell Lib\DummyActiveSpell.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\1-Spell Lib\DummyOrder.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\1-Spell Lib\EditAbilityInfo.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\1-Spell Lib\FxCooldown.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\1-Spell Lib\GetRandomUnit.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\1-Spell Lib\GetSpellType.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\1-Spell Lib\Knockback.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\1-Spell Lib\KnockbackHelper.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\1-Spell Lib\LastSpellLearned.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\1-Spell Lib\Lightning.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\1-Spell Lib\TempBuff.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\1-Spell Lib\ToggleAbility.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\1-Spell Lib\UnitHelpers.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\3-Spell Effects\1-AttackController.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\3-Spell Effects\2-ShortPeriodCheck.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\3-Spell Effects\3-LongPeriodCheck.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\3-Spell Effects\4-Killing.j"
//! import "C:\CHS\CHS\Trigger\18-Rune\2-item\1-RuneCast.j"
//! import "C:\CHS\CHS\Trigger\18-Rune\2-item\2-MyRune.j"
//! import "C:\CHS\CHS\Trigger\18-Rune\5-RuneItem\01-RuneOfAttack.j"
//! import "C:\CHS\CHS\Trigger\18-Rune\5-RuneItem\02-RuneOfEarth.j"
//! import "C:\CHS\CHS\Trigger\18-Rune\5-RuneItem\03-RuneOfPower.j"
//! import "C:\CHS\CHS\Trigger\18-Rune\5-RuneItem\04-RuneOfHealing.j"
//! import "C:\CHS\CHS\Trigger\18-Rune\5-RuneItem\05-RuneOfLife.j"
//! import "C:\CHS\CHS\Trigger\18-Rune\5-RuneItem\06-RuneOfMagic.j"
//! import "C:\CHS\CHS\Trigger\18-Rune\5-RuneItem\07-RuneOfFire.j"
//! import "C:\CHS\CHS\Trigger\18-Rune\5-RuneItem\08-RuneOfChaos.j"
//! import "C:\CHS\CHS\Trigger\18-Rune\5-RuneItem\09-RuneOfStorm.j"
//! import "C:\CHS\CHS\Trigger\18-Rune\5-RuneItem\10-RuneOfAir.j"
//! import "C:\CHS\CHS\Trigger\18-Rune\5-RuneItem\BloodRune.j"
//! import "C:\CHS\CHS\Trigger\18-Rune\5-RuneItem\DarkRune.j"
//! import "C:\CHS\CHS\Trigger\18-Rune\5-RuneItem\LightRune.j"
//! import "C:\CHS\CHS\Trigger\18-Rune\5-RuneItem\PoisonRune.j"
//! import "C:\CHS\CHS\Trigger\18-Rune\5-RuneItem\RuneOfMight.j"
//! import "C:\CHS\CHS\Trigger\18-Rune\5-RuneItem\WildRune.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Commands\CameraCommand.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Commands\ClearCommand.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Commands\DebugCommands.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Commands\DisableBets.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Commands\Hints.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Commands\NoIncomeText.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Commands\PlaytimeCommand.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Commands\SantaHat.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Commands\ShowDamageTextCommand.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Commands\ToggleFxCommand.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Commands\trigger130.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Commands\Votekick.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Items\ShopIndex.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Items\trigger93.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Items\trigger94.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Items\trigger95.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Items\trigger96.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\1-Abilities\04-Whirlwind.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\1-Abilities\06-Frost Bolt.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\1-Abilities\08-Sand Of Time.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\1-Abilities\09-Purge.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\1-Abilities\Avatar.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\1-Abilities\BattleRoar.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\1-Abilities\Blink Strike.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\1-Abilities\ColdArrow.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\1-Abilities\Cyclone.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\1-Abilities\Death Pact.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\1-Abilities\Dousing Hex.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\1-Abilities\Energy Lure.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\1-Abilities\Extradimensional Cooperation.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\1-Abilities\HolyLight.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\1-Abilities\Immolation.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\1-Abilities\Inner Fire.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\1-Abilities\Lightning Shield.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\1-Abilities\Magnetic Oscillation.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\1-Abilities\Mana Starvation.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\1-Abilities\MidasTouch.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\1-Abilities\Parasite.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\1-Abilities\Plague.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\1-Abilities\Searing Arrows.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\1-Abilities\SpiritLink.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\1-Abilities\UnlimitedAgony.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\2-Items\1-Urn.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\2-Items\Ancient Axe.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\2-Items\Ancient Dagger.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\2-Items\Ancient Staff.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\2-Items\AnkhOfReincarnation.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\2-Items\AntiMagicFlag.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\2-Items\BattleRunestone.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\2-Items\BlokkadesShield.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\2-Items\BoneArmor.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\2-Items\ChestOfGreed.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\2-Items\ConqBambooStick.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\2-Items\ContractOfTheLiving.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\2-Items\DecayingScythe.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\2-Items\DruidicFocus.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\2-Items\FlimsyToken.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\2-Items\GobletOfBlood.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\2-Items\HolyShield.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\2-Items\Lucky Pants.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\2-Items\MagicNecklace.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\2-Items\ManifoldStaff.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\2-Items\MaskOfProtection.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\2-Items\MaskOfVitality.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\2-Items\MithrilHelmet.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\2-Items\Moonstone.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\2-Items\MysteriousRunestone.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\2-Items\Non-Lucrative Tome.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\2-Items\Rune Mastery.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\2-Items\ScepterOfConfusion.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\2-Items\Scroll Of Transformation.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\2-Items\SpellbaneToken.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\2-Items\Staff of Lightning.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\2-Items\Staff Of Power.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\2-Items\VigourToken.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\2-Items\VolcanicArmor.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\2-Items\WisdomChestplate.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\3-General\1-Multicast.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Abilities\General\trigger11.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Abilities\General\trigger12.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Abilities\General\trigger13.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Abilities\General\trigger24.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Abilities\Summons\trigger03.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Abilities\Summons\trigger04.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Abilities\Summons\trigger17.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Abilities\Summons\trigger18.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Abilities\Summons\trigger19.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Abilities\Summons\trigger20.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Abilities\Summons\trigger21.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Abilities\Summons\trigger25.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Abilities\Summons\trigger30.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Abilities\Summons\trigger31.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Abilities\Summons\trigger32.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Abilities\Summons\trigger34.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Dialog\Death\trigger83.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Dialog\Death\trigger84.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Dialog\Placing Bets\trigger44.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Dialog\Placing Bets\trigger45.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Dialog\Placing Bets\trigger46.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Dialog\Placing Bets\trigger47.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Dialog\Placing Bets\trigger48.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Dialog\Placing Bets\trigger49.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Dialog\Placing Bets\trigger50.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Dialog\Placing Bets\trigger51.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Dialog\Placing Bets\trigger52.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Dialog\Placing Bets\trigger53.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Dialog\Placing Bets\trigger54.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Heroes\Hero Passives\trigger14.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Heroes\Hero Passives\trigger16.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Heroes\Hero Passives\trigger35.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Mechanics\Abilities\trigger36.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Mechanics\Creeps\trigger100.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Mechanics\Creeps\trigger101.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Mechanics\Creeps\trigger102.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Mechanics\Creeps\trigger103.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Mechanics\Creeps\trigger104.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Mechanics\Creeps\trigger98.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Mechanics\Creeps\trigger99.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Mechanics\Endgame\trigger118.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Mechanics\Endgame\trigger119.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Mechanics\Endgame\trigger122.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Mechanics\Endgame\trigger129.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Mechanics\General\trigger133.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Mechanics\General\trigger142.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Mechanics\General\trigger145.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Mechanics\General\trigger147.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Mechanics\General\trigger148.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Mechanics\General\trigger149.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Mechanics\General\trigger150.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Mechanics\General\trigger41.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Mechanics\Heroes\trigger82.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Mechanics\Initialization\AbilityUpgradeShop.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Mechanics\Initialization\trigger131.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Mechanics\Initialization\trigger143.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Mechanics\Initialization\trigger89.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Mechanics\Initialization\trigger90.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Mechanics\Initialization\trigger91.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Mechanics\Items\trigger144.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Mechanics\Items\trigger146.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Mechanics\Items\trigger38.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Mechanics\Items\trigger39.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Mechanics\Items\trigger40.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\1-Abilities\Absolutes\05-Absolute Cold.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\1-Abilities\Absolutes\AbsoluteArcane.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\1-Abilities\Absolutes\AbsolutePoison.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\1-Abilities\Chronus Abilities\BlessedProtection.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\1-Abilities\Chronus Abilities\CheaterMagic.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\1-Abilities\Chronus Abilities\Grunts Grunt.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\1-Abilities\Chronus Abilities\HeroBuff.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\1-Abilities\Chronus Abilities\TempInvis.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\1-Abilities\Chronus Abilities\TempPower.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\1-Abilities\General\ChannelingAbilities.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\1-Abilities\General\OnSpellCast.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\1-Abilities\General\Spell Effects.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\1-Abilities\Passive\01-Stone Protection.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\1-Abilities\Passive\02-Ancient Teaching.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\1-Abilities\Passive\03-Reset Time.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\1-Abilities\Passive\07-Martial Retribution.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\1-Abilities\Passive\11-Last Breath.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\1-Abilities\Passive\Ancient Blood.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\1-Abilities\Passive\Ancient Element.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\1-Abilities\Passive\Ancient Runes.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\1-Abilities\Passive\Arcane Assault.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\1-Abilities\Passive\Black Arrow.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\1-Abilities\Passive\Chaos Magic.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\1-Abilities\Passive\DivineBubble.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\1-Abilities\Passive\Learnability.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\1-Abilities\Passive\MartialTheft.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\1-Abilities\Passive\MegaSpeed.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\1-Abilities\Passive\MysteriousTalent.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\1-Abilities\Passive\NecromancerArmy.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\1-Abilities\Passive\RetaliationAura.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\1-Abilities\Passive\TimeManipulation.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\1-Abilities\Summons\Bear.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\1-Abilities\Summons\Black Arrow Melee Skeleton.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\1-Abilities\Summons\Black Arrow Ranged Skeleton.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\1-Abilities\Summons\Carrion Beetle.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\1-Abilities\Summons\ClockwerkGoblin.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\1-Abilities\Summons\Hawk.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\1-Abilities\Summons\Inferno.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\1-Abilities\Summons\LavaSpawn.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\1-Abilities\Summons\MountainGiant.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\1-Abilities\Summons\Parasite.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\1-Abilities\Summons\Phoenix.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\1-Abilities\Summons\PocketFactory.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\1-Abilities\Summons\Quilbeast.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\1-Abilities\Summons\SerpentWard.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\1-Abilities\Summons\Skeleton.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\1-Abilities\Summons\SpiritWolf.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\1-Abilities\Summons\WaterElemental.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\3-General\2-Damage System\0. CustomDamageTypes.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\3-General\2-Damage System\0. DamageEngineGlobals.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\3-General\2-Damage System\0. DamageEngineHelpers.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\3-General\2-Damage System\1. OnDamage.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\3-General\2-Damage System\2. ModifyDamageBeforeArmor.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\3-General\2-Damage System\2.a Crit.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\3-General\2-Damage System\2.b Evasion.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\3-General\2-Damage System\3. ModifyDamageAfterArmor.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\3-General\2-Damage System\4. LethalDamage.j"
//! import "C:\CHS\CHS\Trigger\16-Spells\2-Spell Code\3-General\2-Damage System\5. AfterDamage.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Dialog\Game Mode Selection\Ability Mode\trg0.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Dialog\Game Mode Selection\Ability Mode\trigger67.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Dialog\Game Mode Selection\Ability Mode\trigger68.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Dialog\Game Mode Selection\Ability Mode\trigger69.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Dialog\Game Mode Selection\After Selection\EconomyMode.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Dialog\Game Mode Selection\After Selection\trigger77.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Dialog\Game Mode Selection\Betting Mode\trigger62.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Dialog\Game Mode Selection\Betting Mode\trigger73.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Dialog\Game Mode Selection\Betting Mode\trigger74.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Dialog\Game Mode Selection\Betting Mode\trigger75.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Dialog\Game Mode Selection\Betting Mode\trigger76.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Dialog\Game Mode Selection\Game Mode\trigger59.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Dialog\Game Mode Selection\Game Mode\trigger60.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Dialog\Game Mode Selection\Game Mode\trigger61.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Dialog\Game Mode Selection\Game Mode\trigger63.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Dialog\Game Mode Selection\Game Mode\trigger64.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Dialog\Game Mode Selection\Game Mode\trigger65.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Dialog\Game Mode Selection\Game Mode\trigger66.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Dialog\Game Mode Selection\Hero Mode\trigger70.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Dialog\Game Mode Selection\Hero Mode\trigger71.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Dialog\Game Mode Selection\Hero Mode\trigger72.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Dialog\Game Mode Selection\Income Mode\EconomyModeSelect.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Dialog\Game Mode Selection\Income Mode\trg1.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Dialog\Game Mode Selection\Income Mode\trg2.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Dialog\Game Mode Selection\Income Mode\trg3.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Dialog\Game Mode Selection\Initialization\trigger55.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Dialog\Game Mode Selection\Initialization\trigger56.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Dialog\Game Mode Selection\Initialization\trigger57.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Dialog\Game Mode Selection\Initialization\trigger58.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Mechanics\Abilities\Learn and Unlearn\trigger111.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Mechanics\Abilities\Learn and Unlearn\trigger112.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Mechanics\Abilities\Learn and Unlearn\trigger113.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Mechanics\Abilities\Learn and Unlearn\trigger114.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Mechanics\Abilities\Learn and Unlearn\trigger115.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Mechanics\Heroes\Death\trigger80.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Mechanics\Heroes\Death\trigger81.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Mechanics\Heroes\Death\trigger85.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Mechanics\Heroes\Death\trigger86.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Mechanics\Heroes\Hero Selection\trigger121.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Mechanics\Heroes\Hero Selection\trigger78.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Mechanics\Heroes\Hero Selection\trigger79.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Mechanics\PVP\Battle Royal\trigger42.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Mechanics\PVP\Battle Royal\trigger43.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Mechanics\PVP\Duels\trigger134.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Mechanics\PVP\Duels\trigger135.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Mechanics\PVP\Duels\trigger136.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Mechanics\PVP\Duels\trigger137.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Mechanics\PVP\Duels\trigger138.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Mechanics\PVP\Duels\trigger139.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Mechanics\PVP\Duels\trigger140.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Mechanics\PVP\Duels\trigger141.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Mechanics\PVP\General\trigger117.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Mechanics\PVP\General\trigger151.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Mechanics\PVP\General\trigger152.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Mechanics\PVP\General\trigger153.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Mechanics\Rounds\General\trigger110.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Mechanics\Rounds\General\trigger116.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Mechanics\Rounds\Round End\EconomyCreepBonus.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Mechanics\Rounds\Round End\trigger105.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Mechanics\Rounds\Round End\trigger106.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Mechanics\Rounds\Round End\trigger107.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Mechanics\Rounds\Round End\trigger108.j"
//! import "C:\CHS\CHS\Trigger\15-triggers\init-parsed\Mechanics\Rounds\Round Start\trigger109.j"
