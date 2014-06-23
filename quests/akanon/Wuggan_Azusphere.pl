################################### 
#Zone: Ak`Anon                    #                                              
#Short Name: akanon               #                                                                  
#Zone ID: 55                      #                                        
###################################                                             
#NPC Name: Wuggan_Azusphere       #                             
#NPC ID: 55134                    #
#Quest Status: Complete           #                                      
###################################
sub EVENT_ITEM { 
if($itemcount{18772} == 1){ #Registration Letter
quest::say("Welcome to Library Mechanimagica.  I am Master Magician Wuggan Azusphere. and I will help to teach you the ways of summoning.") ;
quest::say("Here is our guild tunic. make us proud.");
quest::summonitem(13521); #Dusty Gold Robe*
quest::ding();
quest::faction(91,10); #Eldritch Collective
quest::faction(115,10); #Gem Choppers
quest::faction(210,10); #Merchants of Ak'Anon
quest::faction(176,10); #King Ak'Anon
quest::faction(71,-10); #Dark Reflection
quest::faction(322,-10); #The Dead
quest::exp(1000);
}
   else
    {
	#Do all other handins first With plugin, then let it Do disciplines
    plugin::try_tome_handins(\%itemcount, $class, 'Magician');
    quest::say("I have no use for these $name.");
    plugin::return_items(\%itemcount);
    }
 }
 


