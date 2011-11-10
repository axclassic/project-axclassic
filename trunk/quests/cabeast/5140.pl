sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("My father was a great blacksmith.  He taught me how to make great items such as the [Shestar scaled coif].  Alas. smithing was not my rebirth. but rather the life of a warrior.");
}
if($text=~/shestar scaled coif/i){
quest::say("The Shestar scaled coif was a light coif my father would fashion out of loose scales from the scaled wolves.  I have some scales on me and if you bring me three loose scales I will have enough to create the coif for you. but I require you to also pay a fee of five gold."); }
}
#END of FILE Zone:cabeast  ID:5140 -- Trooper_Shestar 

