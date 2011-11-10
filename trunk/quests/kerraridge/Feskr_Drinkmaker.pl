sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Erh?  If you not be here to help Feskr with his [problem] then Feskr want you to leave.");
}
if($text=~/what problem/i){
quest::say("You wish to help?  Orrderrr of supplies I rrequest not arrive; ship sink.  Now Feskr needs supplies.  Feskr need bottle of Tunare's Finest. thunderhoof mushroom. tea leaf. and handmade backpack.  Rrrr. strange items but Feskr need to sell.  You bring. Feskr give you nice bag."); }
}
#END of FILE Zone:kerraridge  ID:74076 -- Feskr_Drinkmaker 

