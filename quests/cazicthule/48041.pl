# a_Thul_Tae_Ew_High_Priest (48041)

# RoF Event
my $guard_khataruss_id = 48444;
my $guard_scithiss_id = 48445;
my $guard_thrasciss_id = 48446;
my $tahia_felwah_1_id = 48030;
my $tahia_felwah_2_id = 48057;
my $a_tae_ew_justicar_id = 48029;
my $unstable_rift_id = 48126;
my $a_Thul_Tae_Ew_Warder1_id = 48045;
my $a_Thul_Tae_Ew_Warder2_id = 48099;

# NPCs that can spawn during RoF
my $a_shiverback_id = 48034;
my $amygdalan_knight_id = 48457;
my $tentacle_terror_id = 48451;
my $a_gorgon_id = 48449;
my $a_spinechill_spider_id = 48452;
my $avatar_of_dread_id = 48419;
my $avatar_of_fright_id = 48420;
my $avatar_of_terror_id = 48421;
my $avatar_of_fear_id = 48418;

# npcId = 48041
sub EVENT_SPAWN {
    quest::settimer("cleanup", 5);
}

sub EVENT_COMBAT {
    quest::say("Fools! It isss dangerouss to interrupt the sssacrifice! Guards, assssissst me!");
    quest::spawn2($a_Thul_Tae_Ew_Warder1_id, 0, 0, 593, 905, -66, 280);
    quest::spawn2($a_Thul_Tae_Ew_Warder2_id, 0, 0, 537, 973, -38, 360);
    quest::spawn2($guard_khataruss_id, 0,0, 590.4, 1024.5, -94, 128);
    quest::spawn2($guard_scithiss_id, 0,0, 575.5, 1023.8, -94, 128);
    quest::spawn2($guard_thrasciss_id, 0,0, 604.3, 1024.5, -94, 128);
    quest::settimer("guards", 2);
}

sub EVENT_DEATH {
    quest::say("Oh facelesss one, I have fallen! Pleasse avenge the death of your faithful ssservant!");
    # Send signal to Tahia Felwah to Wake up and start event
    quest::signalwith($tahia_felwah_2_id, 10, 20);
    quest::stoptimer("guards");
}

sub CLEANUP_OLD_EVENT() {
    # What if HP was killed but the event was never completed
    quest::depopall($guard_khataruss_id);
    quest::depopall($guard_scithiss_id);
    quest::depopall($guard_thrasciss_id);
    quest::depopall($tahia_felwah_1_id);
    quest::depopall($tahia_felwah_2_id);
    quest::depopall($a_tae_ew_justicar_id);
    quest::depopall($unstable_rift_id);
    quest::depopall($a_shiverback_id);
    quest::depopall($amygdalan_knight_id);
    quest::depopall($tentacle_terror_id);
    quest::depopall($a_gorgon_id);
    quest::depopall($a_spinechill_spider_id);
    quest::depopall($avatar_of_dread_id);
    quest::depopall($avatar_of_fright_id);
    quest::depopall($avatar_of_terror_id);
    quest::depopall($avatar_of_fear_id);
    quest::depopall($a_Thul_Tae_Ew_Warder1_id);
    quest::depopall($a_Thul_Tae_Ew_Warder2_id);
}

sub EVENT_TIMER {
    if($timer eq "cleanup") {
        quest::stoptimer("cleanup");
        CLEANUP_OLD_EVENT();
        quest::spawn2($a_tae_ew_justicar_id, 0, 0, 587, 1055, -94, 0);
        quest::spawn2($a_tae_ew_justicar_id, 0, 0, 550, 1090, -94, 64);
        quest::spawn2($a_tae_ew_justicar_id, 0, 0, 587, 1128, -94, 128);
        quest::spawn2($a_tae_ew_justicar_id, 0, 0, 625, 1090, -97, 192);
        quest::spawn2($tahia_felwah_2_id, 0, 0, 590, 1070, -96, 180);
    }
    elsif($timer eq "guards") {
        if(!$entity_list->GetMobByNpcTypeID($guard_khataruss_id)) {
            quest::spawn2($guard_khataruss_id, 0,0, 590.4, 1024.5, -94, 128);
        }
        if(!$entity_list->GetMobByNpcTypeID($guard_scithiss_id)) {
            quest::spawn2($guard_scithiss_id, 0,0, 575.5, 1023.8, -94, 128);
        }
        if(!$entity_list->GetMobByNpcTypeID($guard_thrasciss_id)) {
            quest::spawn2($guard_thrasciss_id, 0,0, 604.3, 1024.5, -94, 128);
        }
    }
}

