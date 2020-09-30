# #Undari_Perunea (293176)

sub EVENT_SAY {
    if($text=~/hail/i) {
        my $QGlobalValue = $client->GetQGlobal("EpicBox");
        if($QGlobalValue == 1) {
            quest::say("Are you here to help me? Yes, I feel the intent of your spirit. You must be careful, the evil beast that stole my necklace is ever near.");
            quest::spawn2(293226,0,0,-53,-414.5,-431,24.5);
            quest::depop();
        }
        else {
            quest::say("There is nothing you can do to help me $name. Come back when you are worthy.");
        }
    }
}
