sub EVENT_SAY {
    if($text=~/Hail/i) {
        if($class eq "Shadowknight") {
            if(plugin::check_hasitem($client, 14383)) { # Has Epic 1.0
                my $x = $npc->GetX();
                my $y = $npc->GetY();
                my $z = $npc->GetZ();
                my $h = $npc->GetHeading();
                quest::emote("screams out in pain as his body becomes wracked with spasms. Slowly his body seems to deteriorate into something not quite so human. 'Lhranc the all powerful cannot be defeated. You are doomed!");
                quest::sleep(8000);
                quest::depop();
                my $entid1 = quest::spawn2(90197,0,0,$x,$y,$z,$h); # Kilidna_
                my $mob1 = $entity_list->GetMobID($entid1);
                my $mob1attack = $mob1->CastToNPC();
                $mob1attack->AddToHateList($client, 1);
            }
        }
    }
}
# EOF Zone: citymist ID: 90186 NPC: Kilidna
