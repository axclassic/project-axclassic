sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("fixes you with a dark. piercing gaze.  'What do you want. mortal?'");
}
if($text=~/how do i prove myself/i){
quest::say("The trials of the Tribunal are no easy affair.  They will severely test your might and skill.  Are you prepared for such an ordeal?");
}
if($text=~/i am prepared/i){
quest::say("nods slightly.  'Very well.  When you are ready. you may begin the trial of flame.  You must endure the heat of the fire and be sure not to let its creatures reach the center.  We shall judge the mark of your success.'");
}
if($text=~/we are prepared/i){
quest::say("nods slightly.  'Very well.  When you are ready. you may begin the trial of lashing.  You must protect the victims from their tormentors.  Be wary of the scourge of honor - you cannot fight it directly.  You must find and destroy its life force to defeat it.  We shall judge the mark of your success.'");
quest::say("nods slightly.  'Very well.  When you are ready. you may begin the trial of execution.  The victim will perish should the hooded executioner reach him.  Its life will end only when all of the nemeses which accompany it also perish.  We shall judge the mark of your success.'");
quest::say("nods slightly.  'Very well.  When you are ready. you may begin the trial of execution.  The victim will perish should the hooded executioner reach him.  Its life will end only when all of the nemeses which accompany it also perish.  We shall judge the mark of your success.'");
quest::say("fixes you with a dark. piercing gaze.  'What do you want. mortal?'");
quest::say("nods slightly.  'Very well.  When you are ready. you may begin the trial of torture.  Only when a wraith of agony dies will the prisoners feel any relief.  Take care to find and kill it quickly. lest their torment overcome them.  We shall judge the mark of your success.'");
}
if($text=~/we are ready for the trials of executioner/i){
quest::say("Then begin.");
}
if($text=~/we are ready for the trial of the executioner/i){
quest::say("Then begin.");
}
if($text=~/what about muvain/i){
quest::say("That trial is already underway.  You must wait.");
}
if($text=~/prepared/i){
quest::say("nods slightly.  'Very well.  When you are ready. you may begin the trial of execution.  The victim will perish should the hooded executioner reach him.  Its life will end only when all of the nemeses which accompany it also perish.  We shall judge the mark of your success.'");
quest::say("nods slightly.  'Very well.  When you are ready. you may begin the trial of hanging.  Act quickly to destroy the spirits of suffocation before their victims perish.  We shall judge the mark of your success.'");
quest::say("nods slightly.  'Very well.  When you are ready. you may begin the trial of torture.  Only when a wraith of agony dies will the prisoners feel any relief.  Take care to find and kill it quickly. lest their torment overcome them.  We shall judge the mark of your success.'"); }
}
#END of FILE Zone:pojustice  ID:201078 -- The_Tribunal 

