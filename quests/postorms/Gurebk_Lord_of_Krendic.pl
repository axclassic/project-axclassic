sub EVENT_SPAWN {
	my $x = $npc->GetX();
	my $y = $npc->GetY();
	my $z = $npc->GetZ();
	my $h = $npc->GetHeading();
        quest::delglobal("krendic");
	quest::setglobal("krendic",0,7,"F"); #restarts spawns
	$krendic=undef;
}

sub EVENT_SIGNAL {
	quest::spawn2(210230,0,0,$x,$y,$z,$h);
	quest::depop();
}

# End of File  Zone: PoStorms ID: 210178 -- Gurebk_Lord_of_Krendic
