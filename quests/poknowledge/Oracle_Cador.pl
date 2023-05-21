#Oracle_Cador.pl
#Willamina's Needles/Planar Armor Exchange


sub EVENT_SAY {
	if($text=~/Hail/i) {
		quest::emote("gives a stiff nod in proper greetings to $name. 'The light of Selia shines in welcoming, friend. If you seek supplies or training, know that Selia will accommodate your every need in these specific areas most efficiently -- for that is what we have striven for in the recent past with the unexpected, though eagerly welcome influx of Norrath's heroes. I am Oracle Cador, shaman of The Truthbringer and adept of my art in the district of Selia. I shall oblige any needs that you may have now or in the future regarding training in the shamanistic ways. If you are of another adept path, then do not be disheartened for Selia holds an adept master for every art that the pure light of goodly mortal virtues shines upon.'");
	}
	if($text=~/black lava powder/i) {
		quest::say("You are most astute. I do have a stock of black lava powder with me, but I will only share it with those who prove themselves worthy. Onirelin Gali is currently in possession of an artifact I need to better commune with the spirits. Please recover it for me.");
	}
	if($text=~/Philter/i) {
		if(($ulevel > 40) && ($class ne 'Shaman')) {
			# Shaman must use Trade Skills
			quest::say("You are most astute. I do have a stock of Philter of Major Translocation with me, but I will only share it with those who prove themselves worthy. I already have the Prism Grains, but you need to give me 150 platinum pieces, a blade leaf, a simple potion vial, a heliotrop and a yebamante.");
		}
	}
}


sub EVENT_ITEM {
	if(plugin::check_handin(\%itemcount, 28089 => 1)) {
		#Cador's Artifact
		quest::say("The spirits are restful now that this piece of legend is in safe hands. You may take this to Mirao for whatever purpose he desires it for. May your vision always be clear!");
		quest::summonitem(28090);#Black Lava Powder
		quest::exp(250);
	}
	elsif((plugin::check_handin(\%itemcount, 4871 => 1)) ||
		  (plugin::check_handin(\%itemcount, 4872 => 1)) ||
		  (plugin::check_handin(\%itemcount, 4873 => 1)) ||
		  (plugin::check_handin(\%itemcount, 4884 => 1)) ||
		  (plugin::check_handin(\%itemcount, 4874 => 1)) ||
		  (plugin::check_handin(\%itemcount, 4875 => 1)) ||
		  (plugin::check_handin(\%itemcount, 4876 => 1)) ||
		  (plugin::check_handin(\%itemcount, 4877 => 1))) {
		#Rune Etched Armor
		quest::say("Thank you, $name.");#Text made up
		quest::summonitem(quest::ChooseRandom(10028, 10037, 22503, 15981));#Random gem: Peridot, Diamond, Blue Diamond, Raw Diamond
		quest::exp(698775);
	}
	elsif(($itemcount{22143} == 1) && ($itemcount{95843} == 1) && ($itemcount{14242} == 1) && ($itemcount{16510} == 1) && ($platinum >= 150)) {
		if(($ulevel > 40) && ($class ne 'Shaman')) {
			# Shaman must use Trade Skills
			quest::say("Thank you, $name.");#Text made up
			quest::summonitem(96467);# Philter of Major Translocation
		}
	}
    else {
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
}#END of FILE Zone:poknowledge  ID:202238 -- Oracle_Cador 