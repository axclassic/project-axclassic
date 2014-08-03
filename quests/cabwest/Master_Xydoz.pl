sub EVENT_SAY {
my $new = quest::saylink("new", 1);
my $sarnak = quest::saylink("sarnak", 1);
my $faded = quest::saylink("faded", 1);
my $tailoring = quest::saylink("tailoring", 1);
  if ($text=~/hail/i) {
    quest::say("What is it you seek within the tower ? Could it be that you are a $new apprentice ? If so, you are required to don the apprentice skullcap.");  
  }
  if ($text=~/new/i){
    quest::say("All new members of the Brood of Kotiz are required to don the apprentice skullcap. To earn one, a new apprentice is required to fetch four brains for further experiments. Not just any four brains, mind you, but the brains of $sarnak hatchlings.");
    quest::say("Once you have your fist level apperntice cap, you may move on and aquire your $second level apprentice cap.");  
  } 
  if ($text=~/sarnak/i) {
    quest::say("Sarnak ? Do not speak loudly, that name. If you seek information on the sarnak, read the tome of this tower. The tower librarian should be found within.");  
  }
  if ($text=~/second/i) {
    quest::say("Looking for the second rank skullcap ? Look no further, but be prepared to earn it. I seek a $faded tapestry. Now, too, so do you.");
  }
  if ($text=~/faded/i) {
    quest::say("I have heard reports of such a thing found upon Sarnak hatchlings. They must have scampered from the safety of their dwelling with their master's property. I would like to see this tapestry, but only when it has been mended. I need find a necromancer who is adept at $tailoring."); 
  }
  if ($text=~/tailoring/i) {
    quest::say("If you are a member of the Brood and wish to assist you may seek out this tapestry. Find the Torn and Ripped pieces and take them both to a sewing kit. Return with the mended tapestry and your first rank skullcap and I shall see that you are rewarded with coin and a second rank skullcap");
  }
}

# 4 sarnak hatchling brains, returns necro skull cap 1, raises brood of kotiz and legions of cabilis
# mended tapestry + necro skull cap1, raises brood of kotiz and legions of cabilis
sub EVENT_ITEM {
my $second = quest::saylink("second", 1);
  if ($itemcount{12408}==4) { 
    quest::say("Good work, my young apprentice. You will make a fine addition to our ranks. Here is your first apprentice skullcap. Wear it as a sign of our circle. Do not lose it. Someday you shall wear a necromancer skullcap, but next shall come the $second rank skullcap."); 
     quest::ding(); quest::exp(100); 
    quest::faction(193,20);
    quest::faction(24,20);
    quest::summonitem(4260);
  }
  elsif ($itemcount{4260}==1 && $itemcount{18208}==1) {
    quest::say("A job well done, apprentice. Your fine service shall earn you the second circle apprentice skullcap. I would advise you to forget this tapestry, it is nothing more than an ancient rug of no importance.");
    quest::say("I can do nothing more for you $name. Seek out Master Rixiz for further training.");
	quest::ding(); quest::exp(120); 
    quest::faction(193,20);
    quest::faction(24,20);
    quest::summonitem(4261);
  }
  else {
  plugin::try_tome_handins(\%itemcount, $class, 'Necromancer');
   quest::say("I have no use for this.");
   plugin::return_items(\%itemcount);
   }
}

#END of FILE Zone:cabwest  ID:3435 -- Master_Xydoz 

