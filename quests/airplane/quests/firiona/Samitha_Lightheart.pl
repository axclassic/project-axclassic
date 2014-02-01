sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("And a good day to you. too! I have traveled here in the name of the Jaggedpine Treefolk to search out any new and [wonderful powers] that would aid us in preserving the wildlife back home. I have not been able to venture far from this outpost as the inhabitants of the nearby woods pose a great danger. I have decided to wait for more of my Treefolk to arrive before adventuring further.  There's safety in numbers. they always say.");
}
if($text=~/what wonderful powers/i){
quest::say("From what I have gathered from the residents of this outpost and from others like myself. there are a fair number of scrolls to be found in the outlying areas.  These scrolls are said to contain new and powerful magic. I myself have found a few of these scrolls. But the problem is. I don't believe I have a complete collection. If you would care to [help] me. I'd be willing to trade some of the extra ones I have for some of the extras you may run across.");
}
if($text=~/I will help you/i){
quest::say("I am still looking for four scrolls that I have not been able to locate. They are the scrolls of Circle of Winter. Circle of Summer. Spirit of Scale. and Form of the Howler. If you bring any of these back. I'll give you one of four very rare scrolls in my possession."); }
}
sub EVENT_ITEM { 
if($itemcount{19238} == 1 && $itemcount{19378} == 1){
quest::summonitem("19236","1");
}
if($itemcount{19244} == 1){
quest::summonitem("19233","1");
}
if($itemcount{19232} == 1){
quest::summonitem("19236","1");
}
if($itemcount{19234} == 1){
quest::summonitem("19236","1"); }
}
#END of FILE Zone:firiona  ID:84170 -- Samitha_Lightheart 

