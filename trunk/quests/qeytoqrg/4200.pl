##Spawn Events for Qeytoqrg (Qeynos Hills)
##Angelox

##Sir Edwin Motte level change-spawn
sub EVENT_SPAWN {
   $x = $npc->GetX();
   $y = $npc->GetY();
   quest::set_proximity($x - 100, $x +100, $y - 100, $y + 100);
   quest::delglobal("mottepop");
   quest::setglobal("mottepop",2,3,"F");}

sub EVENT_ENTER{
if (($ulevel <=50) && ($mottepop==2)){
 quest::spawn_condition("qeytoqrg",2,1); #low
 quest::spawn_condition("qeytoqrg",1,0); #high
 quest::delglobal("mottepop");
 quest::setglobal("mottepop",3,3,"F");}
elsif (($ulevel >=51) && ($mottepop==2)){
 quest::spawn_condition("qeytoqrg",2,0); #low
 quest::spawn_condition("qeytoqrg",1,1); #high
 quest::delglobal("mottepop");
 quest::setglobal("mottepop",3,3,"F");}}

