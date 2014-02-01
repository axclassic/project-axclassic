sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Did you take this person's life. shaman?");
}
if($text=~/yes/i){
quest::say("Why have you taken this person's life. $name?  Did he threaten your life?  Did you dislike him?  Or was his death a profit to you in some way?");
}
if($text=~/profit/i){
quest::say("I see.  Farewell to you. wasichu."); }
}
#END of FILE Zone:fieldofbone  ID:86088 -- a_lesser_spirit 

