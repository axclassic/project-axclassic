sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Well met. friend.  May I be of assistance?"); }
}
sub EVENT_ITEM { 
if($itemcount{2874} == 1){
quest::summonitem("2875");
}
if($itemcount{2873} == 1){
quest::summonitem("2875"); }
}
#END of FILE Zone:sharvahl  ID:155084 -- Tax_Collector_Khugra 

