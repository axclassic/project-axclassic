##Spawn Events for Najena
##Angelox

##Fabled level change-spawn
sub EVENT_SPAWN {
   $x = $npc->GetX();
   $y = $npc->GetY();
   quest::set_proximity($x - 100, $x +100, $y - 100, $y + 100);
   quest::delglobal("najenapop");
   quest::setglobal("najenapop",2,3,"F");}

sub EVENT_ENTER{
if (($ulevel <=50) && ($najenapop==2)){
 quest::spawn_condition("najena",2,1); #low
 quest::spawn_condition("najena",1,0); #high
 quest::delglobal("najenapop");
 quest::setglobal("najenapop",3,3,"F");}
elsif (($ulevel >=51) && ($najenapop==2)){
 quest::spawn_condition("najena",2,0); #low
 quest::spawn_condition("najena",1,1); #high
 quest::delglobal("najenapop");
 quest::setglobal("najenapop",3,3,"F");}}
 