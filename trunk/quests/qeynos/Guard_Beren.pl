#############
#NPC: Guard_Berem
#Quest Name:
#Quest by: 
#Revised: Olhadon
#NPCs Involved: Faren, Trumpy _rontoe
#Items Involved: 
#zone: qeynos

sub EVENT_SAY { 
  if($text=~/Hail/i){
    quest::say("What do you want? Are you friends with that lousy [dwarf]?! You had better not be unless you want to spend the rest of the week bleeding!");
  }
  elsif($text=~/who.*?brother/i){
    quest::say("My brother Faren is a fine fisherman just like our father was. he fishes out there on the East Dock just about every day.");
  }
  elsif($text=~/who.*?Trumpy/i || $text=~/what.*?dwarf/i){
    quest::say("That dwarf, Trumpy, who Corshin and I thinks is a friend of Commander Bayle's, keeps pestering my poor brother Faren. I have just about had enough of him and [his kind].");
  }
  elsif($text=~/what.*?his kind/i){
    quest::say("You know... thieves, drunks and murderers. Decent folk just don't have a chance anymore.");
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

sub EVENT_WAYPOINT {
  my $h = int($npc->GetHeading());
  if($wp == 22 && $h == 127) {
    #checking to see if Faren is spawned and send signal
    my $npccheck = $entity_list->GetMobByNpcTypeID(1159);
    if (!defined $npccheck){
      $npccheck = 0;
    }
    elsif ($npccheck != 0) {
      # Faren ID:1159
      my $mobX = int($npccheck->GetX());
      my $mobY = int($npccheck->GetY());
      my $newheading = $npc->CalculateHeadingToTarget($mobX, $mobY);
      my $x = $npc->GetX();
      my $y = $npc->GetY();
      my $z = $npc->GetZ();
      quest::say("How are they biting little brother?");
      quest::signalwith(1159, 3, 2);
      $npc->SetHeading($newheading);
      #$npc->GMMove($x, $y, $z, 63);
      if(!GetTarget()) {
        $npc->SetTarget(1159);
        $npc->FaceTarget(1159, "true");
      }
    }
  }
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
  elsif ($signal == 2 || $signal == 3){
    # Trumpy_Irontoe ID:1042
    my $npc_checkID = 1042;
    my $mob_check = $entity_list->GetMobByNpcTypeID($npc_checkID);
    my $mobX = int($mob_check->GetX());
    my $mobY = int($mob_check->GetY());
    my $mobZ = int($mob_check->GetZ());

    # get distance from npc
    my $npc_dist = int($npc->CalculateDistance($mobX, $mobY, $mobZ));
    
    #responses to Trumpy_Irontoe
    if ($npc_dist <= 75 && $signal == 2) {
      quest::say("Curse you, [Trumpy]!!!");
      #checking to see if Guard Corshin is spawned and send signal
      my $npccheck = $entity_list->GetMobByNpcTypeID(1091);
      if ($npccheck != 0) {
        quest::signalwith(1091, 2, 2);
      }
    }
    elsif ($npc_dist <= 75 && $signal == 3) {
      quest::say("If you ever talk that way about my [brother] again, I will throw your butt into the dungeon. I don't care who you know!");
      quest::signalwith(1042, 3, 2);
    }
  }
  #response to Guard_Corshin
  elsif ($signal == 4) {
    quest::say("Heh. Speak for yourself, Corshin. That one looks like a troublemaker to me.");
  }
  #response to Faren
  elsif ($signal == 5) {
    quest::say("Don't you worry about him! I will take care of [Trumpy] Irontoe once and for all!");
  }
}

#END of FILE Zone:qeynos  ID:1090 -- Guard_Beren

