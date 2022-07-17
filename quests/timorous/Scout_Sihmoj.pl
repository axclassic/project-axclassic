# Scout_Sihmoj (96078)

sub EVENT_SAY {
    if(!defined $qglobals{"Beastone"} && $text=~/hail/i) {
        quest::say("Greetings friend, please show me the Seal of Elder Dumul and I will brief you on the situation.");
    }
    if($text=~/hail/i && $qglobals{"Beastone"} == 1) {
        quest::say("Very well....");
        quest::emote(' waves his arms like a crazy person but in the distance you sense Draz Nurakks images');
        quest::spawn2(96322,0,0,1988,-9203,10,27);
        quest::spawn2(96322,0,0,1995,-9219,10,7.6);
        quest::spawn2(96322,0,0,2013,-9198,10,132.9);
        quest::spawn2(96322,0,0,1990,-9179,10,111.8);
        quest::spawn2(96322,0,0,1965,-9202,11,58.1);
        quest::spawn2(96322,0,0,2001,-9181,10,149.8);       
    }
}

sub EVENT_ITEM {
    if(plugin::check_handin(\%itemcount, 9045 =>1 )) {
        quest::say("Good to see you, now keep your head down friend. He may look out here at any moment, though he's been asleep most of the day. He's been staying in a ruined building on that island over there. I'm sure you can see it from here. You should be able to surprise him with little trouble. Just take care to avoid any traps he may have set. He's proven to be a very capable magic-user.");
        quest::say("When you finish with him, please bring any evidence of his being dispatched back to me in this bag. I'll direct you from there. Good luck... I'll watch from here.");
        quest::say("If you dont collect enough items to fill the bag return to me with what you have, with Draz Nurakk defeated I can use the same magic as he and resummon a few more images.");
        quest::summonitem(17360);
        quest::spawn2(96328,0,0,1988,-9203,10,27);
        quest::setglobal("Beastone", 1, 5, "F");
    }
    if(plugin::check_handin(\%itemcount, 9047 =>1 )) {
        quest::say("I knew that this creature had power, but how do you explain this? That fight was well beyond my comprehension. I'm not sure what to do other than have you return the bag to Elder Dumul. I'm sure that he will know what to do next. Take care and be swift.");
        quest::summonitem(9048);
        quest::delglobal("Beastone");
    }
    plugin::return_items(\%itemcount);
}

