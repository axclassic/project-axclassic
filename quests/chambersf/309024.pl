# #Eira_Varinger (309024)

my $event_started = 2;

sub EVENT_SPAWN {
    quest::settimer("wear", 20);
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
    }
    elsif($timer eq "begin") {
        quest::stoptimer("begin");
        quest::depopall(309006);
        quest::signal(309041);
        quest::signal(309024);
        quest::signal(309043);
        quest::signal(309021);
        quest::signal(309037);
        quest::signal(309029);
    }
}

sub EVENT_SAY {
    if($text=~/hail/i) {
        $npc->SetAppearance(0);
        quest::say("Hail to you as well, stranger, but what exactly are you doing here? I'm sorry, but as you can see, you've arrived too late. Moments ago we defeated Huhn-Abram the Corrupted and we're currently regrouping and resurrecting our fallen members. Please respect our control of this area and leave at once. I have to admit your presence here is making me a bit nervous. We don't want any trouble. So, are you going to leave us in peace, or did you come [expecting a fight]?");
    }
    if($text=~/a fight/i) {
        if($event_started == 2) {
            my $bot_raid_count = $entity_list->GetBotRaidCount($client);
            if(($bot_raid_count > 54) || ($bot_raid_count == 0)) {
                quest::say("The trial cannot start until you are in compilance with the rules.  Your raid does not meet the FIFTY-FOUR rule!");
            }
            else {
                my @qglobal_clients = $entity_list->GetClientList();
                foreach(@qglobal_clients) {
                    if($_) {
                        #-- Update the lockout qglobal
                        quest::targlobal("mpg_raid_corruption_lockout", "1", "H3", 0, $_->CharacterID(), 0);
                    }
                }
                # #death_touch (309069)
                quest::spawn2(309069, 0, 0, -9, -25, -2, 192);
                $npc->SetAppearance(0);
                quest::say("I should have known the Trial of Corruption would not be so easy. Bring it on!");
                quest::settimer("begin", 5);
                $event_started = 1;
            }
        }
    }
}

sub EVENT_DEATH {
    quest::signal(309069);
    $npc->ClearItemList();
}

sub EVENT_SIGNAL {
    quest::modifynpcstat("special_attacks", "QMCNID");
    $npc->SetAppearance(0);
}

