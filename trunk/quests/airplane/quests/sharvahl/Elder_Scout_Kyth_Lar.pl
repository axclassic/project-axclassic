sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Well met. friend.  May I be of assistance?"); }
}

sub EVENT_ITEM {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Rogue');
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:sharvahl  ID:155253 -- Elder_Scout_Kyth_Lar 
