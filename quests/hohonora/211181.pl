#The_Chaos 211181 This is the Final Chaos##
sub EVENT_SPAWN {
  my $curhp = $npc->GetHP();
  my $HealPoints = -50000;
  $npc->SetHP($curhp + $HealPoints);
  }