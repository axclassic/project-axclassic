sub EVENT_SAY{
  if ($text=~/hail/i){
  quest::signalwith(203003,1500,100);
  }
 }
