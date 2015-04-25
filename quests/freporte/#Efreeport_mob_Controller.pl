#Efreeport_mob_Controller#
sub EVENT_SPAWN {
    my $a = quest::ChooseRandom(10012,10182,10203,10204);
  quest::spawn2($a,0,0,-855,-211,-55,-191.5);
      quest::depop();
  }
