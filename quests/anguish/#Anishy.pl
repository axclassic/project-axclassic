##Anishy 317136##
sub EVENT_SPAWN {
quest::spawn2(317147,0,0,474.7,4946.2,275.6,139.1);
}
sub EVENT_SIGNAL {
  if($signal == 959) {
   quest::shout("Now fools. Strike while we hold him, we cannot hold this seal for long.");
   quest::signalwith(317109,9000,20);
   quest::signalwith(317134,9001,120);
   }
  } 