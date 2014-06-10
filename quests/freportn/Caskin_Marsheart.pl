sub EVENT_ITEM { 
 if(plugin::check_handin(\%itemcount, 18747 => 1)){
	quest::say("Welcome to the guild. here's your guild tunic. Now. let's get to work.");
	quest::summonitem(13571); #Colorfully Patched Tunic
	quest::ding();
	quest::faction(322, 1); #The Dead
	quest::faction(165, -1); #Karana
	quest::faction(149, -1); # Highpass Guards
	quest::faction(316, 1); #Storm Reapers
	quest::exp(100);
 }
   else {
   #do all other handins first with plugin, then let it do disciplines
   plugin::try_tome_handins(\%itemcount, $class, 'Bard');
   quest::say("I have no use for this.");
   plugin::return_items(\%itemcount);
   }
}
#END of FILE Zone:freportn  ID:8066 -- Caskin_Marsheart 

