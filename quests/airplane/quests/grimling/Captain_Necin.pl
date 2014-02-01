sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hello, $name. I'm looking for an accomplished soldier to help me carry out a very dangerous mission. If you know of one please have them report to me at once.");
}
if($text=~/soldier/i){
quest::say("Very well, acquire a chest of valor and fill it with the medals you receive from scouts Husma, Danarin, and Derin. Give me the resulting soldier's chest and I will reveal the details of my mission.");
}
if($text=~/accomplished soldier/i){
quest::say("Very well, acquire a chest of valor and fill it with the medals you receive from scouts Husman, Danarin, and Derin. Give me the resulting soldier's chest and I will reveal the details of my mission.");
}
if($text=~/accomplished soldier/i){
quest::say("Very well, acquire a chest of valor and fill it with the medals you receive from scouts Husman, Danarin, and Derin. Give me the resulting soldier's chest and I will reveal the details of my mission."); }
}
#END of FILE Zone:grimling  ID:167131 -- Captain_Necin 

