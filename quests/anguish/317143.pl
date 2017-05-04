##This is the final Warden Havnar 317143 the one that spawns the orb for epic and gives progression flag##
sub EVENT_SPAWN {
       my $curhp = $npc->GetHP();
  my $HealPoints = -600600;
  $npc->SetHP($curhp + $HealPoints);
  }
sub EVENT_DEATH {
    my $x = $npc->GetX(); 
    my $y = $npc->GetY(); 
    my $z = $npc->GetZ();  
    my $h = $npc->GetHeading(); 
  quest::spawn2(317152,0,0,$x,$y,$z,$h); 
  quest::spawn2(317087,0,0,484,4389.9,208.6,195.4);
 }