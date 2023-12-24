#Firiona Vie (firiona) >> Gillia_Brissok (84115)
#Free the Drogan Slaves

sub EVENT_SPAWN {
    if(!defined $qglobals{DroganSlave}) {
        quest::depop();
    }
}

sub EVENT_SAY {
    if($text=~/Hail/i) {
        quest::say("'Greetings friend, it is good to be freed from the clutches of those evil creatures. Tell me are you willing to help me bring some justice to them?");
    }
    if($text=~/bring justice/i) {
        quest::say("For justice to be brought to them you will need to strike at some of the most powerful goblins found there. Seek out the goblin cave lords deep within the Temple of Droga and bring me back three Sashes of the Cave Lords. Also I will need the Earring of King Dronan. Do this and you will be well rewarded.");
    }
}

sub EVENT_ITEM {
    if(plugin::check_handin(\%itemcount, 62092 => 3, 62093 => 1)) {
        quest::say("Well done $name.");
        # Item: Copper Medal of Rapture
        quest::summonitem(62202);
    }
    else {
        quest::say("I don't need this.");
        plugin::return_items(\%itemcount);
    }
}

