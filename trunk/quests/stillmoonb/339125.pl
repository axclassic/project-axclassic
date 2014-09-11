sub EVENT_SIGNAL {
  if($signal == 1150) { 
  my $a = quest::ChooseRandom(339140,339140,339140,339141,339141,339411,339118);
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();
  quest::spawn2($a,0,0,$x,$y,$z,$h);
  }
  if($signal == 1155) { 
  quest::spawn2(339125,0,0,456.5,2253.4,207.6,15.4);
  quest::spawn2(339125,0,0,462.3,2282.9,208.9,138.2);
  }
  if($signal == 1175) {
  quest::depop();
 }
} 