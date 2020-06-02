# Master_of_Specialization (307008)

my @raid_clients = 0;
my $warnings = 0;
my $event_started = 2;
my $spell_index = 0;
my %spell_list;

sub EVENT_SPAWN {
    setup();
}

sub setup {
    %spell_list = (
        1 => [5700, "Spell: Imprecision"],
        2 => [5723, "Spell: Searing Pain"],
        3 => [5701, "Spell: Rigidity"],
        4 => [5724, "Spell: Chilling Agony"],
        5 => [5702, "Spell: Curse of Misfortune"],
        6 => [5725, "Spell: Glimmering Aura"],
        7 => [5703, "Spell: Impurity"],
        8 => [5726, "Spell: Toxic Blast"]
    );
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
    if($timer eq "castspell") {
        do_spell();
    }
}

sub do_spell {
    $spell_index++;
    if($spell_index > 8) {
        $spell_index = 1;
    }
    $npc->SendBeginCast($spell_list{$spell_index}->[0], 0);
    my $spell_target = $npc->GetHateTop();
    if($spell_target) {
        quest::castspell($spell_list{$spell_index}->[0], $spell_target->GetID());
    }
}

sub EVENT_DEATH {
    quest::stoptimer("tick");
    quest::stoptimer("castspell");
    # Shell_of_the_Master (307009)
    quest::spawn2(307009, 0, 0, -204, 274, 66, 144);
    foreach(@raid_clients) {
        if($_) {
            #-- Update the win qgloabl
            quest::targlobal("mpg_raid_specialization_flag", "1", "F", 0, $_->CharacterID(), 0);
            quest::targlobal("mpg_raid_specialization_lockout", "1", "D3", 0, $_->CharacterID(), 0);

            # add 1 rune to Shell_of_the_Master for each client
            $Rune = $entity_list->GetMobByNpcTypeID(307009);
            if($Rune) {
                # Mastery of Arcana Rune
                $Rune->CastToNPC()->AddItem(52410, 1);
            }
        }
    }
}

