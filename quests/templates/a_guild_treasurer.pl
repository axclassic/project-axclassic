# a_guild_treasurer (345003)

sub EVENT_SAY {
    if($text=~/hail/i) {
        $client->Message(14,"I'm on break, next teller please.");
    }
}

