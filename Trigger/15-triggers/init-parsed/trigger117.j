library trigger117 initializer init requires RandomShit

    function Trig_Countdown_Conditions takes nothing returns boolean
        if(not Trig_Countdown_Func001C())then
            return false
        endif
        return true
    endfunction


    function Trig_Countdown_Actions takes nothing returns nothing
        call CreateTextTagLocBJ((I2S(udg_integer19)+ " ..."),udg_location01,0.00,40.00,100,I2R((udg_integer19 * 20)),I2R((udg_integer19 * 20)),0)
        call SetTextTagPermanentBJ(GetLastCreatedTextTag(),false)
        call SetTextTagFadepointBJ(GetLastCreatedTextTag(),0.80)
        call SetTextTagLifespanBJ(GetLastCreatedTextTag(),1.00)
        call PlaySoundBJ(udg_sound09)
        set udg_integer19 =(udg_integer19 - 1)
        call TriggerSleepAction(1.00)
        call ConditionalTriggerExecute(GetTriggeringTrigger())
    endfunction


    private function init takes nothing returns nothing
        set udg_trigger117 = CreateTrigger()
        call TriggerAddCondition(udg_trigger117,Condition(function Trig_Countdown_Conditions))
        call TriggerAddAction(udg_trigger117,function Trig_Countdown_Actions)
    endfunction


endlibrary