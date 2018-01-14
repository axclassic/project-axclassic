sub EVENT_DEATH {
   my $x;
   my $y;
   my $z;
   my $h;
   my $entid1;
   my $mob1;
   my $mobnpc1;
   $x = $npc->GetX();
   $y = $npc->GetY();
   $z = $npc->GetZ();
   $h = $npc->GetHeading();
   $entid1 = quest::spawn2(71100,0,0,$x+10,$y,$z,$h);
   $mob1 = $entity_list->GetMobID($entid1);
   $mobnpc1 = $mob1->CastToNPC();
   $mobnpc1->AddToHateList($npc->GetHateTop());
}
# EOF zone: airplane ID: 71105 NPC: a_soul_harvester.pl

