#############
#NPC: Deputy_Eigon
#Quest Name: Hungry Deputy
#Quest by: 
#Revised: Olhadon
#NPCs Involved: Daleen_Leafsway
#Items Involved: Sack of Turnip ID:16165
#zone: rivervale

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount,16165=> 1)){
	quest::say("Daleen sent you? She is so sweet. If she wasn't married.. ehem.. Thanks.");
	quest::faction(133, 5); #Guardians of the Vale
	quest::faction(208, 5); #Mayor Gubbin
	quest::faction(316, 5);	#Storm Reapers
	quest::faction(218, 5);	#Merchants of Rivervale
	quest::faction(88, -10);#Dreadguard Outer
	quest::ding(); quest::exp(500);
	quest::givecash(rand(10),rand(10),rand(2),0);
  }
  else {
    plugin::return_items(\%itemcount);
    quest::say("I have no need for this $name, you can have it back.");
  }
}

#END of FILE Zone:rivervale  ID:33070 -- Deputy_Eigon

