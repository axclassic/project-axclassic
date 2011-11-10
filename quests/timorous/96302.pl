# Zone to Butcher via skiffs event
# Zone: Timorous
# AngeloX

sub EVENT_SPAWN{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 70, $x + 70, $y - 70, $y + 70);}

sub EVENT_ENTER{
    if (($skiffa ==0) || ($skiffa >=65) && ($skiffa <=80)){
     if($debugpl){ quest::shout("Zoning PC's to Butcher Setting to 0!!!");}
    quest::delglobal("skiffa");
    quest::setglobal("skiffa",0,7,"F");
    $skiffa=undef;
    quest::delglobal("skiffb");
    quest::setglobal("skiffb",0,7,"F");
    $skiffb=undef;
    quest::delglobal("skiffc");
    quest::setglobal("skiffc",0,7,"F");
    $skiffc=undef;
    quest::movepc(68,3386.0,130.0,20);}}
