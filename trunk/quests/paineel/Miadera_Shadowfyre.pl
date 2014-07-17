sub EVENT_SAY { 
my $Terror = quest::saylink("Terror", 1);
my $Eye = quest::saylink("Eye", 1);
my $Scales = quest::saylink("Scales", 1);
my $Lens = quest::saylink("Lens", 1);
my $Hair = quest::saylink("Hair", 1);
  if($text=~/Hail/i){
quest::say("Ahhhahahaha! The terror that lays over this city like a blanket tingles my bones with vigor. I seek a fellow apostle of Cazic-Thule to assist me in the summoning of $Terror.");
}
  if($text=~/Terror/i){
quest::say("It will be a frightfully fulfilling summons, but to do it, I need an $Eye of Urd, some Basalt Drake $Scales, the $Lens of Lord Soptyvr, and a lock of Widowmistress $Hair. Bring me these, and I will show you a true instrument of fright.");
}
  if($text=~/Eye/i){
quest::say("The eye of Urd may be found on Urd Ghoul Wizards in Lower Guk.");
  }
    if($text=~/Scales/i){
quest::say("The Drakes can be found in either Rathe Mountains or the Western Wastelands.");
  }
      if($text=~/Lens/i){
quest::say("The lens can only be collected from one creature, make your way to the Gorge of King Xorbb. There you must slay Lord Soptyvr and return to me with its Lens.");
  }
        if($text=~/Hair/i){
quest::say("The lock of hair I require comes from The Widowmistress In Najena. Slay her and return to me with a lock of her hair.");
  }
}

sub EVENT_ITEM { 
    if (plugin::check_handin(\%itemcount, 10523=>1, 19032=>1, 14110=>1, 14109=>1  )) {
    quest::say("And now, behold something truly frightening! This mask ensures the coming of the Frightful One, Cazic-Thule!");
    quest::ding();
	quest::exp("300480");               # Approximately 1/40th of level 40
    quest::summonitem("14108");         # Terror Forged Mask
    quest::faction("56","-150");        # Craftkeepers
    quest::faction("60","-150");        # Crimson Hands
    quest::faction("143","450");        # Heretics
    quest::faction("79","-150");        # Deepwater Knights
    quest::faction("112","-150");       # Gate Callers
    }
    
 else { 
    #do all other handins first with plugin, then let it do disciplines
    plugin::try_tome_handins(\%itemcount, $class, 'Cleric');
    plugin::return_items(\%itemcount);
    quest::say("I have no need of this, take it back.");
 }
}
#END of FILE Zone:paineel  ID:75070 -- Miadera_Shadowfyre 

