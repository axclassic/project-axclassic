## Resqu Mipliz ##
## Betrayal Armor Quest ##
## Part 1 Lead you into Betrayal ##
## 4/18/2013 ##


sub EVENT_SAY{
    my $betrayal = quest::saylink("Betrayal", 1);
    my $back = quest::saylink("back",1);
    my $necklace = quest::saylink("necklace", 1);
    my $assist = quest::saylink("assist",1);

#hail
    if($text =~ /hail/i && $faction < 5) {
        # faction is above indifferent #
        $client->Message(14,"What's wrong $name , my sister is crazy. I am sorry she sent you to $betrayal.");
    }
    elsif ($text =~ /hail/i && $ulevel == 65 && $faction >= 5) {
        # 65 and indifferent #
        $client->Message(14,"Hello $name , I worry for my sister. She wonders the Tranquility along the shore. I wish to give her a $necklace, to help her over this strange time.");
    }
    if($text =~ /hail/i && $ulevel == 64 && $faction >= 5) {
        #64 and indifferent #
        $client->Message(14,"Hello $name , I am sorry $class. I need time work come back later when you can claim yourself worthy to talk to me!");
    }
#port in after initial quest completed #	
    if($text=~/betrayal/i && $faction < 5) {
        $client->Message(14,"Yes, I know it is dangerous why do you think I did not go to her. Would you like to go $back?");
    }
    if($text=~/back/i && $faction < 5) {
        $client->Message(14,"Ok, remember it was your choice!");
        quest::movepc(277,-188,288,7,000);
        return 1;
    }
#Initial quest line #
    if($text=~/necklace/i && $ulevel == 65) {
        $client->Message(14,"I am just way to busy to do it. Prehaps you would $assist me in this matter. You know with my graditude.");
    }
    if($text=~/assist/i && $ulevel == 65) {
        $client->Message(14,"Wonderful I am sure she will snap out of it once she gets it.");
        quest::summonitem(119783);
        quest::exp(5000);
        return 1;
    }
#return items #	
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



