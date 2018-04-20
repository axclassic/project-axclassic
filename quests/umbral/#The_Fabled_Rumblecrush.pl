sub EVENT_SPAWN {
    my $x = $npc->GetX();
    my $y = $npc->GetY();
    # Set an extra large proximity so we get the player from way outside aggro radius.
    quest::set_proximity($x-250,$x+250,$y-250,$y+250);
}

sub EVENT_ENTER {
    quest::shout("You offend me $race");
    quest::shout("$name, you must engage me within 10 minutes or I will leave.");
    quest::settimer("FDrumble",600);
}

sub EVENT_COMBAT {
    quest::stoptimer("FDrumble");
}

sub EVENT_TIMER {
    if($timer eq "FDrumble") {
        quest::stoptimer("FDrumble");
        quest::depop();
    }
}

sub EVENT_DEATH {
    quest::stoptimer("FDrumble");
}
# #The_Fabled_Rumblecrush NPCID: 176111

