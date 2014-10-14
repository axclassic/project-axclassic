sub EVENT_SPAWN {
quest::spawn2(339140,0,0,677.6,2196.2,227.1,118.1);
quest::depop(339168);
quest::depop(339164);
  }
sub EVENT_SIGNAL {  
  if($signal == 1275) {
  quest::depop();
 }
}