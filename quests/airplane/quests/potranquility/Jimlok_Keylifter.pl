sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Well met. traveler.  Can I be of assistance to you?  Can't say as I got much to do at the moment.  I'm just attending to a little fishing while I wait on my [friend] to get back to me.  Hopefully he doesn't keep me waiting for too much longer.  I can only stand so much of this place.");
}
if($text=~/friend/i){
quest::say("This is the situation.  My friend Gilor Swiftfoot and I were going to try our hand at breaking into the Plane of Justice. Yeah. yeah. I'm sure you're thinking that's silly and all. but how many people do you know of that can say they've broken out of the Eternal Prison. let alone in? 'None"); }
}
#END of FILE Zone:potranquility  ID:203021 -- Jimlok_Keylifter 

