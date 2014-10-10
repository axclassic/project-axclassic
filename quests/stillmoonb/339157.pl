sub EVENT_SIGNAL {
  if($signal == 1250) { 
  my $a = quest::ChooseRandom(339154,339154,339154,339156,339156,339156,339140);
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();
  quest::spawn2($a,0,0,$x,$y,$z,$h);
  }
  if($signal == 1255) { 
  quest::depop(339154);
  quest::depop(339156);
  }
  if($signal == 1275) {
  quest::depop();
 }
}