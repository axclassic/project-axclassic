##Viarglug_Timer ID 283164##
sub EVENT_SPAWN {
  quest::settimer("BarinduEpic",3600);
}
sub EVENT_TIMER {
if($timer eq "BarinduEpic") {
  quest::stoptimer("BarinduEpic");
  quest::depop(283165);
  quest::depop(283156);
  quest::depop(283158);
  quest::depop(); 
}
} 
