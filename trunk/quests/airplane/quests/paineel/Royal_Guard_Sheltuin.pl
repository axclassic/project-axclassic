sub EVENT_SAY { 
if($text=~/i want audience/i){
quest::say("The Overlord is not seeing anyone at this time. however. I may have work for you. You seem to have some experience with the kobold annoyance in the region. Are you [interested]. $name?");
}
if($text=~/i am interested/i){
quest::say("Then I shall give you a task. I assume you are aware of the kobold lair nearby. Many of our adventurous knights and priests crusade to destroy those pests so seeing many Erudites frequent the area is normal. However. it is not normal to see someone carry large crates into the lair and return empty handed. This person's movements also show he is attempting to remain unseen.....the [fool].");
}
if($text=~/what fool/i){
quest::say("Whoever it is. obviously is not an Erudite. even though he appears to be. Only an outsider would take us to be such idiots as to fall for their pitiful attempt at disguise. Or perhaps....well. never mind that. I want you to enter the kobold lair and find these crates. Return one to me and we'll decide what to do from there."); }
}
#END of FILE Zone:paineel  ID:75073 -- Royal_Guard_Sheltuin 

