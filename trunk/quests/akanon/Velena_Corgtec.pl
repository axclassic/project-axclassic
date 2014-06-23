################################### 
#Zone: Ak`Anon                    #                                              
#Short Name: akanon               #                                                                  
#Zone ID: 55                      #                                        
###################################                                             
#NPC Name: Velena_Corgtec         #                             
#NPC ID: 55119                    #                                      
###################################
sub EVENT_SAY { 
if ($text=~/Hail/i){
quest::say("Hail."); }
}
sub EVENT_ITEM { 
  if (plugin::check_handin(\%itemcount, 119854 => 1)) { #Old Folded Letter
   quest::say("Welcome $name. I am Eonis Mornunder, wizard guild master of the Dark Reflection. I train young gnomes that feel the calling of the Plaguelord, Bertoxxulous, and wish to serve the Dark Reflection.");
   quest::say("Take this robe and wear it proudly as a appretice in guild.");
   quest::say("Return to me  when you are in need of further instruction.");
   quest::summonitem(13524); #Dark Gold Felt Robe*
   quest::faction(71,10); #Dark Reflection
   quest::faction(76,-10); #Deep Muses
   quest::faction(91,-10); #Eldritch Collective
   quest::faction(115,-10); #Gem Choppers
   quest::ding();
   quest::exp(1000);
  }
  else
    {
	#Do all other handins first With plugin, then let it Do disciplines
    plugin::try_tome_handins(\%itemcount, $class, 'Wizard');
    quest::say("I have no use for these $name.");
    plugin::return_items(\%itemcount);
    }
 }
 

