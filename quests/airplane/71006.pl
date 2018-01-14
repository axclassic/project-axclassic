# Bzzazzt NPCID 71006
# This will be the left-side bee
# spawns two 71108 Bazzazzt's on death
sub EVENT_DEATH {
   my $x = $npc->GetX();
   my $y = $npc->GetY();
   my $z = $npc->GetZ();
   my $h = $npc->GetHeading();
   my $entid1 = quest::spawn2(71108,0,0,$x+10,$y,$z,$h);
   my $entid2 = quest::spawn2(71108,0,0,$x-10,$y,$z,$h);
   my $mob1 = $entity_list->GetMobID($entid1);
   my $mob2 = $entity_list->GetMobID($entid2);
   my $mobnpc1 = $mob1->CastToNPC();
   my $mobnpc2 = $mob2->CastToNPC();
   $mobnpc1->AddToHateList($npc->GetHateTop());
   $mobnpc2->AddToHateList($npc->GetHateTop());
}

