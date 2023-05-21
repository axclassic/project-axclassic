#Aid_Fimli.pl
#Cloak of Lesser Pernicity


sub EVENT_SAY {
    if($text=~/Hail/i) {
        quest::say("Greetings $name! I wish I had time to chatter but my duties to the list and the Grand Librarian keep me extremely busy.");
    }

    if($text=~/duties/i) {
        quest::say("I am the aid for the Grand Librarian and he has me cataloging tomes on the master list. I spend so much time working on the list I haven't had time to go collect these items from the planes my uncle in Ak'Anon keeps pestering me over. He wants to upgrade his scrapyard back in Ak'Anon, and says only these items will do. Would you be willing to do me a favor?");      
    }

    if($text=~/favor/i) {
        quest::say("Wonderful! If you would gather the following; a bundle of superconductive wires, silicorrosive grease, a gold tipped boar horn and a shard of pure energy, then take them to my uncle Sanfyrd in Ak'Anon. I would really appreciate being able to get back to my work uninterrupted.");
    }

}

sub EVENT_ITEM {
    if(plugin::check_handin(\%itemcount, 15980 => 1)) {
        #Note to Fimli
        quest::say("Great! I see you got the items to uncle; perhaps he will stop badgering me now and let me be in my work. Hmmmmm, Uncle mentions in his letter that he worked out a way for a gnome to make a giant set of crab crackers. He states it is useless in Norrath but I may be able to make some use of it out here. I guess it wouldn't hurt to share it with you and file it away in the library. To create the cracker combine two metal rods, firewater and a knuckle joint in a toolbox. Interesting indeed, anyways here if your reward; I hope you can put it to good use.");
        quest::summonitem(15807); #Cloak of Lesser Pernicity
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
#END of FILE Zone:poknowledge  ID:202122 -- Aid_Fimli 

