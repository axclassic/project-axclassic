## Spawn_Timer ID 227147 ##
sub EVENT_SPAWN {
   quest::settimer("NadoxEpic",3000);
 }
sub EVENT_TIMER {
if($timer eq "NadoxEpic"){
	quest::stoptimer("NadoxEpic"); 
	quest::depop(227119);
    quest::depopall(227140);
    quest::depopall(227143);
    quest::depopall(227142);
	}
}