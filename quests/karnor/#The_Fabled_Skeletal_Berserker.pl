# #The_Fabled_Skeletal_Berserker (102130)
# Leaving fableds up unless otherwise
# by patrikpatrik 07/21/16

sub EVENT_SPAWN{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_AGGRO{
	quest::settimer("fberserker", 540) #8 depops in 8 sec 540sec is 9 min
}

sub EVENT_COMBAT {
	quest::settimer("fberserker", 540) #covers when bots attack or client attacks
}

sub EVENT_TIMER {
	if($timer eq "fberserker") {
		quest::depop();
	}
}
sub EVENT_DEATH {

}