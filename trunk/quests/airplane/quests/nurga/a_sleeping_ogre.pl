sub EVENT_SPAWN {
   quest::settimer(3, 3);
}

sub EVENT_TIMER {
   if($timer == 3) {
      quest::stoptimer(3);
      $npc->SetAppearance(3);#sleeping
      quest::settimer(4, 60);
   }
   if($timer == 4) {
      $npc->SetAppearance(3);#sleeping
   }
}

sub EVENT_ITEM {
 if(plugin::check_handin(\%itemcount, 1685 => 1)){
  # Monk Epic 1.0
  quest::say("Your path of wanton destruction ends here, $name. Gwan and Eejag were impatient and hot-headed. You will not defeat me, for I have the patience and perseverance of stone, unlike the children you have beaten before me.");
  quest::depop();
  # Spawn: Trunt
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();
  quest::spawn2(107161,0,0,$x,$y,$z,$h);
 }
}
