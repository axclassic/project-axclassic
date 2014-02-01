# Zone to timorous via skiffs event
# Zone: butcher
# AngeloX

sub EVENT_SPAWN{
   $x = $npc->GetX();
   $y = $npc->GetY();
   quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);}

sub EVENT_ENTER{
no warnings 'all' ;
if (($skiffa >=30) && ($skiffa <=40)){
 quest::delglobal("skiffa");
 quest::setglobal("skiffa",40,7,"F");
 $skiffa=undef;
 quest::delglobal("skiffb");
 quest::setglobal("skiffb",0,7,"F");
 $skiffb=undef;
 quest::delglobal("skiffc");
 quest::setglobal("skiffc",0,7,"F");
 $skiffc=undef;
 quest::movepc(96,-2103.1,-2117.7,20);}}
