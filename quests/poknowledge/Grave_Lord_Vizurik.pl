#Grave_Lord_Vizurik.pl
#Shadow Knight Tomes/Planar Armor Exchange

sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::emote("peels back the upper right portion of his thin lips, giving a dark sneer of his gruesome features and horrific maw. 'You do not belong here! Return to Selia, where the light thrives. The shadow would embrace you, should you let it, but you are here for some righteous cause - one to destroy the shadow or learn of its secrets. You will find no success here, you pathetic little light crawler. Remain here and ignore my warning, and you will condemn yourself to consumption by the shadow should you further pursue its interests.'");
    }
}
sub EVENT_ITEM {
    if((plugin::check_handin(\%itemcount, 5166 => 1)) ||
       (plugin::check_handin(\%itemcount, 5167 => 1)) ||
       (plugin::check_handin(\%itemcount, 5168 => 1)) ||
       (plugin::check_handin(\%itemcount, 5169 => 1)) ||
       (plugin::check_handin(\%itemcount, 5171 => 1)) ||
       (plugin::check_handin(\%itemcount, 5172 => 1)) ||
       (plugin::check_handin(\%itemcount, 5173 => 1))) {
        #Greenmist Armor

        quest::say("Thank you, $name.");#Text made up
        quest::summonitem(quest::ChooseRandom(10028, 10037, 22503, 15981));#Random gem: Peridot, Diamond, Blue Diamond, Raw Diamond
        quest::exp(698775);
    }
    else {
        plugin::try_tome_handins(\%itemcount, $class, 'Shadowknight');
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
#Done 