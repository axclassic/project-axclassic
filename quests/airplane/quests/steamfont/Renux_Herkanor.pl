#############
#NPC: Renux_Herkanor
#Quest Name: Ragebringer, Rogue Epic Quest
#Quest by: Solid11
#Revised: Olhadon
#NPCs Involved: Yendar Starpyre, Stanos Herkanor
#Items Involved: Translated Parchment ID:18961
#zone: steamfont

sub EVENT_SPAWN {
  # setting timer to remove/add quest item
  quest::settimer(1, 1);
}

sub EVENT_TIMER {
  if($timer == 1) {
    # Remove item first, prevents multiple items from appearing
    $npc->RemoveItem(18961);
    #Translated Parchment ID:18961
    quest::addloot(18961, 1);
	quest::stoptimer(1);
  }
}
sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("BOO! I'm sure you didn't expect to see me here, but you've left quite a trail. Why did you go to all the trouble to get this scrap of parchment? What can be so important about it that Father would risk all for it? No matter, Hanns will figure it out. Now, will you tell me where to find Stanos?");
  }
  if($text=~/Stanos is in Highpass Hold/i) {
    quest::say("Excellent. Stanos shall meet his end, and soon. You, however, will not live another day. Can't have you warning him, now can I?");
    quest::attack($name);
  }
}
  
sub EVENT_DEATH {
    quest::say("<gasp> Tell Hanns I tried, and will love him always. Tell Father I will save a seat in Hell for him!");
}

#END of FILE  Quest by: Solid11  Zone:steamfont  ID:12032 -- Renux_Herkanor

