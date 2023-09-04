sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::say("Good day to you. traveler. The trails of the outer planes and Norrath alike take their tolls upon any adventurer. The need for supplies is great to maintain strength. agility. awareness. and focus and thus. I provide that which may quench your common desires. Search my stock as you wish and purchase what catches your eye. My prices are most fair. I assure you.");
    }
}

sub EVENT_SPAWN
{
    $x = $npc->GetX();
    $y = $npc->GetY();
    quest::set_proximity($x - 90, $x + 90, $y - 90, $y + 90);
}

sub EVENT_ENTER
{
    quest::signal(202274,5); #Nomaad
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
#END of FILE Zone:poknowledge  ID:202137 -- Darius_Gandril 

