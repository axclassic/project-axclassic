sub EVENT_DEATH {
  my $a = quest::ChooseRandom(338210,338210,338210,338211,338211,338211,338212,338212,338212,338213);
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();
  quest::spawn2($a,0,0,$x,$y,$z,$h);
}