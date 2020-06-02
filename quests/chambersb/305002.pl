# Ansdaicher_the_Ancient (305002)

my $min_hp = 100.0;
my $max_hp = 0;
my $event_started = 2;

sub EVENT_SAY {
    my $begin = quest::saylink("begin", 1);
    if($text=~/hail/i) {
        quest::say("This is the Mastery of Endurance trial. You must survive an endless onslaught of enemies for as long as necessary. Are you ready to [ $begin ]?");
    }
    if($text=~/begin/i) {
        if(my $event_started == 2) {
            my $bot_raid_count = $entity_list->GetBotRaidCount($client);
            if(($bot_raid_count > 54) || ($bot_raid_count == 0)) {
                quest::say("The trial cannot start until you are in compilance with the rules.  Your raid does not meet the FIFTY-FOUR rule!");
            }
            else {
                my @qglobal_clients = $entity_list->GetClientList();
                foreach(@qglobal_clients) {
                    if($_) {
                        #-- Update the lockout qglobal
                        quest::targlobal("mpg_raid_endurance_lockout", "1", "H3", 0, $_->CharacterID(), 0);
                    }
                }
                # #death_touch (305001)
                quest::spawn2(305001, 0, 0, -9, -25, -2, 192);
                quest::say("Very well! Let the battle commence!");
                quest::settimer("begin", 5);
                quest::signalwith(305000, 305002);
                $event_started = 1;
            }
        }
    }
}

sub EVENT_SPAWN {
    $min_hp = 100.0;
    $max_hp = $npc->GetMaxHP();
}

sub EVENT_TIMER {
    if($timer eq "begin") {
        quest::stoptimer("begin");
        quest::modifynpcstat("special_attacks", "SEQMCNIDf");
        quest::settimer("check_hp", 1);
    }
    if($timer eq "check_hp") {
        my $hp_ratio = $npc->GetHPRatio();
        my $new_hp = 0;
        if($hp_ratio < $min_hp) {
            $new_hp = ($max_hp * ($min_hp/100.0));
            $npc->SetHP($new_hp);
        }
    }
}

sub EVENT_SIGNAL {
    if($signal == 305000) {
        quest::settimer("begin", 5);
    }
    if($signal == 305001){
        $min_hp = $min_hp - 5.0;
    }
}

