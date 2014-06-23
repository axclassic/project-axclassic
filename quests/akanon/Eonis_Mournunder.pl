################################### 
#Zone: Ak`Anon                    #                                              
#Short Name: akanon               #                                                                  
#Zone ID: 55                      #                                        
###################################                                             
#NPC Name: Eonis_Mournunder       #                             
#NPC ID: 55126                    #
#Quest Status: Complete           #                                      
###################################
sub EVENT_SAY { 
 if($text=~/Hail/i) {
	quest::say("Hail.");
 }
 }
sub EVENT_ITEM { 
 if (plugin::check_handin(\%itemcount, 18771 => 1) && $class eq "Necromancer") { #Stained Letter
   quest::say("Welcome $name. I am Eonis Mornunder, necromancer guild master of the Dark Reflection. I train young gnomes that feel the calling of the Plaguelord, Bertoxxulous, and wish to serve the Dark Reflection.");
   quest::say("Take this robe and wear it proudly as a appretice in guild.");
   quest::say("Return to me  when you are in need of further instruction.");
   quest::summonitem(119863); #Dark Gold Robe*
   quest::ding();
   quest::faction(71,10); #Dark Reflection
   quest::faction(76,-10); #Deep Muses
   quest::faction(91,-10); #Eldritch Collective
   quest::faction(115,-10); #Gem Choppers
   quest::exp(1000);
 }
  else
    {
	#Do all other handins first With plugin, then let it Do disciplines
    plugin::try_tome_handins(\%itemcount, $class, 'Necromancer');
    quest::say("I have no use for these $name.");
    plugin::return_items(\%itemcount);
    }
 }
 

