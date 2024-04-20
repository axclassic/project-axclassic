# Cobalt Scar (cobaltscar) >> an_outcast_siren (117038)

sub EVENT_SAY { 
  if($text=~/Hail/i){
    quest::say("Leave me alone, beast, or I will cut your belly open and feed your entrails to the sharks.");
  }
}

sub EVENT_ITEM {
  # Handin: Mechanical Net
  if(plugin::check_handin(\%itemcount, 25107 => 1)) {
    quest::say("So you are the servant of Wenglawks here to retrieve his cloak. I will need more scales to make the cloak in his size. I have already slaughtered a good thirty sirens and the cloak is nearly complete. Go forth and slaughter my kind and bring me the finest scales you can find. Let this idol your protection from the wrath of E`ci. I will continue my work on the cloak.");
    # Summon: Idol of Solusek Ro
    quest::summonitem(25108);
    quest::ding(); quest::exp(1000);
   }
  # Handin: 3 Excellent Siren Scales and the Idol of Solusek Ro
  elsif(plugin::check_handin(\%itemcount, 25108 => 1, 25109 => 3)){
    quest::say("You are an excellent hunter. Tell me, did you enjoy the screams of the sirens as they perished? I find the sound so wonderful.");
    quest::emote(" hands you a gigantic cloak made of slick siren scales.");
    quest::say("I was done making the cloak already. I just wanted to watch you slay the weak. I thank you for bringing more suffering into the world.");
    quest::ding(); quest::exp(1000);
    # Summon: Giant Siren Scale Cloak
    quest::summonitem(25110);
   }
}

#END of FILE Zone:cobaltscar  an_outcast_siren (117038)

