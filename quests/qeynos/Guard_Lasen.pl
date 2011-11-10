#############
#NPC: Guard_Lasen
#Quest Name:
#Quest by: 
#Revised: Olhadon
#NPCs Involved: Lieutenant_Arathur
#Items Involved: 
#zone: qeynos

sub EVENT_SAY {
  if($text=~/Hail/i){
    quest::say("Greetings, $name! Whew! I sure get parched out here on patrol. Even when it rains I can't help but build up a [thirst] defending the good people of Qeynos.");
  }
  elsif($text=~/Are.*?thirsty/i){
    quest::say("Well, I have a bit of a belly sickness so the only thing I can drink is normal water. I can't even keep down the stuff our local magicians summon and call water. If you would bring me a water flask, I would be most grateful.");
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
  #Water Flask ID:13006
  my $flask = 0;
  if (plugin::check_handin(\%itemcount,13006=>4)) {
    $flask=4;
  }
  elsif (plugin::check_handin(\%itemcount,13006=>3)) {
    $flask=3;
  } 
  elsif (plugin::check_handin(\%itemcount,13006=>2)) {
    $flask=2;
  } 
  elsif (plugin::check_handin(\%itemcount,13006=>1)) {
    $flask=1;
  }
  if ($flask>=1) {
    for ($i=0; $i<$flask; $i++) {
      quest::say("Oh, thank you so much!' Lasen brings the drink to his lips and ravenously drinks the bottl's entire contents, 'Aaaaah. Here, please take this reward for your kindness. Also take my advice, do not go exploring beneath Qeynos unless you bring friends. I have seen too many like you enter the aqueducts alone, never to return.");
      quest::faction("135","4");  #Guards of Qeynos
      quest::faction("9","4");    #Antonius Bayle
      quest::faction("53","-5");	#Corrupt Qeynos Guards
      quest::faction("33","-5");	#Circle Of Unseen Hands
      quest::faction("217","4");	#Merchants of Qeynos
      quest::ding(); quest::exp("200");
      quest::givecash(rand(20),"0","0","0");# Random from 20cp
    }
  }
  else{
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

#END of FILE Zone:qeynos  ID:1150 -- Guard_Lasen

