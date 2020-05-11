# Druid Epic 2.0 Essence of Rainfall

sub EVENT_ITEM_ENTERZONE {
    if($zoneid == 317) {
        my $x = $client->GetX();
        my $y = $client->GetY();
        my $z = $client->GetZ();
        my $h = $client->GetHeading();
        quest::spawn2(317115, 0, 0, $x+10, $y, $z, abs($h-64));
        # Essence of Rainfall
        $client->SummonItem(62883);
    }
    else {
        $client->NukeItem(120339);
        $client->SummonItem(62876);
        $client->SummonItem(62879);
        $client->SummonItem(47100);
        $client->SummonItem(62878);
        $client->Message(15, "This combine can only be performed in Anguish, the Fallen Palace. Essence of Rainfall deleted.");
    }
}

