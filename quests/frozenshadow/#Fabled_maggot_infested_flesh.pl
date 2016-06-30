# #Fabled_maggot_infested_flesh NPCID - 111216

sub EVENT_SPAWN{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER{
	if($ulevel <= 40){
		quest::shout("We shall meet again $name! When you are a worthy opponent!!");
		#quest::spawn2(111160,0,0,127.5,776.9,177.4,41.1); #Spawn normal maggot_infested_flesh
		quest::depop();
	}
}

sub EVENT_AGGRO{
	if($ulevel <= 40){
		quest::shout("We shall meet again $name! When you are a worthy opponent!!");
		#quest::spawn2(111160,0,0,127.5,776.9,177.4,41.1); #Spawn normal maggot_infested_flesh
		quest::depop();
	}
}
sub EVENT_DEATH {

}