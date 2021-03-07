sub EVENT_SPAWN {
    my $locX = $npc->GetX();
    my $locY = $npc->GetY();
    quest::set_proximity($locX - 200, $locX + 200, $locY - 200, $locY + 200);
}

sub EVENT_ENTER {
    if(defined $qglobals{"EpicBox"} == 1) {
        quest::spawn2(202385,0,0,918.5,-50.3,387,25);
        quest::spawn2(202384,0,0,944.5,-58.3,387,0.8);
        quest::spawn2(202386,0,0,914.9,53.6,387,107.1);
        quest::spawn2(202387,0,0,944.1,59.1,387,127.4);
    }
}


sub EVENT_EXIT {    
    quest::depop(202385);
    quest::depop(202384);
    quest::depop(202386);
    quest::depop(202387);
}   