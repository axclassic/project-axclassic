# Bazzazzt NPCID 71108
# spawns one 71102 Bizazzt on Death
sub EVENT_DEATH {
   my $x = $npc->GetX();
   my $y = $npc->GetY();
   my $z = $npc->GetZ();
   my $h = $npc->GetHeading();
   my $entid1 = quest::spawn2(71102,0,0,$x+10,$y,$z,$h);
   my $mob1 = $entity_list->GetMobID($entid1);
   my $mobnpc1 = $mob1->CastToNPC();
   $mobnpc1->AddToHateList($npc->GetHateTop());
}

