#############
#NPC: Guard_Calik
#Quest Name:
#Quest by: 
#Revised: Olhadon
#NPCs Involved: Lieutenant_Arathur
#Items Involved: 
#zone: qeynos

sub EVENT_SAY {
  if($text=~/Hail/i){
    quest::say("Hail, $name! Have you tested your mettle on the Grounds of Fate yet? Thet are here in South Qeynos and there is always someone there looking for a challenging opponent. Beware, though, once you are on the arena floor you are fair game to anyone who wishes to have your head on their pike.");
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
 
#END of FILE Zone:qeynos  ID:1149 -- Guard_Calik

