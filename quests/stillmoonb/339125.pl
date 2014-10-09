sub EVENT_SIGNAL {
  if($signal == 1150) { 
  my $a = quest::ChooseRandom(339141,339141,339144,339144,339145,339145,339118);
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();
  quest::spawn2($a,0,0,$x,$y,$z,$h);
  }
  if($signal == 1155) { 
  quest::spawn2(339124,0,0,456.1,2291.9,207.5,108.6);
  quest::spawn2(339124,0,0,450,2252.8,205.9,50.5);
  quest::depop(339141);
  quest::depop(339144);
  quest::depop(339145);
  }
  if($signal == 1175) {
  quest::depop();
 }
}