#############
#NPC: Guard_Cyrillian
#Quest Name:
#Quest by: 
#Revised: Olhadon
#NPCs Involved: Lieutenant_Arathur
#Items Involved: 
#zone: qeynos

sub EVENT_SAY {
  if($text=~/Hail/i){
    if ($faction == 5) {
      quest::say("You need to prove your dedication to our cause before I can discuss such matters with you.");
    }
    elsif ($faction >= 6) {
      my $random_result = int(rand(125));
      if($random_result<=25){
        quest::say("Go away! We don't have time for the likes of you.");
      }elsif($random_result<=50){
        quest::say("Is that your BREATH..or did something die in here..now go away!");
      }elsif($random_result<=75){
        quest::say("I didn't know Slime could speak common..go back to the sewer before I lose my temper.");
      }elsif($random_result<=100){
        quest::say("I wonder how much I could get for the tongue of a blithering fool..leave before I decide to find out for myself.");
      }elsif($random_result<=125){
        quest::say("Oh look..a talking lump of refuse..how novel!");
      }
    }
    else{
    # I don't know what the text is if faction is above indifferent.
    quest::say("Hail! If you had any smarts at all you would be careful who you talk to around here.");
    }
  }
}

sub EVENT_COMBAT{
  my $random_result = int(rand(100));
  if(($combat_state == 1) &&($random_result<=50)){
    quest::say("Time to die $name.!");
  }elsif(($combat_state == 1) &&($random_result<50)){
    quest::say("How I loath to soil my blade with such filth.");
  }
}

sub EVENT_ITEM {
  quest::emote("I have no need for this $name, you can have it back.");
  plugin::return_items(\%itemcount);
}

sub EVENT_SIGNAL {
  #response to Lieutenant_Arathur
  if ($signal == 1) {
    # Lieutenant Arathur ID:1085
    my $npc_checkID = 1085;
    my $mob_check = $entity_list->GetMobByNpcTypeID($npc_checkID);
    my $mobX = int($mob_check->GetX());
    my $mobY = int($mob_check->GetY());
    my $mobZ = int($mob_check->GetZ());

    # get distance from npc
    my $npc_dist = int($npc->CalculateDistance($mobX, $mobY, $mobZ));
	
    #Checking if within range of Lieutenant_Arathur to respond.
    if ($npc_dist <= 105) {
      quest::say("Yes, sir!");
    }
  }
}
 
#END of FILE Zone:qeynos  ID:1006 -- Guard_Cyrillian

