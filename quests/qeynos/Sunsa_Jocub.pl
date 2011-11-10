#############
#NPC: Sunsa_Jocub
#Quest Name:
#Quest by: 
#Revised: Olhadon
#NPCs Involved: Trumpy_Irontoe
#Items Involved: 
#zone: qeynos

sub EVENT_ITEM {
  quest::emote("I have no need for this $name, you can have it back.");
  plugin::return_items(\%itemcount);
}

sub EVENT_SIGNAL {
  #response to Trumpy_Irontoe
  if ($signal == 1) {
    quest::say("Trumpy, you are one sick little man!");
	# Send signal to Trumpy_Irontoe to continue banter
    quest::signalwith(1042, 1, 2);
  }
}

#END of FILE Zone:qeynos  ID:1074 -- Sunsa_Jocub 

