# #Javoldar (309020)

my @raid_clients = 0;
my $raiders = 0;
my $raidCount = 0;

sub EVENT_SPAWN {
    quest::settimer("wear", 2);
}

sub EVENT_TIMER {
    if($timer eq "wear") {
        quest::stoptimer("wear");
        $npc->SendWearChange(1);
        $npc->SendWearChange(2);
        $npc->SendWearChange(3);
        $npc->SendWearChange(4);
        $npc->SendWearChange(5);
        $npc->SendWearChange(6);
        $npc->SendWearChange(7);
        @raid_clients = $entity_list->GetClientList();
        if(@raid_clients) {
            foreach(@raid_clients) {
                if($_) {
                    $raiders = $entity_list->GetBotRaidByClient($_);
                    $raidCount = $entity_list->GetBotRaidCount($_);
                }
            }
        }
        quest::settimer("begin", 18);
    }
    elsif($timer eq "begin") {
        quest::stoptimer("begin");
        quest::modifynpcstat("special_attacks", "QMCNID");
        my $random_raider = $raiders->GetBotRaidMember(1 + int(rand($raidCount)));
        if($random_raider) {
            $npc->AddToHateList($random_raider, 10);
        }
    }
}

sub EVENT_DEATH {
    quest::signal(309069);
    $npc->ClearItemList();
}

