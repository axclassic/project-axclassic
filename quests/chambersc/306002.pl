# #death_touch (306002)

my $warnings = 0;

sub EVENT_SPAWN {
    $warnings = 0;
    quest::settimer("tick", 6);
}

sub EVENT_TIMER {
    my @raid_clients = $entity_list->GetClientList();
    $boss_hp = $npc->GetHPRatio();
    if($timer eq "tick") {
        foreach(@raid_clients) {
            if($_) {
                if(($_->GetX() > -64) || ($_->GetY() < 122)) {
                    $_->Message(13, "A deep voice booms in your head, 'This breach of the rules will not be tolerated. You must face the trials. Return to the arena or be subjected to pain.'");
                    if($warnings >= 10) {
                        $_->Message(13, "A deep voice booms in your head, 'You have been warned.  You did not heed the warnings.  Now you Die!'");
                        # Spell: Cazic Touch
                        quest::castspell(982, $_->GetID());
                    }
                    $warnings++;
                }
                my $bot_raid_count = $entity_list->GetBotRaidCount($_);
                if(($bot_raid_count > 54) || ($bot_raid_count == 0)) {
                    $_->Message(13, "A deep voice booms in your head, 'This breach of the rules will not be tolerated. You must face the trials with up to FIFTY-FOUR raid members!'");
                    if($warnings >= 10) {
                        $_->Message(13, "A deep voice booms in your head, 'You have been warned.  You did not heed the warnings.  Now you Die!'");
                        # Spell: Cazic Touch
                        quest::castspell(982, $_->GetID());
                    }
                    $warnings++;
                }
            }
        }
    }
}

