sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hello there. $name.  I am hosting a relay running contest.  Would you like to participate?");
}
if($text=~/i would like to participate/i){
quest::say("Great!  The prize will be this silly old music sheet.  Let me know when you are ready and I will pass you the torch and tell you where the first stop is.");
}
if($text=~/ready/i){
quest::say("Here you go.  Run with this torch as fast as you can to the misty thicket and hand this torch off to Fajio Knejo.  He will tell you where to go from there.  Hurry!  You do not have much time!");
quest::summonitem("20532"); }
}
#END of FILE Zone:qey2hh1  ID:5804 -- Konia_Swiftfoot 

