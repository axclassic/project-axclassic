
sub EVENT_AGGRO {
	quest::say("Welcome to your final stand, mortals. You shall progress no farther!");
}

sub EVENT_SPAWN {
	quest::setnexthpevent(50);
	quest::settimer("vzek",1);
}

sub EVENT_HP {
	if($hpevent == 50) {
		my $x1 = $npc->GetX();
		my $y1 = $npc->GetY();
		my $z1 = $npc->GetZ();
		my $h1 = $npc->GetHeading();
		quest::spawn2(223164,0,0,$x1,$y1 - 25,$z1,$h1);
		quest::spawn2(223164,0,0,$x1,$y1 + 25,$z1,$h1);
	}
}

sub EVENT_DEATH {
	#quest::signalwith(223157, 12011, 2000);
	quest::say("You stand to gain no honor in my death. May the wrath of Rallos Zek strike you down with great vengeance.");
	quest::stoptimer("vzek");
}

sub EVENT_TIMER {
	my $x2 = $npc->GetX();
	if($timer eq "vzek") {
		if($x2 < 260) {
			$npc->GMMove(405,75,358,192);
		}
	}
}

