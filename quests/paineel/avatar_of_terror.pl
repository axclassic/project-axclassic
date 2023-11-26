# BeginFile paineel\#Avatar_of_Terror.pl
# Quest for Paineel - Avatar of Terror: Terror Forged Mask

sub EVENT_SPAWN {
    quest::settimer("TerrorShouting", 5);
    quest::settimer("TerrorDepop", 120); #Despawn after 2 minutes
}

sub EVENT_ITEM {
    if(plugin::check_handin(\%itemcount, 14106 => 1)) {
        #Mundane Mask
        quest::say("A desciple of Cazic-Thule! Take this forged item as a gift."); #Text made up
        quest::summonitem(14108); #Terror Forged Mask
        quest::faction("56","-50");        # Craftkeepers
        quest::faction("60","-50");        # Crimson Hands
        quest::faction("143","50");        # Heretics
        quest::faction("79","-50");        # Deepwater Knights
        quest::faction("112","-50");       # Gate Callers
        quest::exp(100000); 
        quest::stoptimer("TerrorShouting");
        quest::stoptimer("TerrorDepop");
        quest::depop();
    }
    plugin::returnitems(\%itemcount);
}

sub EVENT_TIMER {
    if($timer eq "TerrorShouting") {
        quest::shout("My time is short, make haste! I will forge one item for the faithful of our lord, Cazic-Thule."); #Need real text
    }
    if($timer eq "TerrorDepop") {
        quest::stoptimer("Shouting");
        quest::stoptimer("TerrorDepop");
        quest::depop();
    }
}
#END of FILE Zone:paineel  ID:????? -- Avatar of Terror
