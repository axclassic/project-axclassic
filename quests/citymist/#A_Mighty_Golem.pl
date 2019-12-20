sub EVENT_DEATH {
   my $random_result = int(rand(100));
   if($random_result < 10) {
      my $x = $npc->GetX();
      my $y = $npc->GetY();
      my $z = $npc->GetZ();
      my $h = $npc->GetHeading();
      quest::depop();
      $entid1 = quest::spawn2(90196,0,0,$x,$y,$z,$h); # #a_raging_golem
      $mob1 = $entity_list->GetMobID($entid1);
      $mob1attack = $mob1->CastToNPC();
      $mob1attack->AddToHateList($client, 1);
   }
}
#END of FILE Zone:citymist  ID:90196 -- #A_Mighty_Golem
