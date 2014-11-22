sub EVENT_SPAWN {

 quest::setnexthpevent(50);

 }

sub EVENT_HP {
  quest::spawn2(343093,0,0,4359.2,508.1,-254.7,232.2);
  quest::spawn2(343093,0,0,4346.3,499.8,-257.3,230.4);
  quest::spawn2(343093,0,0,4349.3,494,-256.7,236.5);
  quest::spawn2(343093,0,0,4369.1,508.3,-254.3,214.9);
   }
sub EVENT_DEATH {
 my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();
  quest::spawn2(343261,0,0,$x,$y,$z,$h);
  quest::signalwith(343258,631,0);
  }

