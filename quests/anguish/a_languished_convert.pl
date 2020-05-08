## a_languished_convert (317110) ##

my $convert_min_hit = 0;
my $convert_max_hit = 0;
my $attack_speed = 0;

sub EVENT_SPAWN {
	quest::settimer("grow_stronger", 10);
	$convert_min_hit = 278;
	$convert_max_hit = 1855;
    quest::modifynpcstat("min_hit", "$convert_min_hit");
    quest::modifynpcstat("max_hit", "$convert_max_hit");
    $attack_speed = $npc->GetNPCStat("attack_speed");
    quest::settimer("check_slowed", 1);
}

sub EVENT_TIMER {
	if ($timer eq "grow_stronger") {
        $convert_min_hit = ($convert_min_hit * 1.2);
        $convert_max_hit = ($convert_max_hit * 1.2);
        quest::modifynpcstat("min_hit", "$convert_min_hit");
        quest::modifynpcstat("max_hit", "$convert_max_hit");
    }
    elsif($timer eq "check_slowed") {
        if($npc->GetNPCStat("attack_speed") < $attack_speed) {
            quest::stoptimer("check_slowed");
            quest::emote(" appears to slow further as the magic afflicts him.");
        }
    }
}

sub EVENT_DEATH {
    quest::stoptimer("grow_stronger");
}

sub EVENT_SIGNAL {
    if($signal == 1) {
        my $amv = $entity_list->GetMobByNpcTypeID(317001);
        if($amv) {
            my $HateTarget = $amv->GetHateRandom();
            if($HateTarget) {
                $npc->AddToHateList($HateTarget, 100);
            }
        }
    }
    if($signal == 2) {
        my $omm = $entity_list->GetMobByNpcTypeID(317000);
        if($omm) {
            my $HateTarget = $omm->GetHateRandom();
            if($HateTarget) {
                $npc->AddToHateList($HateTarget, 100);
                quest::settimer("gettarget", 5);
            }
        }
    }
}



