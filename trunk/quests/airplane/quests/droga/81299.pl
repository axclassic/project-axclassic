## LOW/HIGH LEVEL SWITCH FOR SPAWNS
## droga
## Angelox

sub EVENT_SPAWN {
   $x = $npc->GetX();
   $y = $npc->GetY();
   quest::set_proximity($x - 30, $x + 30, $y - 30, $y + 30);
   quest::delglobal("dropop");
   quest::setglobal("dropop",2,3,"F");}

sub EVENT_ENTER{
if (($ulevel <=45) && ($dropop==2)){
 quest::spawn_condition("droga",7,0);
 quest::spawn_condition("droga",8,1);
 quest::delglobal("dropop");
 quest::setglobal("dropop",3,3,"F");}
elsif (($ulevel >=46) && ($dropop==2)){
 quest::spawn_condition("droga",7,1);
 quest::spawn_condition("droga",8,0);
 quest::delglobal("dropop");
 quest::setglobal("dropop",3,3,"F");}}

