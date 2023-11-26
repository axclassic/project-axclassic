#Miadera_Shadowfyre (75070)

sub EVENT_SAY {
    my $Terror = quest::saylink("Terror", 1);
    my $Eye = quest::saylink("Eye", 1);
    my $Scales = quest::saylink("Scales", 1);
    my $Lens = quest::saylink("Lens", 1);
    my $Hair = quest::saylink("Hair", 1);

    if($text=~/Hail/i) {
        if($faction <= 4) {
            quest::say("Ahhhahahaha! The terror that lays over this city like a blanket tingles my bones with vigor. I seek a fellow apostle of Cazic-Thule to assist me in the summoning of $Terror.");
        }
        else {
            quest::say("Begone from this place! Infidels like you have no place among the faithful of Cazic-Thule! I sense the potential to learn the ways of fear within you. Continue striving to master your fear and one day perhaps you can be of service to our Lord Cazic-Thule.");
        }
    }
    if($text=~/Terror/i) {
        if($faction <= 4) {
            quest::say("It will be a frightfully fulfilling summons, but to do it, I need an $Eye of Urd, some Basalt Drake $Scales, the $Lens of Lord Soptyvr, and a lock of Widowmistress $Hair. Bring me these, and I will show you a true instrument of fright.");
        }
        else {
            quest::say("I sense the potential to learn the ways of fear within you. Continue striving to master your fear and one day perhaps you can be of service to our Lord Cazic-Thule.");
        }
    }
    if($text=~/Eye/i) {
        if($faction <= 4) {
            quest::say("The eye of Urd may be found on Urd Ghoul Wizards in Lower Guk.");
        }
    }
    if($text=~/Scales/i) {
        if($faction <= 4) {
            quest::say("The Drakes can be found in either Rathe Mountains or the Western Wastelands.");
        }
    }
    if($text=~/Lens/i) {
        if($faction <= 4) {
            quest::say("The lens can only be collected from one creature, make your way to the Gorge of King Xorbb. There you must slay Lord Soptyvr and return to me with its Lens.");
        }
    }
    if($text=~/Hair/i) {
        if($faction <= 4) {
            quest::say("The lock of hair I require comes from The Widowmistress In Najena. Slay her and return to me with a lock of her hair.");
        }
    }
}

sub EVENT_ITEM {
    if($faction <= 4) {
        if(plugin::check_handin(\%itemcount, 10523=>1, 19032=>1, 14110=>1, 14109=>1)) {
            quest::say("And now, behold something truly frightening! This mask ensures the coming of the Frightful One, Cazic-Thule!");
            quest::ding();
            quest::exp("300480");               # Approximately 1/40th of level 40
            quest::summonitem("14106");         # Mundane Mask
            quest::faction("56","-200");        # Craftkeepers
            quest::faction("60","-200");        # Crimson Hands
            quest::faction("143","200");        # Heretics
            quest::faction("79","-200");        # Deepwater Knights
            quest::faction("112","-200");       # Gate Callers
            quest::spawn2(75195,0,0,471.6,1233.2,-37.9,126.8);
        }
        else {
            #do all other handins first with plugin, then let it do disciplines
            plugin::try_tome_handins(\%itemcount, $class, 'Cleric');
            plugin::return_items(\%itemcount);
            quest::say("I have no need of this, take it back.");
        }
    }
    else {
        #do all other handins first with plugin, then let it do disciplines
        plugin::try_tome_handins(\%itemcount, $class, 'Cleric');
        plugin::return_items(\%itemcount);
        quest::say("I have no need of this, take it back.");
    }
}
#END of FILE Zone:paineel  ID:75070 -- Miadera_Shadowfyre
