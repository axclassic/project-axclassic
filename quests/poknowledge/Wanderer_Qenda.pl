sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Greetings to you. traveler. and we warmly welcome you to our midst. New Tanaan holds a limitless fount of knowledge of past history. lore. and research of both the arcane and of faith. If you have come in search of knowledge that would guide you further in the protection of the sacred. natural world as one of its druids. then I may be of humble service to you. Do not hesitate to peruse my inventory should you have wish or need of it. All items that I possess are for a moderate price that will aid the city in furthering our research and guidance of all of Norrath's scholars."); }
}

sub EVENT_ITEM {
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
#END of FILE Zone:poknowledge  ID:202217 -- Wanderer_Qenda 

