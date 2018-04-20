sub EVENT_SPAWN {
    my $x = $npc->GetX();
    my $y = $npc->GetY();
    # Set an extra large proximity so we get the player from way outside aggro radius.
    quest::set_proximity($x-245,$x+245,$y-245,$y+245);
}

sub EVENT_ENTER {
    quest::shout("You offend me $race");
    quest::shout("$name, you must engage me within 10 minutes or I will leave.");
    quest::settimer("FDatenha",600);
}

sub EVENT_COMBAT {
    quest::stoptimer("FDatenha");
}

sub EVENT_TIMER {
    if($timer eq "FDatenha") {
        quest::stoptimer("FDatenha");
        quest::stoptimer("atenha");
        quest::depop();
    }
}

sub EVENT_DEATH {
    quest::signalwith(158095,3); # #Aten_Trigger
    quest::stoptimer("atenha");
}
# #The_Fabled_Aten_Ha_Ra_ NPCID: 158311

