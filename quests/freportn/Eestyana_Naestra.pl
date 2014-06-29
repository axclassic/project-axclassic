sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Welcome to the Hall of Truth!  May the will of Mithaniel Marr guide you through life.  We are glad to see that you have an interest in our ways.  Please speak with any of my priests or knights and they shall help you find your faith."); }
}
sub EVENT_ITEM {
if (plugin::check_handin(\%itemcount, 18735 => 1)){
    quest::say("I am so thrilled you have chosen to join the Hall of Truth and follow the Lightbringer in the belief in love and valor.");
	
	quest::summonitem(13556);
	quest::ding();
	quest::faction(258,10); #Priests of Marr
    quest::faction(184,10); #Knights of Truth
    quest::faction(105,10); #Steel Warriors
	quest::faction(184,-30); #Dismal Rage
    quest::faction(105,-30); #Freeport Militia
	quest::exp(1000);	
}
}
#END of FILE Zone:freportn  ID:8045 -- Eestyana_Naestra 

