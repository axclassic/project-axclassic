#Warlord_Gligoth.pl
#Warrior Tomes/Planar Armor Exchange

sub EVENT_SAY {
    if($text=~/Hail/i) {
        quest::emote("glares coldly, his mouth twisted in a gruesome sneer of disgust. 'Kartis is place of shadow, not gud for light crawlers. But yu here, yu want something from shadow? Yes, yu want shadow to teach yu - yu want shadow to feed yu secrets, but yu will only fuel shadow's power in learning from it. If yu still want to stay in Kartis, then yu will only give power to shadow that yu say yu hate. I will teach yu, light crawler, if yu still tink yu can outsmart shadow's soldiers. I'll make that puny stick-thing yu light crawlers call weapons into fierce tools of war and no matter who dey kill, yu will kill in the shadow's name.'");
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
            $client->Message(14, "I don't need this $name. Take it back.");
            plugin::return_items(\%itemcount);
        }
        if($platinum != 0 || $gold !=0 || $silver != 0 || $copper != 0) {
            $client->Message(14, "Thanks for the coin!");
        }
    }
}
#END of FILE Zone:poknowledge  ID:202261 -- Warlord_Gligoth