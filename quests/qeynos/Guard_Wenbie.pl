#############
#NPC: Guard_Wenbie
#Quest Name:
#Quest by: 
#Revised: Olhadon
#NPCs Involved: Lieutenant_Arathur
#Items Involved: Muffin ID:13014
#zone: qeynos

sub EVENT_SAY {
  if($text=~/Hail/i) {
    quest::say("Hello, $name. What brings you to Qeynos? Must be the mighty fine muffins over at [Voleen's Bakery]. I just love those muffins!");
  }
  elsif($text=~/voleen's bakery/i) {
    quest::say("Oh, it will be easier for us both if I just show you where it is. Follow me. But be quick about it, because I have to get back to my patrol.");
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
  # Muffin ID:13014
  my $muffins = 0;
  if (plugin::check_handin(\%itemcount,13014=>4)) {
    $muffins=4;
  } 
  elsif (plugin::check_handin(\%itemcount,13014=>3)) {
    $muffins=3;
  }
  elsif (plugin::check_handin(\%itemcount,13014=>2)) {
    $muffins=2;
  }
  elsif (plugin::check_handin(\%itemcount,13014=>1)) {
    $muffins=1;
  }
  elsif ($muffins>=1) {
    for ($i=0; $i<$muffins; $i++) {
      quest::say("Oh, thank you so much. I do get hungry on patrol. Here, please take this reward for your kindness.");
      quest::faction(135,5);  #Guards of Qeynos
      quest::faction(9,5);    # Antonius Bayle
      quest::faction(217,5);  # Merchants of Qeynos
      quest::faction(53,-5);  # Corrupt Qeynos Guards
      quest::faction(33,-10); # Circle of the unseen hand
      quest::ding(); quest::exp(10);
      quest::givecash(0,0,0,4);
    }
  }
  else {
    quest::emote("I have no need for this $name, you can have it back.");
    plugin::return_items(\%itemcount);
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
}
 
#END of FILE zone:qeynos ID:1147 -- Guard_Wenbie.pl

