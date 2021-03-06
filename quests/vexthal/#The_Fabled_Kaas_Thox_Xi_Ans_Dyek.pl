# Fabled depopper
# Aggro radius is 60, so I set a larger proximity for the depop script.
# I made it resetable by using EVENT_EXIT.  Since it can take a long time to get to
# this fabled's spawn location, a timer was not a good solution.

sub EVENT_SPAWN {
    quest::spawn2(158087,0,0,626.0,256.0,6.25,172);
    quest::spawn2(158087,0,0,626.0,-256.0,6.25,209);
    quest::spawn2(158087,0,0,1314.8,85.0,233.1,192);
    my $x = $npc->GetX();
    my $y = $npc->GetY();
    quest::set_proximity($x-200,$x+200,$y-200,$y+200);
}

sub EVENT_ENTER {
    quest::shout("You offend me $race");
    quest::shout("$name, you must engage me within 10 minutes or I will leave.");
    quest::settimer("FDkaas",600);
}

sub EVENT_EXIT {
   quest::stoptimer("FDkaas");
   quest::shout("Run away then, I can wait.");
}

sub EVENT_COMBAT {
    quest::stoptimer("FDkaas");
}

sub EVENT_TIMER {
    if($timer eq "FDkaas") {
        quest::stoptimer("FDkaas");
        quest::spawn2(158013,0,0,957,0,13,192);
        quest::depop();
    }
}

sub EVENT_DEATH {
    quest::stoptimer("FDkaas");
    quest::depopall(158087);
}

#End of File, Zone:vexthal  NPC:158307 -- #The_Fabled_Kaas_Thox_Xi_Ans_Dyek
