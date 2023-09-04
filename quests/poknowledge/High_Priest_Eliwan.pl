#High_Priest_Eliwan.pl
#Planar Armor Exchange

sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::emote("makes an almost unearthly graceful gesture as he bows politely at the waist in formal greetings. 'May the light of Tunare shine brightly upon your fate, my friend, and may the purity of goodly virtues guide your convictions. I am High Priest Eliwan, former scholar, historian, and spiritual leader in the faith dedicated toward the Mother of All. In the era that housed my life, Takish`Hiz was my home in the beautiful forest of Elddar, the shining crown jewel of Tunare's grace and infinite splendor. We were at peace then -- the trolls and ogres had yet to rise against us and the foul Teir`Dal still far from their surfacing from the bowels of the underfoot. Eventually, the time would come for me to pass beyond and it was the light of Selia that seduced my spirit with its decadent allure of purity. Though I love my goddess, I did not wish to leave her service in the universe and this recent era has granted me the utmost pleasure of returning to that active service again.'");
    }
}

sub EVENT_ITEM {
    if((plugin::check_handin(\%itemcount, 4881 => 1)) ||
       (plugin::check_handin(\%itemcount, 4882 => 1)) ||
       (plugin::check_handin(\%itemcount, 4883 => 1)) ||
       (plugin::check_handin(\%itemcount, 4884 => 1)) ||
       (plugin::check_handin(\%itemcount, 4885 => 1)) ||
       (plugin::check_handin(\%itemcount, 4886 => 1)) ||
       (plugin::check_handin(\%itemcount, 4887 => 1))) {
        #Ethereal Mist Armor
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
}#END of FILE Zone:poknowledge  ID:202236 -- High_Priest_Eliwan 

