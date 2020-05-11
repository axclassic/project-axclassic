# Ranger Epic 2.0 spawn #Oshimai_Spirit_of_the_High_Air (317113)

sub EVENT_ITEM_ENTERZONE {
    if($zoneid == 317) {
        my $x = $client->GetX();
        my $y = $client->GetY();
        my $z = $client->GetZ();
        my $h = $client->GetHeading();
        quest::spawn2(317113, 0, 0, $x+10, $y, $z, abs($h-64));
    }
    else {
        $client->NukeItem(120340);
        $client->SummonItem(47100);
        $client->SummonItem(62647);
        $client->Message(15, "This combine can only be performed in Anguish, the Fallen Palace.");
    }
}

