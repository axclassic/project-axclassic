#Sorcerer_Kerynth.pl
#Planar Armor Exchange

sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::emote("gives a gentle smile and polite bow of respect to $name. 'Greetings and welcome to the district of Tanaan, traveler. This place of neutrality is quite content to have you among us, learning from us what we humbly can teach you. Many adepts who were adventurers not too different from yourself have stepped forward and offered their memories as present lessons to those willing to learn of them. I myself was a master of the elements in my time, though I do not make this declaration as one that craves due respect for the title. Rather, I hope that you may perhaps be of the same path and if you need tutoring in the way of skills, then I would be more than pleased to oblige your needs.'");
    }
}
sub EVENT_ITEM {
    if((plugin::check_handin(\%itemcount, 1225 => 1)) ||
       (plugin::check_handin(\%itemcount, 1226 => 1)) ||
       (plugin::check_handin(\%itemcount, 1227 => 1)) ||
       (plugin::check_handin(\%itemcount, 1228 => 1)) ||
       (plugin::check_handin(\%itemcount, 1229 => 1)) ||
       (plugin::check_handin(\%itemcount, 1230 => 1)) ||
       (plugin::check_handin(\%itemcount, 1231 => 1))) {
        #Carmine Armor
        quest::say("Thank you, $name.");#Text made up
        quest::summonitem(quest::ChooseRandom(10028, 10037, 22503, 15981));#Random gem: Peridot, Diamond, Blue Diamond, Raw Diamond
        quest::exp(698775);
    }
    else {
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
#END of FILE Zone:poknowledge  ID:202252 -- Sorcerer_Kerynth 