#############
#NPC: Brigadier_G-tav
#Quest Name: Ragebringer, Rogue Epic Quest
#Quest by: 
#Revised: Olhadon
#NPCs Involved: General_V`ghera
#Items Involved: Sealed Box ID:28057
#zone: kithicor

sub EVENT_COMBAT{
  my $random_result = int(rand(150));
  if(($combat_state == 1) &&($random_result<=25)){
    quest::say("Come feel the unholy power of Innoruuk!!");
  }elsif(($combat_state == 1) &&($random_result<=50)){
    quest::say("Your head will make a fine trophy in the halls of the Indigo Brotherhood.");
  }elsif(($combat_state == 1) &&($random_result<=75)){
    quest::say("Come!! Let me flay your skin!!");
  }elsif(($combat_state == 1) &&($random_result<=100)){
    quest::say("Prepare to be gutted like a fish.");
  }elsif(($combat_state == 1) &&($random_result<=125)){
    quest::say("Kill!! Kill!! Kill!! For Queen Cristanos!!");
  }elsif(($combat_state == 1) &&($random_result<=150)){
    quest::say("Heretic!! The power of Innoruuk shall smite thee!!");
  }
}

sub EVENT_ITEM {
  if($ulevel >= 50) {
    # Sealed Box ID:28057
    if(plugin::check_handin(\%itemcount, 28057 => 1)) {
      quest::say("The general will want to look at this, Wait here.");
	  #Depops #General_V`ghera ID:20252
	  quest::depop(20252);
	  #Spawns General_V'ghera ID:20205
      quest::unique_spawn(20205,0,0,2316,797.5,272.8,195.1);
	  #signal to General_V`ghera to add quest item to loot.
      quest::signalwith(20205, 1, 1);
    }
  }
}

#END of FILE Zone: kithicor  ID:20061 -- Brigadier_G-tav

