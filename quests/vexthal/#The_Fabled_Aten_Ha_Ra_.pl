# Fabled depopper
# Aggro radius is 60, so I set a larger proximity for the depop script.
# I made it resetable by using EVENT_EXIT.  Since it can take a long time to get to
# this fabled's spawn location, a timer was not a good solution.

sub EVENT_SPAWN {
    my $x = $npc->GetX();
    my $y = $npc->GetY();
    quest::set_proximity($x-90,$x+90,$y-100,$y+90);
}

sub EVENT_ENTER {
    quest::shout("You offend me $race");
    quest::shout("$name, you must engage me within 10 minutes or I will leave.");
    quest::settimer("FDatenha",600);
}

sub EVENT_EXIT {
   quest::stoptimer("FDatenha");
   quest::shout("Run away then, I can wait.");
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

