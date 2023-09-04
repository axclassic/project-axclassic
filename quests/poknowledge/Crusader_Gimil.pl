#Crusader_Gimil.pl
#Paladin Tomes/Planar Armor Exchange

sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::say("kneels low before $name, offering a humble gesture of respect and greetings. 'The light of Selia embraces thee, my friend. If you reside in our midst in searching for knowledge and guidance, then know that we are your servants in that quest. Should you be a paladin, and your object of faith is of no consequence in this matter, then my services are humbly at your disposal should you need or wish them.'");
    }
}

sub EVENT_ITEM {
    if((plugin::check_handin(\%itemcount, 4851 => 1)) ||
       (plugin::check_handin(\%itemcount, 4852 => 1)) ||
       (plugin::check_handin(\%itemcount, 4853 => 1)) ||
       (plugin::check_handin(\%itemcount, 4854 => 1)) ||
       (plugin::check_handin(\%itemcount, 4855 => 1)) ||
       (plugin::check_handin(\%itemcount, 4856 => 1)) ||
       (plugin::check_handin(\%itemcount, 4857 => 1))) {
        #Valorium Armor

        quest::say("Thank you, $name.");#Text made up
        quest::summonitem(quest::ChooseRandom(10028, 10037, 22503, 15981));#Random gem: Peridot, Diamond, Blue Diamond, Raw Diamond
        quest::exp(698775);
    }
    else {
        plugin::try_tome_handins(\%itemcount, $class, 'Paladin');
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
#END of FILE Zone:poknowledge  ID:202237 -- Crusader_Gimil 