sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Greetings traveler. if you are headed through these gates you should be aware that there are many [dangers] you may encounter.");
}
if($text=~/what dangers?/i){
quest::say("Recently there have been numerous [brigand] encounters. the [Shak Dratha] have also taken arms against our people.");
}
if($text=~/what shak dratha?/i){
quest::say("Very little is known about the Shak Dratha. They appeared shortly after the explosion heard in the thicket. Although they are not really our enemies. they have been known to attack when those unknown to them approach.");
}
if($text=~/who are the shak dratha/i){
quest::say("The Khala Dun are the king's warriors. They are charged with defending the city of Shar Vahl and commanding any offensives necessary. They are named after Khala Dun who was King Vah Kerrath's protec");
}
if($text=~/what brigand/i){
quest::say("The brigands arrived shortly after the disappearance [Loda Kai.] Although it shames me to say it. I believe he may in some way be involved with these attacks. I can not bear to think about such an atrocity. Nevertheless there is a bounty on the brigands.");
}
if($text=~/who is loda kai/i){
quest::say("[Loda Kai] was a strong member of the Taruun. he was off to investigate the spirit deaths in shadeweavers thicket when a strong explosion was felt throughout the thickets. He has not been seen since. It was around the time of his disappearance that the brigands began to raid our trade route to shadow haven.");
}
if($text=~/what is loda kai/i){
quest::say("[Loda Kai] was a strong member of the Taruun. he was off to investigate the spirit deaths in shadeweavers thicket when a strong explosion was felt throughout the thickets. He has not been seen since. It was around the time of his disappearance that the brigands began to raid our trade route to shadow haven."); }
}
sub EVENT_ITEM { 
if($itemcount{14587} == 4){
quest::givecash("6","6","0","0"); }
}
#END of FILE Zone:sharvahl  ID:7038 -- Khala_Dun_Bokh 

