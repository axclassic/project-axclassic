sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Quite busy!! Quite busy!!  Things must be done.  [New components] to be collected!!");
quest::say("Quite busy!! Quite busy!!  Things must be done.  [New components] to be collected!!");
quest::say("Begin your prayers. young simpleton!!  Your time on this realm has expired.");
}
if($text=~/components/i){
quest::say("Yes. yes!!  I will need components from beyond the gates.  I must find an [apprentice of the third rank].");
}
if($text=~/third rank/i){
quest::say("If you truly be an apprentice of the third circle. then there is a Dark Binder skullcap to be earned.  Take this sack and fill it with a creeper cabbage. a heartsting telson with venom. brutling choppers and a scalebone femur.  When they are combined within the sack. you may return it to me with your third rank skullcap and and we shall bid farewell to the title. 'apprentice.'"); }
}
#END of FILE Zone:cabwest  ID:3430 -- Master_Kyvix 

