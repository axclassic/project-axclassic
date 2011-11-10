sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("Well. it seems that you have something of importance that you wish to speak to me about?  No?  Then perhaps you can do something [for me].");
}
if($text=~/what do you want me to do for you/i){
quest::say("Well I need some information.  It appears that some gnolls are planning an [invasion] of Surefall.  I believe there are some gnoll couriers that are running information.  If you could bring me their marching orders. invasion plans. area maps. and their encryption key.  Your best chance to catch a courier is probably inside Blackburrow.");
}
if($text=~/what invasion/i){
quest::say("Apparently they've heard of our plans to reopen the entrance to Jaggedpine inside Surefall.  It seems they believe the think they have a chance to stop us.  While most of us have little concern about a gnoll invasion force the information you provide would be of great assistance.");
}
if($text=~/what can i do for you/i){
quest::say("Well I need some information.  It appears that some gnolls are planning an [invasion] of Surefall.  I believe there are some gnoll couriers that are running information.  If you could bring me their marching orders. invasion plans. area maps. and their encryption key.  Your best chance to catch a courier is probably inside Blackburrow."); }
}
#END of FILE Zone:qeytoqrg  ID:Not_Found -- Rilca_Leafrunner 

