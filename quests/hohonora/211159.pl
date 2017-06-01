##Dolgrem, Guardian of the Elements 211159 Trigger for the twins##
sub EVENT_SIGNAL{
if($signal == 250){
       my $curhp = $npc->GetHP();
  my $HealPoints = -15000;
  $npc->SetHP($curhp + $HealPoints);
  }
  }
  sub EVENT_DEATH {
  quest::spawn2(211125,0,0,-870.9,974.1,1,238.8);
  quest::spawn2(211126,0,0,-967.4,1184.9,1,103.3);
  }