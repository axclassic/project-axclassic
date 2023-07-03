#######################################
## NPC: Melvin Cerech                ##
## Zone: North Karana                ##
## Quest: The Rathe Prestige Quest   ##
## Created by Caved for AXClassic    ##
## EQWorld Server     27-08-2014     ##
#######################################
sub EVENT_SAY {
    if($text=~/hail/i && $ulevel >= 65) {
        $client->Message(14,"Howdy $name I am Melvin. How can I help you?");
    }
    elsif($text=~/hail/i && $ulevel < 65) {
        $client->Message(14,"I dont think I should talk to you. Laterz!!");
    }
}

sub EVENT_ITEM {
    #Coin for Melvin 119946
    if(($ulevel >= 65) && plugin::check_handin(\%itemcount, 119946 => 1)) {
        $client->Message(14,"Ah hello $class , I see you helped Mehir catch those vultures. Man let me tell you he is hunting those for years now. Glad to see he finally succeeded. You seem to have atleast SOME potential. Ok I put you to work and see what you are made of, but first I need you to run an errand for me. Take this dagger to Kevan McPherson. He will sharpen it for you. Bring the sharpened dagger back to me along with a Superior Green Dragonscale, a Superior Red Dragonscale and a Superior White Dragonscale");
        quest::summonitem("119947");
    }
    #Sharpened Dragon Dagger 119951
    #Superior Green Dragon Scales 119948
    #Superior Red Dragon Scales 119949
    #Superior White Dragon Scales 119950
    elsif(($ulevel >= 65) && plugin::check_handin(\%itemcount, 119951 => 1, 119948 => 1, 119949 => 1, 119950 => 1)) {
        $client->Message(14,"Very good! $name, I reward you with my token of trust to enable you to advance in your quest. I want you to kill the master of time itself. Bring his head and the token I just gave you back to me, now go!! Dont return without these items! ");
        quest::summonitem("119952");
    }
    #Melvins Token of Trust 119952
    #Head of Quarm 119953
    elsif(($ulevel >= 65) && plugin::check_handin(\%itemcount, 119952 => 1, 119953 => 1)) {
        $client->Message(14,"Good! Good. I see you have what it takes to complete this quest my friend. I shall send you on your way now. Bring this coin to Helena Kimang. She is an observer. Last time I saw her she was observing in some honorable place in the Plains of Power.");
        quest::summonitem("119954");
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
}
