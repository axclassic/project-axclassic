sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hello $name. it is my pleasure to meet you."); }
}
sub EVENT_ITEM { 
if($itemcount{2877} == 1){
quest::summonitem("2877"); }
}
#END of FILE Zone:sharvahl  ID:155079 -- Harbin_Gernawl 

