# Warder control for first raid target on 1st floor of vexthal

sub EVENT_SPAWN {
    quest::spawn2(158087,0,0,626.0,256.0,6.25,172);
    quest::spawn2(158087,0,0,626.0,-256.0,6.25,209);
    quest::spawn2(158087,0,0,1314.8,85.0,233.1,192);
    my $x = $npc->GetX();
    my $y = $npc->GetY();
    # Set an extra large proximity so we get the player from way outside aggro radius.
    quest::set_proximity($x-200,$x+200,$y-200,$y+200);
}

sub EVENT_ENTER {
    quest::shout("You offend me $race");
    quest::shout("$name, you must engage me within 10 minutes or I will leave.");
    quest::settimer("FDkaas",600);
}

sub EVENT_COMBAT {
    quest::stoptimer("FDkaas");
}

sub EVENT_TIMER {
    if($timer eq "FDkaas") {
        quest::stoptimer("FDkaas");
        quest::depop();
    }
}

sub EVENT_DEATH {
    quest::stoptimer("FDkaas");
    quest::depopall(158087);
}

#End of File, Zone:vexthal  NPC:158307 -- #The_Fabled_Kaas_Thox_Xi_Ans_Dyek
