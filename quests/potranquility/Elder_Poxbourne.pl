sub EVENT_SPAWN{
  quest::spawn2(203074,0,0,-1420.7,-252.3,-909,61.6);
}
sub EVENT_SAY{
  if ($text=~/hail/i){
  quest::signalwith(203003,1500,100);
  }
 }
