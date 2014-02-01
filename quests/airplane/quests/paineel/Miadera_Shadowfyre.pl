sub EVENT_SAY { 
  if($text=~/Hail/i){
quest::say("Ahhhahahaha! The terror that lays over this city like a blanket tingles my bones with vigor. I seek a fellow apostle of Cazic-Thule to assist me in the [summoning of Terror].");
}

  if($text=~/summoning of terror/i){
quest::say("It will be a frightfully fulfilling summons, but to do it, I need an Eye of Urd, some Basalt Drake Scales, the Lens of Lord Soptyvr, and a lock of Widowmistress Hair. Bring me these, and I will show you a true instrument of fright.");
  }

}

sub EVENT_ITEM { 
    if (plugin::check_handin(\%itemcount, 10523=>1, 19032=>1, 14110=>1, 14109=>1  )) {
quest::say("And now, behold something truly frightening! This mask ensures the coming of the Frightful One, Cazic-Thule!");
                          # Fanfare
    quest::ding(); quest::exp("300480");               # Approximately 1/40th of level 40
    quest::summonitem("14108");         # Terror Forged Mask
    quest::faction("56","-150");        # Craftkeepers
    quest::faction("60","-150");        # Crimson Hands
    quest::faction("143","450");        # Heretics
    quest::faction("79","-150");        # Deepwater Knights
    quest::faction("112","-150");       # Gate Callers
    }
    
  else {
    quest::say("I have no need for this.");
    plugin::return_items(\%itemcount);
  }
}
#END of FILE Zone:paineel  ID:75070 -- Miadera_Shadowfyre 

