sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Good day friend! I'm glad you've stopped by. I am in need of some assistance. Please direct anyone seeking work to me.");
}
if($text=~/i seek work/i){
quest::say("Excellent! I practice the art of alchemy and I am currently working on some new recipes. I require a few special ingredients. Fortunately they grow in the crater just outside our city walls. Bring me a  redcapped mushroom. a pinch of scarlet moss and a bluecapped mushroom. I'll be most grateful."); }
}
#END of FILE Zone:sharvahl  ID:155080 -- Dronqam_Runghi 

