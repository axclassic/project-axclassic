#############
#NPC: Deputy_Lowmot
#Quest Name: Jillin's Stew
#Quest by: 
#Revised: Olhadon
#NPCs Involved: Blizna_Toepopal
#Items Involved: Carrot Stew ID:13959
#zone: rivervale

sub EVENT_SAY {
  if($text=~/Hail/i){
    quest::say("Greetings, $name! I am Deputy Lowmot. In addition to my duties as a deputy, I am also in charge of organizing all of our meals here at the Guardian Stronghold."); 
  }
  elsif($text=~/who is.*?(mayor|gubbin)/i){
    quest::say("Mayor Gubbin is our great halfling leader. If you wish to speak with him I am sure he can be found in Guardian Stronghold. It is from there that he dispenses his wisdom.");
  }
}

sub EVENT_ITEM {
  #Carrot Stew ID:13959
  if($itemcount{13959} == 1){
	quest::say("Oh good! Hey. You are not Jillin.. Helping out Blinza huh? She is quite a woman.. Yes indeed. Quite a woman.. ah.. Oh sorry. Here you go. Thanks again. Mayor Gubbin will be pleased.");
	quest::givecash("3","2","0","0");
	quest::faction("133","5");	#Guardians of the Vale
	quest::faction("208","5");	#Mayor Gubbin
	quest::faction("316","5");	#Storm Reapers
	quest::faction("218","5");	#Merchants of Rivervale 
	quest::faction("88","-5");	#Dreadguard Outer
	quest::ding(); quest::exp(100);
  }
  else {
    plugin::return_items(\%itemcount);
    quest::say("I have no need for this $name, you can have it back.");
  }
}

#END of FILE Zone:rivervale  ID:19111 -- Deputy_Lowmot 

