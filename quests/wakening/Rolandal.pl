#######################################
## NPC: Rolandal
## Zone: Wakening Lands
## Quest: Ralgyn's Promise
## Associated with: Ralgyn & Kardakor
## Corrected response, factions, & questglobal
## Sept 8 2017 patrikpatrik
#######################################
sub EVENT_SAY {
	if ($faction <= 3) {
		if ($text=~/hail/i) {
			quest::say("It would be my guess that you present this to me in hopes to find out 
			more about the magics it possesses. Before I can do this I require some rare treasures 
			that you must present to me.");
		}
		if ($text=~/treasures/i) {
			quest::say("There are 3 items that I seek to continue my studies of some various and 
			musterious magics. Bring to me the teachings of a high ranking Kromzek that I hear goes 
			by the name of Gkrean, a chipped fang from a beast deep within the Cursed Necropolis. 
			Also for good measure, I require the Head of a Kromzek Staff Sergeant to prove to your 
			dedication to our cause. Present these 3 items to me along with your Talisman that you 
			wish to learn more about and I shall do my best to identify its origin for you.");
		}
	} else {
		if ($text=~/hail/i) {
			quest::say("Greetings, Traveler. I do not receive many visitors to my quarters here, 
			besides the occasional unfortunate treasure seeker that often will make for a good snack.");
		}
	}
}

sub EVENT_ITEM {
  if ($faction <= 3) {
      # 1861 : An old worn Talisman
      # 1864 : Teaching of Gkrean
      # 1865 : Head of Staff Sergeant Drioc
      # 1863 : A chipped fang
      if (plugin::check_handin(\%itemcount,1861=>1,1864=>1,1865=>1,1863=>1)) {
        quest::say("So you finally made it ! Head back to Ralgyn to get your reward.");
        quest::summonitem(1866); # 1866  Glanitar's Imbued Talisman
        quest::faction(362,20); # Yelinak
        quest::faction(42,20); # Claws of Veeshan
        quest::faction(189,-10); # Kromzek
		#quest::setglobal("CircletFalinkan", 2, 5, "F");
        quest::ding(); 
		quest::exp(100000);
        #quest::targlobal("CircletFalinkan","2","Y1",114002,$charid,114); # sets the global to 2 for Ralgyn in skyshrine
        
	  } else {
		plugin::return_items(\%itemcount); # return unused items
	  }
  }
}
#End of File, Zone:wakening  NPC:119104 -- Rolandal