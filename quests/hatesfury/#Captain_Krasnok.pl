sub EVENT_DEATH { 
    quest::signalwith(228114,333,1000); #bleeding_spell
    quest::signalwith(228115,333,1000); #drowning_spell
    quest::signalwith(228116,333,1000); #hate_spell
    quest::signalwith(228117,333,1000); #languish_spell
    quest::signalwith(228118,333,1000); #spell_target
    quest::signalwith(228122,66,4000); #Fist_of_Krasnok
}    

sub EVENT_SIGNAL {
    if($signal == 66) {
        quest::depop();
    }
}
