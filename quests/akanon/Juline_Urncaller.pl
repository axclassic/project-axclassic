################################### 
#Zone: Ak`Anon                    #                                              
#Short Name: akanon               #                                                                  
#Zone ID: 55                      #                                        
###################################                                             
#NPC Name: Juline_Urncaller       #                             
#NPC ID: 55132                    #
#Quest Status: Complete           #                                      
###################################
sub EVENT_SAY { 
if ($text=~/Hail/i){
quest::say("Hail."); }
}
sub EVENT_ITEM { 
if(plugin::check_handin(\%itemcount, 18773 => 1)) { #Registration Letter
   quest::say("Welcome to the Library Mechanamagica young Enchanter. You are expected to serve his majesty, King Ak'Anon with pride. You have much to learn.") ;
   quest::say("You can report to any of the enchanter trainers for further guidance.");
   quest::say("Go forth and serve.") ; 
   quest::summonitem(13522); #Dirty Gold Felt Robe*
   quest::ding();
   quest::faction(91,10); #Eldritch Collective
   quest::faction(115,10); #Gem Choppers
   quest::faction(176,10); #King Ak'Anon
   quest::faction(210,10); #Merchants of Ak'Anon
   quest::faction(71,-10); #Dark Reflection
   quest::faction(322,-10); #The Dead
   quest::exp(1000);
}
  else
    {
	#Do all other handins first With plugin, then let it Do disciplines
    plugin::try_tome_handins(\%itemcount, $class, 'Enchanter');
    quest::say("I have no use for these $name.");
    plugin::return_items(\%itemcount);
    }
 }



