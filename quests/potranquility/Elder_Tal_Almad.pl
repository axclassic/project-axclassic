sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Welcome traveler. are you here to meet with someone or are you new to this place?");
}
if($text=~/i am new to this place/i){
quest::say("Please take some time to look around. but be sure to speak with one of my fellow Elders prior to tampering with anything that may resemble a magical portal.  Tampering with the wrong object or in the wrong location on this island may take you to a very different and dangerous plane of existence."); }
}
#END of FILE Zone:potranquility  ID:203054 -- Elder_Tal_Almad 

