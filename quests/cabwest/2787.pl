sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hail there. $name. So you are ready to learn more about our ways? Do you wish to try and expand your knowledge of our arcane arts? Then venture far from here to the darkest depths of our once great empire and seek the minions that inhabit the ruins. The arcane powers will come in the form of [scrolls].");
}
if($text=~/scrolls/i){
quest::say("Besides all the ones you will find. there are some that are only in my possession. To show that you have been successful on your journey. return one of splurt. defoliation. convergence. or thrall of bones. You then will be rewarded with one of my scrolls."); }
}
#END of FILE Zone:cabwest  ID:2787 -- Izarod_Fristan 

