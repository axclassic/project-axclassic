sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Greetings. and may the pain of the ancients guide you.  You have come to us for guidance. have you not?  We are the Hierophants of Cabilis and we guide the young Scaled Mystics.  All petitioners shall speak with me of [temple tasks].");
}
if($text=~/what temple tasks/i){
quest::say("The Temple of Terror requires all young Scaled Mystics to [perform daily tasks].  The tasks are necessary to the upkeep of our order as well as that of our brothers. the Crusaders of Greenmist.");
}
if($text=~/i whant to perform daily tasks/i){
quest::say("We require many components for various rituals.  Take this component mortar and fill it with the following items - foraged [mud crabs]. two small mosquito wings and one portion of bone chips.  You must then use the pestle and combine all the components.  When you have a full component mortar. you may return to me and I shall pay you your wages. but most importantly. you shall prove your devotion to the Scaled Mystics.");
}
if($text=~/what mud crabs/i){
quest::say("Mud crabs are tiny crustaceans which live along the mudcaked shores of the Lake of Ill Omen.  You can forage for them and find a handful of them at a time."); }
}
#END of FILE Zone:cabeast  ID:2555 -- Hierophant_Oxyn 

