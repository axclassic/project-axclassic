# #Fabled_Reclusive_Ghoul_Magus (63097)
# Depopper script by patrikpatrik 4/13/2017
# Update 8/30/17 Timer stops if engaged and restarts on exit.

my $xx;
my $yy;

sub EVENT_SPAWN {
	$xx = $npc->GetX();
	$yy = $npc->GetY();
	quest::set_proximity($xx - 50, $xx + 50, $yy - 50, $yy + 50);
	quest::settimer("fabledmagus", 600); #will remain for 10 minutes
}

sub EVENT_COMBAT {
	if($npc->IsEngaged()) {
		quest::stoptimer("fabledmagus");
	}
    else {
		quest::settimer("fabledmagus", 600);
	}
}

sub EVENT_TIMER {
	if($timer eq "fabledmagus") {
        quest::stoptimer("fabledmagus");
		quest::depop();
	}
}
