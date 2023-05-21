#Grandmaster_Limsa.pl
#Monk Tomes/Planar Armor Exchange

sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::emote("closes his eyes and gives a deep-seated bow before $name. 'Greetings, traveler. I am Grand Master Limsa, master of the tranquil order of the Tanaan district of the Plane of Knowledge. Monks of both Norrathian orders may approach me for guidance and knowledge through the long path of self-mastery and discipline.'");
    }
}

sub EVENT_ITEM {
    if((plugin::check_handin(\%itemcount, 1201 => 1)) ||
       (plugin::check_handin(\%itemcount, 1202 => 1)) ||
       (plugin::check_handin(\%itemcount, 1203 => 1)) ||
       (plugin::check_handin(\%itemcount, 1204 => 1)) ||
       (plugin::check_handin(\%itemcount, 1205 => 1)) ||
       (plugin::check_handin(\%itemcount, 1206 => 1))) {
        #Shiverback-hide Armor

        quest::say("Thank you, $name.");#Text made up
        quest::summonitem(quest::ChooseRandom(10028, 10037, 22503, 15981));#Random gem: Peridot, Diamond, Blue Diamond, Raw Diamond
        quest::exp(698775);
    }
    else {
        plugin::try_tome_handins(\%itemcount, $class, 'Monk');
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
#END of FILE Zone:poknowledge  ID:202247 -- Grandmaster_Limsa 