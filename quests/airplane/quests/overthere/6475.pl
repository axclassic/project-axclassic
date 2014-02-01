sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("The hidden self inside a myriad of magic is one that walks quite softly.  Yes. that is what you must seek."); }
}
sub EVENT_ITEM { 
if($itemcount{10604} == 1){
quest::say("Ah yes. Jeb's Seal. The time to craft a Serpent must have come. I will need components collected to craft the first of the pieces.  I have also provided you with a sack in which you must combine the items. Are you ready to collect them?");
quest::summonitem("10604"); }
}
#END of FILE Zone:overthere  ID:6475 -- Modani_Qu`Loni 

