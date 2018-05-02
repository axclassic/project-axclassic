# Fabled depopper
# Aggro radius is 60, so I set a larger proximity for the depop script.
# I made the proximity as small as possible, but since the zone floors are stacked
# on top of each other so close this script can be triggerd near the stairs on any floor
# so I made it resetable by using EVENT_EXIT.  Since it can take a long time to get to
# this fabled's spawn location, a timer was not a good solution.

sub EVENT_SPAWN {
    quest::spawn2(158090,0,0,1736.1,-250.1,115.6,256);
    quest::spawn2(158090,0,0,1736.1,250.1,115.6,128);
    quest::spawn2(158090,0,0,1380.0,-55.0,233.1,192);
    my $x = $npc->GetX();
    my $y = $npc->GetY();
    quest::set_proximity($x-80,$x+80,$y-80,$y+80);
}

sub EVENT_ENTER {
    quest::shout("You offend me $race");
    quest::shout("$name, you must engage me within 10 minutes or I will leave.");
    quest::settimer("FDvakelun",600);
}

sub EVENT_EXIT {
   quest::stoptimer("FDvakelun");
   quest::shout("Run away then coward, I can wait.");
}

sub EVENT_COMBAT {
    quest::stoptimer("FDvakelun");
}

sub EVENT_TIMER {
    if($timer eq "FDvakelun") {
        quest::stoptimer("FDvakelun");
        quest::spawn2(158008,0,0,1933,3,123,192);
        quest::depop();
    }
}


sub EVENT_DEATH {
    quest::stoptimer("FDvakelun");
    quest::depopall(158090);
}

#End of File, Zone:vexthal  NPC:158309 -- #The_Fabled_Thall_Va_Kelun
