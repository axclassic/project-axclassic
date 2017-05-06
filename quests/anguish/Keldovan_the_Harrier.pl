##Keldovan_the_Harrier 317005 is the first encounter in the Asylum of Anguish raid expedition. ##

sub EVENT_COMBAT {
   quest::spawn2(317117,0,0,-37.2,751.2,-244.5,218.5);
   quest::spawn2(317118,0,0,-30.5,651.2,-244.5,169.1);
   quest::spawn2(317119,0,0,44.3,656.1,-244.5,97);
   quest::spawn2(317120,0,0,40.9,748.5,-244.5,30.3);
 }
sub EVENT_SIGNAL {
  if($signal == 95){
  my $curhp = $npc->GetHP();
  my $HealPoints = -140120;
  $npc->SetHP($curhp + $HealPoints);
  }
    if($signal == 90){
  my $curhp = $npc->GetHP();
  my $HealPoints = -140120;
  $npc->SetHP($curhp + $HealPoints);
  }
    if($signal == 85){
  my $curhp = $npc->GetHP();
  my $HealPoints = -140120;
  $npc->SetHP($curhp + $HealPoints);
  }
    if($signal == 80){
  my $curhp = $npc->GetHP();
  my $HealPoints = -140120;
  $npc->SetHP($curhp + $HealPoints);
  }
    if($signal == 75){
  my $curhp = $npc->GetHP();
  my $HealPoints = -140120;
  $npc->SetHP($curhp + $HealPoints);
  }
    if($signal == 70){
  my $curhp = $npc->GetHP();
  my $HealPoints = -140120;
  $npc->SetHP($curhp + $HealPoints);
  }
    if($signal == 65){
  my $curhp = $npc->GetHP();
  my $HealPoints = -140120;
  $npc->SetHP($curhp + $HealPoints);
  }
    if($signal == 60){
  my $curhp = $npc->GetHP();
  my $HealPoints = -140120;
  $npc->SetHP($curhp + $HealPoints);
  }
    if($signal == 55){
  my $curhp = $npc->GetHP();
  my $HealPoints = -140120;
  $npc->SetHP($curhp + $HealPoints);
  }
  if($signal == 50){
  my $curhp = $npc->GetHP();
  my $HealPoints = -140120;
  $npc->SetHP($curhp + $HealPoints);
  }
  if($signal == 45){
  my $curhp = $npc->GetHP();
  my $HealPoints = -140120;
  $npc->SetHP($curhp + $HealPoints);
  }
  if($signal == 40){
  my $curhp = $npc->GetHP();
  my $HealPoints = -140120;
  $npc->SetHP($curhp + $HealPoints);
  }
  if($signal == 35){
  my $curhp = $npc->GetHP();
  my $HealPoints = -140120;
  $npc->SetHP($curhp + $HealPoints);
  }
  if($signal == 30){
  my $curhp = $npc->GetHP();
  my $HealPoints = -140120;
  $npc->SetHP($curhp + $HealPoints);
  }
  if($signal == 25){
  my $curhp = $npc->GetHP();
  my $HealPoints = -140120;
  $npc->SetHP($curhp + $HealPoints);
  }
  if($signal == 20){
  my $curhp = $npc->GetHP();
  my $HealPoints = -140120;
  $npc->SetHP($curhp + $HealPoints);
  }
  if($signal == 15){
  my $curhp = $npc->GetHP();
  my $HealPoints = -140120;
  $npc->SetHP($curhp + $HealPoints);
  }
  if($signal == 10){
  my $curhp = $npc->GetHP();
  my $HealPoints = -140120;
  $npc->SetHP($curhp + $HealPoints);
  }
  if($signal == 5){
  my $curhp = $npc->GetHP();
  my $HealPoints = -140120;
  $npc->SetHP($curhp + $HealPoints);
  }
  if($signal == 380){
    my $x = $npc->GetX(); 
    my $y = $npc->GetY(); 
    my $z = $npc->GetZ();  
    my $h = $npc->GetHeading(); 
  quest::spawn2(317151,0,0,$x,$y,$z,$h); 
  quest::depop();
   } 
 }
