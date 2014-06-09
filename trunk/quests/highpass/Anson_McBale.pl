#############
#NPC: Anson_McBale
#Quest Name: Ragebringer, Rogue Epic Quest
#Quest by: Solid11
#Revised: Olhadon
#NPCs Involved: Stanos Herkanor
#Items Involved: Stanos' Pouch ID:28014,
#zone: highpass

sub EVENT_COMBAT{
    my $random_result = int(rand(100));
    if(($combat_state == 1) &&($random_result<=25)){
    # Do nothing
    }elsif(($combat_state == 1) &&($random_result<=50)){
    quest::say("Filth like you must die!");
    }elsif(($combat_state == 1) &&($random_result<=75)){
    quest::say("Filth like you are better left dead than alive.");
    }elsif(($combat_state == 1) &&($random_result<=100)){
    quest::say("It's Filth like you who have ruined your own lands, You'll not ruin mine!");}
}

sub EVENT_ATTACK {
  quest::say("Time to die $name.");
}

sub EVENT_SAY {
  if($text=~/hail/i) {
      #quest::emote("looks at you suspiciously.");
      #quest::say("Yeah? Whacha want?");
	  quest::say("Beat it, $name, unless you have something for me.");
  }
  elsif($text=~/who are you/i) {
      quest::say("Just who the flip do you THINK I am? Oh, you want my biography? $name, you are standing on my last nerve. Old man delight in telling tales about themselves. Me, I'm busy living those tales at the moment. If I am still here in thirty years, ask me then.");
  }
		
  if($text=~/i need to s(ee|peak).*?stanos/i){
    # To make Rogue only, add in ($class eq "Rogue") to the if statement
    if($ulevel >= 50) {
	  quest::say("This better be important.");
      #Stanos Herkanor
      quest::unique_spawn(5088,0,0,336.4,10.3,45.7,225.1);
    }
	else {
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
  }
}
sub EVENT_ITEM {
  # To make Rogue only, add in ($class eq "Rogue") to the if statement
  if($ulevel >= 45){
    #Stanos' Pouch ID:28014
    if(plugin::check_handin(\%itemcount, 28014 => 1)){
      quest::say("Ah, we have been expecting this. Let me get Stanos, he will want to inspect it first, but here are your coins.");
      quest::faction(149,10); #Highpass Guards
      quest::faction(31,20);  #Carson McGabe
      quest::faction(214,10); #Merchants of Highpass
      quest::faction(53,10);  #Corrupt Qeynos Guards
      quest::faction(105,10); #The Freeport Militia
      quest::ding(); quest::exp(100000);
      quest::givecash(0,0,100,25);
      #Stanos Herkanor
      quest::unique_spawn(5088,0,0,336.4,10.3,45.7,225.1);
    }
  } 
  else {
    quest::emote("I have no need for this $name, you can have it back.");
    plugin::return_items(\%itemcount);
    }
 }
 
sub EVENT_SIGNAL {
  if ($signal == 1) {
    quest::say("Vilnius has always had a good eye for talent. I think we can trust this one. But will he trust us? You have to wonder if he even knows [who we are]. . .");
    #signal to Stanos to continue banter.
    quest::signalwith(5088, 1, 2);
  }
}

#END of FILE  Quest by: Solid11  Zone:highpass  ID:5037 -- Anson_McBale

