#Virtuoso_Zoama.pl
#Bard Tomes/Planar Armor Exchange
#Added tome handins - Kilelen

sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::emote("gives a warm smile of her comely features and a delicate bow of her head in greetings. 'Good day to you, $name, and welcome to the district of Selia. You will find that the light and mortal virtues of justly kindness, honor, valor, and untainted passion are represented in full upon this plane in our midst. Rather, each of the three districts that house the adepts of New Tanaan represent and fulfill the core elements and pure essence of mortal virtues within the universe, we collectively embody that of the light. I'm certain you will find yourself at home among us, and for this we are pleased and grateful. During your stay with us, I would suggest that you seek our adepts and merchants, for the knowledge we hold cannot be found in the library of Myrist. for it is one that is the key to purity and faith of the light. If you are one of the bardic traditions, then I may be of assistance to you should you need training the ways of your skills. Otherwise, it has been a pleasure to make your acquaintance.'");
    }
}

sub EVENT_ITEM {
    if((plugin::check_handin(\%itemcount, 4861 => 1)) ||
       (plugin::check_handin(\%itemcount, 4862 => 1)) ||
       (plugin::check_handin(\%itemcount, 4863 => 1)) ||
       (plugin::check_handin(\%itemcount, 4864 => 1)) ||
       (plugin::check_handin(\%itemcount, 4865 => 1)) ||
       (plugin::check_handin(\%itemcount, 4866 => 1)) ||
       (plugin::check_handin(\%itemcount, 4867 => 1))) {
        #Imbrued Platemail Armor
        quest::say("Thank you, $name.");#Text made up
        quest::summonitem(quest::ChooseRandom(10028, 10037, 22503, 15981));#Random gem: Peridot, Diamond, Blue Diamond, Raw Diamond
        quest::exp(698775);
    }
    else {
        plugin::try_tome_handins(\%itemcount, $class, 'Bard');
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
#END of FILE Zone:poknowledge  ID:202008 -- Virtuoso_Zoama