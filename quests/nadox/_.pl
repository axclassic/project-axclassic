# Angelox

sub EVENT_SPAWN {
	my $x1 = $npc->GetX();
	my $y1 = $npc->GetY();
	quest::set_proximity($x1 - 90, $x1 + 90, $y1 - 90, $y1 + 90);
	quest::setglobal("krak","2",3,"F");
	quest::setglobal("lava","2",3,"F");
	quest::setglobal("kars","2",3,"F");
	quest::setglobal("bres","2",3,"F");
	quest::setglobal("hanr","2",3,"F");
	quest::setglobal("grums","2",3,"F");
	quest::setglobal("razo","2",3,"F");
	quest::setglobal("peer","2",3,"F");
}

sub EVENT_ENTER {
	quest::depop();
}
# EOF zone: nadox  Global Watcher

