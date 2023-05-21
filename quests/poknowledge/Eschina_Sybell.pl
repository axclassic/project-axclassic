######################################
## NPC: Eschina Sybell ##
## Zone: Plane of Knowledge ##
## Quest: Random Illusion Quest ##
## Edited by Silent for Axclassic ##
## EQWorld Server 07-24-2021 ##
######################################
sub EVENT_SAY {
    my $mirror = quest::saylink("mirror", 1);
    my $shards = quest::saylink("shards", 1);

    if($text=~/hail/i && $ulevel >= 59) {
        $client->Message(14,"Hello $name , I am devastated. This morning I broke the only $mirror I had and I am now unable to look at myself after casting my illusions. I need your help..");
    }
    if($text=~/mirror/i && $ulevel >= 60) {
        $client->Message(14,"I could repair the mirror but would need four glass $shards to do so.. Would you please please be so kind to bring me four glass shards? I will reward you with a unique stone if you do. The stone will enable you to cast an illusion on yourself.... In the event that I would give you an illusion stone you already have you can give me 2 of the same stones and I will give you another one in return");
    }
    if($text=~/shards/i && $ulevel >= 60) {
        $client->Message(14,"The glass shards I need are found in the Plane of Time. I do not know much more than where you can find them, the rest is up to you...");
    }
}

sub EVENT_ITEM {
    if(plugin::check_handin(\%itemcount, 119517 => 4)) {
        $client->Message(14,"Thank you so much $class, I can't wait to fix my mirror. Here is your illusion stone.");
        my @items = (119499,119501,119514,119515,119516,119518,119519,119521,119522,119666,119667); #All the illusion stones
        my $total = $items[ rand @items ]; #Randomize
        quest::summonitem($total);
        quest::exp(5000);
        quest::ding();
        return 1;
    }
    elsif(plugin::check_handin(\%itemcount, 119499 => 2) || plugin::check_handin(\%itemcount, 119501 => 2) || plugin::check_handin(\%itemcount, 119514 => 2) || plugin::check_handin(\%itemcount, 119515 => 2) || plugin::check_handin(\%itemcount, 119516 => 2) || plugin::check_handin(\%itemcount, 119518 => 2) || plugin::check_handin(\%itemcount, 119519 => 2) || plugin::check_handin(\%itemcount, 119521 => 2) || plugin::check_handin(\%itemcount, 119522 => 2) || plugin::check_handin(\%itemcount, 119666 => 2) || plugin::check_handin(\%itemcount, 119667 => 2)) {
        $client->Message(14,"Thank you $class , I will exchange the two duplicate ones for one new random illusion stone. Enjoy...");
        my @items = (119499,119501,119514,119515,119516,119518,119519,119521,119522,119666,119667); #All the illusion stones
        my $total = $items[ rand @items ]; #Randomize
        quest::summonitem($total);
        return 1;
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
