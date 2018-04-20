# Warder control for 1st raid target(s) on 2nd floor of vexthal

sub EVENT_SPAWN {
    quest::spawn2(158090,0,0,1736.1,-250.1,115.6,256);
    quest::spawn2(158090,0,0,1736.1,250.1,115.6,128);
    quest::spawn2(158090,0,0,1380.0,-55.0,233.1,192);
    my $x = $npc->GetX();
    my $y = $npc->GetY();
    # Set an extra large proximity so we get the player from way outside aggro radius.
    quest::set_proximity($x-260,$x+260,$y-260,$y+260);
}

sub EVENT_ENTER {
    quest::shout("You offend me $race");
    quest::shout("$name, you must engage me within 20 minutes or I will leave.");
    quest::settimer("FDvakelun",1200);
}

sub EVENT_COMBAT {
    quest::stoptimer("FDvakelun");
}

sub EVENT_TIMER {
    if($timer eq "FDvakelun") {
        quest::stoptimer("FDvakelun");
        quest::depop();
    }
}


sub EVENT_DEATH {
    quest::stoptimer("FDvakelun");
    quest::depopall(158090);
}

#End of File, Zone:vexthal  NPC:158309 -- #The_Fabled_Thall_Va_Kelun
