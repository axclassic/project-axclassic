sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::say("Welcome to the Kartis district of [New Tanaan]. comrade.  May you gain power through knowledge.");
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
    quest::signal(202273,5); #Qadar
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
#END of FILE Zone:poknowledge  ID:202116 -- Guardian_Ulaurd 

