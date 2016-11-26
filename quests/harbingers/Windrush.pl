#Angelox

sub EVENT_DEATH{
 my $random_result = int(rand(100));
 my $a = 335057;
 my $x = $npc->GetX();
 my $y = $npc->GetY();
 my $z = $npc->GetZ(); 
 my $h = $npc->GetHeading();
 if (($random_result<=5) && ($wind1==2)){
  quest::spawn2($a,0,0,$x,$y,$z,$h);
  quest::delglobal("wind1");
  quest::setglobal("wind1",3,3,"F");
  $wind1=undef;
  }else{
  do nothing
 }
}

# EOF zone: WoS