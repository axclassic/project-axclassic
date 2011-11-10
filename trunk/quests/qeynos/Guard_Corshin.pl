#############
#NPC: Guard_Corshin
#Quest Name:
#Quest by: 
#Revised: Olhadon
#NPCs Involved: Guard_Beren, Trumpy_Irontoe 
#Items Involved: 
#zone: qeynos

sub EVENT_SAY { 
  if($text=~/Hail/i){
    quest::say("Hail, $name!  Guard Corshin Kiniss, at your service. You should be careful in Qeynos after dark. We have had several [bodies] wash up under the docks over the past few weeks. We wouldn't want anything to happen to you.");
    #checking to see if Guard_Beren is spawned and send signal
	  my $npccheck = $entity_list->GetMobByNpcTypeID(1090);
    if ($npccheck != 0) {
      quest::signalwith(1090, 4, 2);
    }	
  }
  elsif($text=~/what bodies/i){
    quest::say("We think the bodies are washing out of the aqueducts beneath Qeynos. It is a dangerous place to go and Commander Bayle refuses to send regular patrols down there.");
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
  #response to Guard_Beren
  elsif ($signal == 2) {
    quest::say("Shhhhh. What are you, crazy?! I saw Kane talking to him yesterday. I sure don't want to find you washed up under the docks because of that little gnoll dropping.");
  }
}
 
#END of FILE Zone:qeynos  ID:1091 -- Guard_Corshin 

