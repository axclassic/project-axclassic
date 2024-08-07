#######################################
## NPC: Raffe Epione                 ##
## Zone: Plane of Knowledge          ##
## Quest: Server Challenge Tier 1 WW ##
## Created by Caved for AXClassic    ##
##                    20-02-2013     ##
#######################################
sub EVENT_SAY {
    my $port = quest::saylink("port", 1);

    if($text=~/hail/i && $ulevel >= 65) {
        quest::say("Hello $name, I am Raffe Epione. I am here to tell you about Tier 1 armor, it is called Most Elegant Defiant Armor (Tier 1) and can be found on the dragons in Western Wastes. You can find all the pieces there exept for the chest pieces. You will have to bring me 3 The Rathe Server Doll (Tier 1)'s and I will give you a random Tier 1 chestpiece, either Leather, Plate, Chain or Silk. If you want i can $port you there for a fee. I charge 150pp per portal.");
    }
    if($text=~/hail/i && $ulevel < 65) {
        quest::say("Hello $name, the tier 1 server challenge and quest I am offering is for level 65++ people only. Come back when you reach level 65.");
    }
    if($text=~/port/i && $ulevel >= 65) {
        quest::say("Just hand me 150pp and I will port you to Western Wastes.");
    }
}

sub EVENT_ITEM {
    if(plugin::check_handin(\%itemcount, 119563 => 3)) {
        quest::say("Thank you $class , here is your Tier 1 chest piece."); #random tier 1 chest piece handin.
        my @items = (119555,119562,119570,119577); #All BP's
        my $total = $items[ rand @items ]; #Randomize
        quest::summonitem($total);
        return 1;
    }
    elsif(($platinum == 150) && $ulevel >= 65) {
        quest::say("Thank you $class , you are on the way to Western Waste, good luck!"); #Money handin fr port.
        quest::movepc(120, -3499.00, -4099.00, -15.10);
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
            quest::say("I don't need this $name. Take it back.");
            plugin::return_items(\%itemcount);
        }
        if($platinum != 0 || $gold !=0 || $silver != 0 || $copper != 0) {
            quest::say("Thanks for the coin!");
        }
    }
}
