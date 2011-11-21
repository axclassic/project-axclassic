#Bazzt_Zzzt
sub EVENT_DEATH {
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();
  quest::setglobal("sirran",6,3,"M10");
  quest::spawn2(71058,0,0,$x,$y,$z,$h); #Sirran the Lunatic
} 