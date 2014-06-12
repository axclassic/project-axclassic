sub EVENT_ITEM { 
 if(plugin::check_handin(\%itemcount, 18747 => 1)){
	quest::say("Welcome to the guild. here's your guild tunic. Now. let's get to work.");
	quest::summonitem(13571); #Colorfully Patched Tunic
	quest::ding();
	quest::faction(135, 10); #Guards of Qeynos
	quest::faction(184, 10); #Knights of Truth
	quest::faction(192, 10); #League of Antonican Bards
	quest::faction(207, -30); #Mayong Mistmoore
	quest::faction(273, -30); #Ring of Scale
	quest::exp(1000);
 }
   else {
   #do all other handins first with plugin, then let it do disciplines
   plugin::try_tome_handins(\%itemcount, $class, 'Bard');
   quest::say("I have no use for this.");
   plugin::return_items(\%itemcount);
   }
}
#END of FILE Zone:freportn  ID:8066 -- Caskin_Marsheart 

