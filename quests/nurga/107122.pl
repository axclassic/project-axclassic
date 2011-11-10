## LOW/HIGH LEVEL SWITCH FOR SPAWNS
## NURGA
## Angelox

sub EVENT_SPAWN {
   $x = $npc->GetX();
   $y = $npc->GetY();
   quest::set_proximity($x - 30, $x + 30, $y - 30, $y + 30);
   quest::delglobal("nurpop");
   quest::setglobal("nurpop",2,3,"F");}

sub EVENT_ENTER{
if (($ulevel <=45) && ($nurpop==2)){
 quest::spawn_condition(nurga,7,0);
 quest::spawn_condition(nurga,8,1);
 quest::delglobal("nurpop");
 quest::setglobal("nurpop",3,3,"F");}
elsif (($ulevel >=46) && ($nurpop==2)){ 
 quest::spawn_condition(nurga,7,1);
 quest::spawn_condition(nurga,8,0);
 quest::delglobal("nurpop");
 quest::setglobal("nurpop",3,3,"F");}}

