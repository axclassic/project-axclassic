# #The_Fabled_Cara_Omica NPCID - 111177

sub EVENT_SPAWN{
	$npc->SetAppearance(1); #Sitting
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER{
	if($ulevel <= 40){
		quest::shout("We shall meet again $name! When you are a worthy opponent!!");
		quest::depop();
	}
}

sub EVENT_AGGRO{
	if($ulevel <= 40){
		quest::shout("We shall meet again $name! When you are a worthy opponent!!");
		quest::depop();
	}
}
sub EVENT_DEATH {

}