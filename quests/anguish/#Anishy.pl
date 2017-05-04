##Anishy 317136##
sub EVENT_SPAWN {
quest::spawn2(317147,0,0,506.7,4974.6,295.2,126.9);
}
sub EVENT_SIGNAL {
  if($signal == 959) {
   quest::shout("Now fools. Strike while we hold him, we cannot hold this seal for long.");
   quest::signalwith(317109,9000,2500);
   }
  } 