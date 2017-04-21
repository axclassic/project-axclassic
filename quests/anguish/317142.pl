##Warden_Hanvar 317142 is Invul and No Target during the fourth event encountered in the Asylum of Anguish raid expedition. He is also a bot epic mob and upon his death spawns Orb of Discordant Energy which may drop another bot epic piece.## 
sub EVENT_SIGNAL {
   if($signal == 514) {
        my $curhp = $npc->GetHP();
  my $HealPoints = -200200;
  $npc->SetHP($curhp + $HealPoints);
  }
   elsif($signal == 515) {
        my $curhp = $npc->GetHP();
  my $HealPoints = -400400;
  $npc->SetHP($curhp + $HealPoints);
  }  
     elsif($signal == 516) {
        my $curhp = $npc->GetHP();
  my $HealPoints = -600600;
  $npc->SetHP($curhp + $HealPoints);
  }
  else {
  #Do Nothing
  }
 }
 