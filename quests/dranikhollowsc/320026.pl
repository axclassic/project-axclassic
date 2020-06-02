# #death_touch (320026)

my @raid_clients = 0;
my $warnings = 0;

sub EVENT_SPAWN {
    quest::settimer("tick", 30);
}

sub EVENT_SAY {
    my $begin = quest::saylink("begin", 1);
    if($text=~/hail/i) {
        quest::say("This is the Mastery of Specialization trial. You must demonstrate your ability to use your primary skills and fall back on your secondary skillset when necessary. Are you ready to [ $begin ]?");
    }
    if($text=~/begin/i) {
        if($event_started == 2) {
            my $bot_raid_count = $entity_list->GetBotRaidCount($client);
            if(($bot_raid_count > 54) || ($bot_raid_count == 0)) {
                quest::say("The trial cannot start until you are in compilance with the rules.  Your raid does not meet the FIFTY-FOUR rule!");
            }
            else {
                @raid_clients = $entity_list->GetClientList();
                foreach(@raid_clients) {
                    if($_) {
                        #-- Update the lockout qglobal
                        quest::targlobal("mpg_raid_specialization_lockout", "1", "H3", 0, $_->CharacterID(), 0);
                    }
                }
                quest::say("Very well! Let the battle commence!");
                quest::modifynpcstat("special_attacks", "SEQmMCNIDf");
                quest::settimer("tick", 6);
                quest::settimer("castspell", 25);
                $event_started = 1;
            }
        }
    }
}

sub EVENT_TIMER {
    if($timer eq "tick") {
        @raid_clients = $entity_list->GetClientList();
        if(@raid_clients) {
            foreach(raid_clients) {
                if($_) {
                    my $bot_raid_count = $entity_list->GetBotRaidCount($_);
                    if($bot_raid_count > 0) {
                        $_->Message(15, "This is a group only zone. Despawn your raid or face the consequences!");
                        $warning++;
                        if($warnings >= 10) {
                            # Spell: Cazic Touch
                            quest::castspell(982, $_->GetID());
                        }
                    }
                }
            }
        }
    }
}

