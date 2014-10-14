sub EVENT_SIGNAL {
  if($signal == 1150) { 
  quest::spawn2(339118,0,0,451.6,2288.2,206.4,86);
  quest::spawn2(339124,0,0,424.2,2271.8,196.9,62.8);
  quest::spawn2(339124,0,0,448,2259.8,205.3,44.2);
  quest::depop(339169);
  quest::depop(339170);
  quest::depop(339171);
  }
  if($signal == 1175) {
  quest::depop();
 }
}