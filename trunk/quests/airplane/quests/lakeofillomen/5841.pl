sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Have you been sent by the War Baron to [assist]?  The explorers from Firiona Vie draw closer.");
}
if($text=~/I am here to assist/i){
quest::say("That is good. I will stay here to halt any advances.  Head out near the lake and destroy the trespassers on our land!  Bring me four of their knives that they carry for survival.  Prove your allegiance to the Legion of Cabilis."); }
}
#END of FILE Zone:lakeofillomen  ID:5841 -- Trooper_Vaurk 

