#The Overthere (overthere) >> Vaxxim_T`Quoren (93093)
#Free the Drogan Slaves

sub EVENT_SPAWN {
    if(!defined $qglobals{DroganSlave}) {
        quest::depop();
    }
    else {
        switch($qglobals{DroganSlave}) {
            case 1:
                quest::depop();
                break;
        }
    }
}

sub EVENT_SAY {
    if($text=~/hail/i) {
        quest::say("Greetings friend, it is good to be freed from the clutches of those evil creatures. Tell me are you willing to help me bring some [justice] to them?");
    }
    if($text=~/justice/i) {
        quest::say("For justice to be brought to them you will need to strike at some of the most powerful goblins found there. Go deep within the Temple of Droga and bring me back three drogan earth totems. Also I will need Gamolk's Ring of Spirit. Do this and you will be well rewarded.");
    }
}

sub EVENT_ITEM {
    if(plugin::check_handin(\%itemcount, 62095 => 1, 62094 => 3)) {
        quest::say("Excellent $name. Thank you for your assistance. Thank this as a token of my.... appreciation.");
        quest::summonitem(62203);
    }
}
