# Master_of_Foresight (306001)

sub EVENT_SAY {
    my $begin = quest::saylink("begin", 1);
    if($text=~/hail/i) {
        quest::say("This is the Mastery of Foresight Trial. You must react quickly to deadly and unforgiving hazards. Are you ready to [ $begin ]?");
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
                    quest::targlobal("mpg_raid_foresight_lockout", "1", "H3", 0, $_->CharacterID(), 0);
                }
            }
            # #death_touch (306002)
            quest::spawn2(306002, 0, 0, -9, -25, -2, 192);
            # Dragorn_Acolyte (306005)
            quest::spawn2(306005, 0, 0, -161, 385, 60, 141);
            # Dragorn_Adept (306004)
            quest::spawn2(306004, 0, 0, -255, 387, 60, 113);
            # Dragorn_Annihilator (306003)
            quest::spawn2(306003, 0, 0, -315, 317, 60, 80);
            # Dragorn_Flamecaster (306007)
            quest::spawn2(306007, 0, 0, -319, 226, 60, 47);
            # Dragorn_Incinerator (306008)
            quest::spawn2(306008, 0, 0, -258, 160, 60, 14);
            # Dragorn_Spellscribe (306009)
            quest::spawn2(306009, 0, 0, -158, 160, 60, 241);
            # a_kyv_sureshot (306010)
            quest::spawn2(306010, 0, 0, -194, 286, 66, 96);
            quest::spawn2(306012, 0, 0, -227, 290, 66, 428);
            quest::spawn2(306013, 0, 0, -223, 260, 66, 276);
            quest::spawn2(306014, 0, 0, -188, 257, 66, 166);
            quest::say("Very well! Let the battle commence!");
            # a_hazard (306011)
            quest::spawn2(306011, 0, 0, $x, $y, $z, $h);
            quest::depop();
        }
    }
}

