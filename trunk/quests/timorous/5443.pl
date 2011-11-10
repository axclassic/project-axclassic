sub EVENT_SAY { 
if($text=~/jarsath tribe/i){
quest::say("About two thousand years ago. there were five different tribes of Iksar who dwelled on the continent of Kunark.  One of these tribes was the Jarsath.  They were a very primitive sort. proud and tribal. but also cannibalistic.  Often. they went to war with the other tribes that co-existed with them. back then.  The ruins found on this island were of structures created by the Jarsath.  I've been excavating for quite some time now. but haven't been able to find anything of significance."); }
}
sub EVENT_ITEM { 
if($itemcount{19960} == 1){
quest::summonitem("19954"); }
}
#END of FILE Zone:timorous  ID:5443 -- Xiblin_Fizzlebik 

