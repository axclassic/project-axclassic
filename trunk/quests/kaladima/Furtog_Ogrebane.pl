sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hail. mighty $name! Welcome to Stormguard Hall. I am Captain Furtog Ogrebane. only surviving descendant of the legendary Trondle Ogrebane. slayer of the [Mudtoes]. If you wish to serve the grand city of Kaladim. I urge you to speak with any of the trainers. Good day.");
}
if($text=~/what mudtoes/i){
quest::say("The Mudtoes were a small but mighty clan of ogres. My great father [Trondle] destroyed them. I have heard disturbing rumors of one Mudtoe surviving. Would you mind [searching for the Mudtoes] or have you other duties to perform?");
}
if($text=~/who is trondle/i){
quest::say("Trondle was my great father and slayer of the Mudtoes. He was killed by those vile Crushbone orcs. If you truly wish to help Kaladim remain safe. speak with trainer Canloe Nusback. Say that you are ready to serve Kaladim.");
}
if($text=~/what searching for mudtoes/i){
quest::say("The Mudtoes were a small but mighty clan of ogres. My great father [Trondle] destroyed them. I have heard disturbing rumors of one Mudtoe surviving. Would you mind [searching for the Mudtoes] or have you other duties to perform?");
}
if($text=~/i am searching for the mudtoes/i){
quest::say("I have heard persistent rumors of two Mudtoe ogres who survived the slaughter.  Go to the port of Butcherblock.  Those dock hands must have heard of the name [Mudtoe].  Bring me the remaining heads of the Mudtoes!!  I want all the Mudtoes dead!!  Do not return until you have them both!!");
}
if($text=~/who is mudtoe/i){
quest::say("The Mudtoes were a small but mighty clan of ogres. My great father [Trondle] destroyed them. I have heard disturbing rumors of one Mudtoe surviving. Would you mind [searching for the Mudtoes] or have you other duties to perform?"); }
}
sub EVENT_ITEM { 
   if($itemcount{18766} == 1){
    quest::say("Ah another recruit. Well then, take this apprentice tunic and wear it with pride. There is much work to do. return to me when you need training. Bring pride to the name of the Storm Guards");  #made up text
	quest::summonitem(13515);
	quest::ding();
	quest::faction(169, 10);    #kazon stormhammer
    quest::faction( 215, 10); 	#merchants of kaladim
    quest::faction( 219, 10); 	#miners guild 249
    quest::faction( 314, 10);	#storm guard
	quest::exp(1000);
	quest::rebind(60,302,63,14);
 } 
       else {
   quest::say("I have no use for this.");
   plugin::return_items(\%itemcount);
   }
}
#END of FILE Zone:kaladima  ID:60008 -- Furtog_Ogrebane 

