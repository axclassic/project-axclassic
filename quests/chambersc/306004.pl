# Dragorn_Adept (306004)

my $dragorn_num = 0;
my $dragorn_hitpoints = 0;
my %dragorns;
my $dragorn_timer = 0;
my $timer_reduction = 0;
my $raiders = 0;
my $raidCount = 0;

sub EVENT_SPAWN {
    setup();
    $dragorn_timer = (20 + int(rand(11)));
    $timer_reduction = 1;
    quest::settimer("dragorn", $dragorn_timer - $timer_reduction);
}

sub setup {
    %dragorns = (
        1 => ["You notice that the Dragorn before you is preparing to cast a devastating close-range spell.", 5693],
        2 => ["The Dragorn before you is developing an anti-magic aura.", 5699],
        3 => ["The Dragorn before you is sprouting sharp spikes.", 5698],
        4 => ["You notice that the Dragorn before you is making preparations to cast a devastating spell. Doing enough damage to him might interrupt the process.", 5693]
    );
}

sub EVENT_TIMER {
    my @raid_clients = $entity_list->GetClientList();
    if($timer eq "dragorn") {
        quest::stoptimer("dragorn");
        if(@raid_clients) {
            foreach(@raid_clients) {
                if($_) {
                    $raiders = $entity_list->GetBotRaidByClient($_);
                    $raidCount = $entity_list->GetBotRaidCount($_);
                }
            }
        }
        if($raiders) {
            $dragorn_num = (1 + int(rand(4)));
            $entity_list->MessageClose($npc, 1, 30, 14, "$dragorns{$dragorn_num}->[0]");
            if($dragorn_num == 4) {
                $dragorn_hitpoints = $npc->GetHP();
            }
            quest::settimer("dragorn_cast", 8);
        }
    }
    if($timer eq "dragorn_cast") {
        quest::stoptimer("dragorn_cast");
        if(($dragorn_num == 1) || ($dragorn_num == 4)) {
            if($dragorn_num == 4) {
                my $HPCheck = $dragorn_hitpoints - $npc->GetHP();
                if($HPCheck >= 50000) {
                    return;
                }
            }
            my $dragorn_x = $npc->GetX();
            my $dragorn_y = $npc->GetY();
            my $cast_spam = 1;
            for($i=1; $i<=$raidCount; $i++) {
                $raid_member = $raiders->GetBotRaidMember($i);
                if($raid_member) {
                    my $target_x = $raid_member->GetX();
                    my $target_y = $raid_member->GetY();
                    my $target_z = $raid_member->GetZ();
                    my $target_distance = $raid_member->CalculateDistance($target_x, $target_y, $target_z);
                    if($target_distance < 50) {
                        if($cast_spam == 1) {
                            $cast_spam = 2;
                            $npc->SendBeginCast(5693, 0);
                        }
                        quest::castspell(5693, $raid_member->GetID());
                    }
                }
            }
        }
        else {
            $npc->SendBeginCast($dragorns{$dragorn_num}->[1], 0);
            quest::castspell($dragorns{$dragorn_num}->[1], $npc->GetID());
        }
        quest::settimer("dragorn", $dragorn_timer - $timer_reduction);
    }
}

sub EVENT_SIGNAL {
    if($signal == 666) {
        $timer_reduction += 2;
    }
}

sub EVENT_DEATH {
    signalwith(306003, 666);
    signalwith(306004, 666);
    signalwith(306005, 666);
    signalwith(306007, 666);
    signalwith(306008, 666);
    signalwith(306009, 666);
    signalwith(306010, 666);
    signalwith(306011, 666);
    signalwith(306012, 666);
    signalwith(306013, 666);
    signalwith(306014, 666);
}

