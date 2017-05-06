##Progression 317151 needed for global flag##
sub EVENT_DEATH {
    my $x = $npc->GetX(); 
    my $y = $npc->GetY(); 
    my $z = $npc->GetZ();  
    my $h = $npc->GetHeading(); 
  quest::spawn2(317151,0,0,$x,$y,$z,$h); 
  quest::depop();
 }