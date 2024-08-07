#######################################
## NPC: Kevan_McPherson (29047)      ##
## Zone: Halas                       ##
## Quest: The Rathe Prestige Quest   ##
##        Shield Frame Mold          ##
##        (Guktan Shield No. 2)      ##
## Created by Caved for AXClassic    ##
## EQWorld Server     29-08-2014     ##
#######################################

sub EVENT_SAY {
    if($text=~/hail/i) {
        quest::say("Well met, $name! I'm Kevan McPherson, the best darn smith in the north. Have ye come to purchase my finely crafted weapons or are ye wanting me ta teach ya the secrets of Northman smithing?");
    }
    if($text=~/kintok/i) {
        quest::say("He did, did he? How is that fool doing? Its been a while since I saw him last! So, what has he sent you here for? Oh, a mold? I have a stockpile of those laying around. I suppose I could part with one if you were able to somehow get a fire goblin skin.");
    }
    if($text=~/what northman kite shields/i) {
        quest::say("To smith a Northman kite shield ye'll need a kite shield mold. a smithy hammer. a flask of water and a medium quality folded sheet metal. Remember ye'll have ta smith the metal sheet in a regular forge and finish the shield in our special Northman forge."); 
    }
}

sub EVENT_ITEM {
    if(plugin::check_handin(\%itemcount,2361 => 1)) {
        #Fire Goblin Skin
        quest::say("Well, arent you full of surprises! I appreciate you retrieving this for me, as I cant really leave my shop here for very long, the services I provide are nearly irreplacable. As promised, here is your mold! Good luck!");    
        quest::summonitem(51114); #Shield Frame Mold
    }
    elsif(($ulevel >= 65) && plugin::check_handin(\%itemcount,119947 => 1)) {
        #Rathe Prestige Quest
        quest::say("Ahh I see my friend Melvin sent you. I will sharpen this dagger so he can go on his dragon hunt.");    
        quest::summonitem(119951); #Sharpened Dragon Dagger
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
