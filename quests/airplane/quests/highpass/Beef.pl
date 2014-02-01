#############
#NPC: Beef
#Quest Name: 
#Quest by: 
#Revised: Olhadon
#NPCs Involved: Bryan_McGee
#Items Involved:
#zone: highpass

sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Yu be getting going. Dis here is da boss' table!!"); }
}

sub EVENT_SIGNAL {
   if($signal == 1) {
     quest::say("Gets moving before me smash yu to pulp!!");
   }
   elsif($signal == 2) {
     quest::say("BWAHAHA HA!! Yoo werk fer Mister Axe now. Hehehe!!");
   }
}
#END of FILE Zone:highpass  ID:5055 -- Beef 

