#############
#Quest Name:Going Postal (Rivervale)
#Author:Shaznito
#NPCs Involved:Silna Songsmith, Felisity Starbright, Ton Twostring, Idia, Lislia Goldtune, Eve_Marsinger
#Items Involved:Bardic Letter (Freeport) 
#A pouch of Mail (Highpass) 
#A Pouch of Mail (Qeynos)
#A Pouch of Mail (Freeport)
#################

sub EVENT_SAY { 

if($text=~/Hail/i){
quest::say("$name - If you are interested in helping the League of Antonican Bards by delivering some mail, you should talk to Ton Twostring.");
}
}


sub EVENT_ITEM {
 #Hand in Bardic Letter (Freeport)
 if(plugin::check_handin(\%itemcount, 18155 => 1)){
 quest::say("Mail from the front - thank you very much!  Please take this gold for your troubles.  If you are interested in more work, just ask Ton Twostring.");
 quest::faction(192,10);
 quest::faction(184,10); 
 quest::faction(135,10);  
 quest::faction(273,-10); 
 quest::faction(207,-10); 
  quest::ding(); quest::exp(50);
 quest::givecash(0,0,9,0);
 }
 #Hand in Bardic Letter (Freeport)
 elsif(plugin::check_handin(\%itemcount, 18164 => 1)){
 quest::say("Mail from the front - thank you very much!  Please take this gold for your troubles.  If you are interested in more work, just ask Ton Twostring.");
 quest::faction(192,15);
 quest::faction(184,15); 
 quest::faction(135,15);  
 quest::faction(273,-15); 
 quest::faction(207,-15); 
  quest::ding(); quest::exp(115);
 quest::givecash(0,0,12,0);
 
 
 } else { 
  #do all other handins first with plugin, then let it do disciplines
  quest::say("I have no need for this item $name, you can have it back.");
  plugin::return_items(\%itemcount);
 }
}
#END of FILE Zone:freportn  ID:8102 -- Felisity_Starbright
