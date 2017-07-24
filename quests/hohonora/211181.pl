#The_Chaos 211181 This is the Final Chaos##
sub EVENT_SPAWN {
  my $curhp = $npc->GetHP();
  my $HealPoints = -50000;
  $npc->SetHP($curhp + $HealPoints);
  }
  sub EVENT_DEATH {
    my $x = $npc->GetX(); 
    my $y = $npc->GetY(); 
    my $z = $npc->GetZ();  
    my $h = $npc->GetHeading(); 
  quest::spawn2(211194,0,0,$x,$y,$z,$h); 
  quest::depopall(211180);
	quest::depopall(211198);
	quest::depopall(211201);
	quest::depop(211200);
	quest::depop(211142);
	quest::depop(211199);
	}