sub EVENT_SPAWN {
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}
sub EVENT_ENTER {
if(defined $qglobals{"Sleeperawake"}){
quest::spawn_condition("sleeper", 1,0); ##This has to be the zone name  so code knows which zone to look into
quest::spawn_condition("sleeper", 2,1);
quest::depop();
}
else{
quest::spawn_condition("sleeper", 1,1); 
quest::spawn_condition("sleeper", 2,0);
 $Sleeperawake=undef;
 quest::depop();
 }
}
