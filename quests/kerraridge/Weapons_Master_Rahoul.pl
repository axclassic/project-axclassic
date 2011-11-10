sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hail friend, are you a new recruit or have you been at it for a bit?");
}
if($text=~/i am a new recruit/i){
quest::say("Well... perhaps you should head to the combat training grounds and pick up a few pointers.  Walk west along the ledge that runs just outside of the city's walls and you shouldn't be able to miss it.");
}
if($text=~/i have been at it for a bit/i){
quest::say("Good good... keep at it!  We need all of the strong willed thick headed Khala Dun we can muster!  Now, get back to the fight!"); }
}
#END of FILE Zone:sharvahl  ID:155243 -- Weapons_Master_Rahoul 

