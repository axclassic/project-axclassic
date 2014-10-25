sub EVENT_DEATH {
  my $a = quest::ChooseRandom(341030,341098,341042,341098,341055,341098,341092,341098);
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();
  quest::spawn2($a,0,0,$x,$y,$z,$h);
}



