# Zone to safepoint event
# Zone: Frozenshadow
# AngeloX

sub EVENT_SPAWN
{
 quest::delglobal("omica");
 quest::setglobal("omica",2,3,"F");
 $omica=undef;
 quest::delglobal("Tserr");
 quest::setglobal("Tserr",2,3,"F");
 $Tserr=undef;
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 20, $x + 20, $y - 20, $y + 20);
}

sub EVENT_ENTER
{
	quest::movepc(111,200,100,0);
}
