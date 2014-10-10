sub EVENT_DEATH {
my $a = quest::ChooseRandom(339141,339141,339144,339144,339145,339145,339158);
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();
  quest::spawn2($a,0,0,$x,$y,$z,$h);
}