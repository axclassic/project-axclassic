sub EVENT_SAY { 
my $Mudtoes = quest::saylink("Mudtoes", 1);
my $Trondle = quest::saylink("Trondle", 1);
my $searching = quest::saylink("searching", 1);
if($text=~/Hail/i){
quest::say("Hail. mighty $name! Welcome to Stormguard Hall. I am Captain Furtog Ogrebane. only surviving descendant of the legendary Trondle Ogrebane. slayer of the $Mudtoes. If you wish to serve the grand city of Kaladim. I urge you to speak with any of the trainers. Good day.");
}
if($text=~/Mudtoes/i){
quest::say("The Mudtoes were a small but mighty clan of ogres. My great father $Trondle destroyed them. I have heard disturbing rumors of one Mudtoe surviving. Would you mind $searching for the Mudtoes or have you other duties to perform?");
}
if($text=~/Trondle/i){
quest::say("Trondle was my great father and slayer of the Mudtoes. He was killed by those vile Crushbone orcs. If you truly wish to help Kaladim remain safe. speak with trainer Canloe Nusback. Say that you are ready to serve Kaladim.");
}
if($text=~/searching/i){
quest::say("I have heard persistent rumors of two Mudtoe ogres who survived the slaughter.  Go to the port of Butcherblock.  Those dock hands must have heard of the name $Mudtoe.  Bring me the remaining heads of the Mudtoes!!  I want all the Mudtoes dead!!  Do not return until you have them both!!");
}
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
 elsif(plugin::check_handin(\%itemcount, 13316 =>1, 13317 =>1)){
    quest::say("'Finally my great father's work has been completed. All the Mudtoe ogres have been exterminated. Thank you. Take this weapon which my father pried from the cold, dead hands of the Mudtoe ogre captain. It is called an ogre war maul. May you wield it in the name of Kaladim.");
    quest::summonitem(6302);
	quest::ding();
	quest::faction(169, 10);    #kazon stormhammer
    quest::faction(215, 10); 	#merchants of kaladim
    quest::faction(219, 10); 	#miners guild 249
    quest::faction(314, 10);	#storm guard 
	quest::faction(57, -30);    #Craknek Warriors
	quest::exp(10000);
    quest::givecash(0,7,0,2);
	}
 else { 
    #do all other handins first with plugin, then let it do disciplines
    plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
    plugin::return_items(\%itemcount);
    quest::say("I have no need of this, take it back.");
 }
}
#END of FILE Zone:kaladima  ID:60008 -- Furtog_Ogrebane 

