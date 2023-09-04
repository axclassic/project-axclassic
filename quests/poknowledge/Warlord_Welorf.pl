#Warlord_Welorf.pl
#Warrior Tomes/Planar Armor Exchange

sub EVENT_SAY {
    if($text=~/Hail/i) {
        quest::emote("gathers a deep breath, his body seeming unnaturally stiff within the large suit of iron. His cold, steely eyes glance over you once before addressing you in a low, baritone voice. 'You stand before Welorf, Warlord of the North and former chief of the Steel Warrior's clan. Should you be a warrior, the knowledge of my blade is at your reach and perhaps in time, and with some training, a proper warrior can borne of the weak creature I see before me.'");
    }
}
sub EVENT_ITEM {
    if((plugin::check_handin(\%itemcount, 4911 => 1)) ||
       (plugin::check_handin(\%itemcount, 4912 => 1)) ||
       (plugin::check_handin(\%itemcount, 4913 => 1)) ||
       (plugin::check_handin(\%itemcount, 4914 => 1)) ||
       (plugin::check_handin(\%itemcount, 4915 => 1)) ||
       (plugin::check_handin(\%itemcount, 4916 => 1)) ||
       (plugin::check_handin(\%itemcount, 4917 => 1))) {
#Indicolite Armor
        quest::say("Thank you, $name.");#Text made up
        quest::summonitem(quest::ChooseRandom(10028, 10037, 22503, 15981));#Random gem: Peridot, Diamond, Blue Diamond, Raw Diamond
        quest::exp(698775);
    }
    else {
        plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
        my $stuff = (\%itemcount);
        my $yes = 2;
        foreach my $k (keys(%{$stuff})) {
            next if($k == 0);
            $yes = 1;
        }
        if($yes == 1) {
            quest::say("I don't need this $name. Take it back.");
            plugin::return_items(\%itemcount);
        }
        if($platinum != 0 || $gold !=0 || $silver != 0 || $copper != 0) {
            quest::say("Thanks for the coin!");
        }
    }
}
#END of FILE Zone:poknowledge  ID:202250 -- Warlord_Welorf