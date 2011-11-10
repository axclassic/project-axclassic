## LOW/HIGH LEVEL SWITCH FOR SPAWNS
## cazicthule
## Angelox

sub EVENT_SPAWN {
   $x = $npc->GetX();
   $y = $npc->GetY();
   quest::set_proximity($x - 30, $x + 30, $y - 30, $y + 30);
   quest::delglobal("cazpop");
   quest::setglobal("cazpop",2,3,"F");}

sub EVENT_ENTER{
if (($ulevel <=45) && ($cazpop==2)){
 quest::spawn_condition(cazicthule,7,0);
 quest::spawn_condition(cazicthule,8,1);
 quest::delglobal("cazpop");
 quest::setglobal("cazpop",3,3,"F");}
elsif (($ulevel >=46) && ($cazpop==2)){
 quest::spawn_condition(cazicthule,7,1);
 quest::spawn_condition(cazicthule,8,0);
 quest::delglobal("cazpop");
 quest::setglobal("cazpop",3,3,"F");}}

