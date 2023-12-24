#The Overthere (overthere) >> Vaxxim_T`Quoren (93093)
#Free the Drogan Slaves

sub EVENT_SPAWN {
    if(!defined $qglobals{DroganSlave}) {
        quest::depop();
    }
    else {
        switch($qglobals{DroganSlave}) {
            case 1:
            case 2:
                quest::depop();
                break;
        }
    }
}

sub EVENT_SAY {
    if($text=~/hail/i) {
        quest::say("The feeling of freedom is good indeed, greetings wanderer. Having escaped the clutches of the drogan goblins I desire for them to know the true meaning of fear. Will you help teach them the meaning of [fear]?");
    }
    if($text=~/fear/i) {
        quest::say("Very well head to the Temple of Droga and seek out the so called goblin bone depredators. Slaughter them until you have three Blades of the Depredator and bring those back. Also seek out the Jailor Maufan and bring back the Mark of Imprisonment. Do this and I shall reward you well.");
    }
}

sub EVENT_ITEM {
    if(plugin::check_handin(\%itemcount, 62097=> 1, 62096=> 3)) {
        quest::say("Well done $name.");
        quest::summonitem(62204);
    }
    else {
        quest::say("I don't need this.");
        plugin::return_items(\%itemcount);
    }
}

