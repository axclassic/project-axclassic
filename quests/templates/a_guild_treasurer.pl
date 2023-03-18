# a_guild_treasurer (345003)

sub EVENT_SAY {
    if($text=~/hail/i) {
        quest::emote(" puts a sign on the counter that reads 'On break. Next teller please.'");
    }
}

