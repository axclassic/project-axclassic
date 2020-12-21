# #The_Fabled_Venril_Sathir (102133)

sub EVENT_SPAWN{
	my $x = $npc->GetX();
	my $y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
    if($ulevel <= 59) {
		quest::shout("We shall meet again $name! When you are a worthy opponent!!");
		quest::depop();
	}
}

sub EVENT_AGGRO {
	if($ulevel <= 59){
		quest::shout("We shall meet again $name! When you are a worthy opponent!!");
		quest::depop();
	}
}

