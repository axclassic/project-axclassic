sub EVENT_DEATH {
  my $a = quest::ChooseRandom(341030,341900,341042,341900,341055,341900,341092,341900);
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();
  quest::spawn2($a,0,0,$x,$y,$z,$h);
}



