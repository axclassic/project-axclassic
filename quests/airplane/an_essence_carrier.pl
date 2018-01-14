# on death of essence carrier two essence tamers spawn
#

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
   $entid1 = quest::spawn2(71071,0,0,$x+10,$y,$z,$h);
   $mob1 = $entity_list->GetMobID($entid1);
   $mobnpc1 = $mob1->CastToNPC();
   $mobnpc1->AddToHateList($npc->GetHateTop());
}
# EOF zone: airplane ID: 71070 NPC: an_essence_carrier

