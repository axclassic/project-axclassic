sub EVENT_SPAWN {

 quest::setnexthpevent(50);

 }

sub EVENT_HP {
  quest::spawn2(343093,0,0,-4549.9,607.7,129.8,56.2);
  quest::spawn2(343093,0,0,-4511.7,700.7,128.5,103.6);
  quest::spawn2(343093,0,0,-4450.4,688.4,128.3,147.9);
  quest::spawn2(343093,0,0,-4493.6,577.3,128.5,12);
   }
sub EVENT_DEATH {
 my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();
  quest::spawn2(343261,0,0,$x,$y,$z,$h);
  quest::signalwith(343258,631,0);
  }

