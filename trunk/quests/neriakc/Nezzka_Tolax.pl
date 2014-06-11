sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 18757 => 1)) { #A tattered note
    quest::say("Welcome young $race. Here, take this and use it wisely."); #Text made up
    quest::summonitem(13586); #Black Training Tunic
	quest::ding();
	quest::faction(322, 10); #The Dead
	quest::faction(268, 10); #Queen Cristanos Thex
	quest::faction(91, -30); # Eldritch Collective
	quest::faction(170, -30); #Keepers of the Art
	quest::faction(177, -30); #King Naythox Thex
	quest::exp(1000);
  }
  else {
    #do all other handins first with plugin, then let it do disciplines
    plugin::try_tome_handins(\%itemcount, $class, 'Shadowknight');
    plugin::return_items(\%itemcount);
  }
}
#END of FILE Zone:neriakc  ID:42069 -- Nezzka_Tolax 
