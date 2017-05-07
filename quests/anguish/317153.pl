##Third and Final Overlord Mata Muram 317138##
sub EVENT_SPAWN {
  my $curhp = $npc->GetHP();
  my $HealPoints = -875000;
  $npc->SetHP($curhp + $HealPoints);
  quest::shout("Now!, let us finish this. Come close I have something for you!");
  }

 