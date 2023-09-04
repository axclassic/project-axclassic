#BeginFile: poknowledge\#Ruandia.pl
#Quest file for Plane of Knowledge - Ruandia: Necromancer Epic 1.5 (Soulwhisper)

sub EVENT_SAY {
    if($text=~/hail/i) {
        quest::say("Hello, $name."); #Real text still needed
    }
}

sub EVENT_ITEM {
    if(plugin::check_handin(\%itemcount, 22691 => 1)) {
        #Drawing of Rune
        quest::emote("takes the drawing from you and studies it for a moment. Her face turns pale as a look of fear overcomes her. 'You must stop your quest for whatever this rune deals with. It will only lead to your demise. This rune has many meanings; the main meaning essentially being 'discord'. I am hesitant to tell you more about it, but I am sure Kazen would not be pleased.' Ruandia writes some directions onto the drawing. 'I am not responsible for the outcome of your quest. Keep that in mind.'");
        quest::summonitem(10138); #Ruandia's Instructions
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
#EndFile: poknowledge\#Ruandia.pl (202272)