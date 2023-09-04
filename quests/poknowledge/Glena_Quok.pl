sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::say("gives a warm. toothy smile and pleasant nod of her head in greeting. 'An' good day t'ye. $name! Well. what might 'have brought ye t'old Glena Quok. Hrm? Perhaps ye be a distinguished member o'the blacksmithin' arts. aye? Well. if that indeed be the case. then we certaintly be in luck! I am a bit familiar with the trade meself an' offer me services t'any smith who may 'ave use fer what I am offerin' at the time. Dinnae be shy. friend! Search me wares if ye be interested and purchase what ye like.'");
    }
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
#END of FILE Zone:poknowledge  ID:202088 -- Glena_Quok 

