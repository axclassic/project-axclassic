# #death_touch (330038)

my @raid_clients = 0;
my $warnings = 0;

sub EVENT_SPAWN {
    quest::settimer("tick", 30);
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

