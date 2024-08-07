#Grandmaster_Chendra.pl
#Monk Tomes/Planar Armor Exchange

sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::emote("gives a deep-seated bow of respect and humble greetings. Her voice is gentle and calm, like the soothing melody of a grandmother with the youth of a newborn wind. 'Greetings, my friend, and may the light watch over your path. The district of Selia is one of light and upholds its virtues fervently, though we do not seek to impose upon others in our humble plane. You will find many whom, upon your world, are enemies but here, though they look upon you with disdain, are ultimately your equals in the quest for knowledge and enlightenment. If you are a student of the disciplines of the monk, then I shall lend my knowledge to you whenever you are in need of lessons in the martial skills of our order.'");
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
            quest::say("I don't need this $name. Take it back.");
            plugin::return_items(\%itemcount);
        }
        if($platinum != 0 || $gold !=0 || $silver != 0 || $copper != 0) {
            quest::say("Thanks for the coin!");
        }
    }
}
#END of FILE Zone:poknowledge  ID:202010 -- Grandmaster_Chendra 