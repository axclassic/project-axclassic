##undead_trigger this is an invisible controller that triggers #undead_event.pl
# #undead2_trigger (223175)

my $aug1_spawned = 1;
my $aug2_spawned = 1;
my $re_spawned = 1;

# This spawns undead 2nd grp + boss phase 2
sub EVENT_SPAWN {
    # an_undead_guardian_ (223107)
    quest::spawn2(223107,0,0,232.0,1114.0,491.2,192.5);
    quest::spawn2(223107,0,0,242.0,1119.0,491.3,192.5);
    quest::spawn2(223107,0,0,242.0,1109.0,491.5,192.5);
    quest::spawn2(223107,0,0,252.0,1104.0,491.7,192.5);
    quest::spawn2(223107,0,0,242.0,1099.0,491.2,192.5);
    quest::spawn2(223107,0,0,252.0,1094.0,491.4,192.5);
    # an_undead_guardian_ (223138)
    quest::spawn2(223138,0,0,232.0,1104.0,491.1,192.5);
    quest::spawn2(223138,0,0,252.0,1124.0,491.4,192.5);
    quest::spawn2(223138,0,0,252.0,1114.0,491.8,192.5);
    #Boss Ralthos_Enrok
    quest::spawn2(223127,0,0,262.0,1109.0,492.1,192.5);
    #quest::ze(15, "Congdar spawned 9 an_undead_guardian_, and Ralthos_Enrok.");
    quest::settimer("phase2_undead_trigger_mobs1", 10);
}

sub EVENT_TIMER {
    if($timer eq "phase2_undead_trigger_mobs1") {
        # an_undead_guardian_ (223107)
        my $aug1 = $entity_list->GetMobByNpcTypeID(223107);
        # an_undead_guardian_ (223138)
        my $aug2 = $entity_list->GetMobByNpcTypeID(223138);
        # Ralthos_Enrok (223127)
        my $re = $entity_list->GetMobByNpcTypeID(223127);
        if($aug1) {
            $aug1_spawned = undef;
        }
        if($aug2) {
            $aug2_spawned = undef;
        }
        if($re) {
            $re_spawned = undef;
        }
        if($aug1_spawned || $aug2_spawned || $re_spawned) {
            # Do Nothing
        }
        else {
            quest::stoptimer("phase2_undead_trigger_mobs1");
            quest::depop();
        }
        $aug1 = undef;
        $aug2 = undef;
        $re = undef;
    }
}

