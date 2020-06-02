# Master_of_Adaptation (308008)

my $begin = quest::saylink("begin", 1);

sub EVENT_SAY {
    if($text=~/hail/i) {
        quest::say("This is the Mastery of Adaptation trial. You must demonstrate your ability to adapt to an unpredictable and ever-changing opponent. Are you ready to [ $begin ]?");
    }
    if($text=~/begin/i) {
        my $bot_raid_count = $entity_list->GetBotRaidCount($client);
        if(($bot_raid_count > 54) || ($bot_raid_count == 0)) {
            quest::say("The trial cannot start until you are in compilance with the rules.  Your raid does not meet the FIFTY-FOUR rule!");
        }
        else {
            my @qglobal_clients = $entity_list->GetClientList();
            foreach(@qglobal_clients) {
                if($_) {
                    #-- Update the lockout qglobal
                    quest::targlobal("mpg_raid_adaptation_lockout", "1", "H3", 0, $_->CharacterID(), 0);
                }
            }
            # #death_touch (308009)
            quest::spawn2(308009, 0, 0, -9, -25, -2, 192);
            quest::say("Very well! Let the battle commence!");
            # Construct_of_Pain (308014)
            quest::spawn2(308014, 0, 0, $x, $y, $z, $h);
            quest::depop();
        }
    }
}

