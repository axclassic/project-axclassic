sub EVENT_SIGNAL {
  if($signal == 850) { 
  my $a = quest::ChooseRandom(338210,338210,338210,338211,338211,338211,338212,338212,338212,338213);
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();
  quest::spawn2($a,0,0,$x,$y,$z,$h);
  }
  if($signal == 855) { 
  quest::spawn2(338215,0,0,-657.5,1262.8,4.3,187.4);
  }
 } 