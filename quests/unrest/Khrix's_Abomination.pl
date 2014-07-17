sub EVENT_SPAWN {
  quest::settimer("depop",300); 
  
 }
  sub EVENT_TIMER {
  quest::depop();
  quest::stoptimer("depop");
}