# Bzzazzt NPCID 71005
# This will be the right-side bee
# spawns three 71103 Bazzazzt's on death
sub EVENT_DEATH {
   my $x = $npc->GetX();
   my $y = $npc->GetY();
   my $z = $npc->GetZ();
   my $h = $npc->GetHeading();
   my $entid1 = quest::spawn2(71103,0,0,$x+10,$y,$z,$h);
   my $entid2 = quest::spawn2(71103,0,0,$x-10,$y,$z,$h);
   my $entid3 = quest::spawn2(71103,0,0,$x,$y,$z,$h);
   my $mob1 = $entity_list->GetMobID($entid1);
   my $mob2 = $entity_list->GetMobID($entid2);
   my $mob3 = $entity_list->GetMobID($entid3);
   my $mobnpc1 = $mob1->CastToNPC();
   my $mobnpc2 = $mob2->CastToNPC();
   my $mobnpc3 = $mob3->CastToNPC();
   $mobnpc1->AddToHateList($npc->GetHateTop());
   $mobnpc2->AddToHateList($npc->GetHateTop());
   $mobnpc3->AddToHateList($npc->GetHateTop());
}

