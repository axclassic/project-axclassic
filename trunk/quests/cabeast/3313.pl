sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("What is it you seek?  Eternal suffering?");
}
if($text=~/i seek eternal suffering/i){
quest::say("Then follow the words of Cazic-Thule and may his blessed curses rain upon your soul as they shall on all of his faithful servants."); }
}
#END of FILE Zone:cabeast  ID:3313 -- Lord_Korzin 

