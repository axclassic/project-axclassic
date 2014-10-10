sub EVENT_SIGNAL {
  if($signal == 1155) { 
  quest::spawn2(339118,0,0,414.1,2275.2,192.8,63.8);
  quest::spawn2(339124,0,0,456.1,2291.9,207.5,108.6);
  quest::spawn2(339124,0,0,450,2252.8,205.9,50.5);
  quest::depop(339141);
  quest::depop(339144);
  quest::depop(339145);
  }
  if($signal == 1175) {
  quest::depop();
 }
}