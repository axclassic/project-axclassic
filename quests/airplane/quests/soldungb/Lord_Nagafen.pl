# Attempt to limit players level 53 and over from engaging nagafen and vox.
# On live servers a player is banished to lavastorm but with the revamped
# zone problem players will be temporarily sent to soldunga safe point until
# lavastorm is a useable zone.


sub EVENT_SPAWN {
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  quest::set_proximity($x - 200, $x + 200, $y - 200, $y + 200);
}

sub EVENT_ENTER {
  if (($ulevel >= 53) && ($status == 0)) {
    quest::echo("I will not fight you, but I will banish you!");
    quest::movepc(31,-485.77,-476.04,73.72);
  }
}

sub EVENT_AGGRO {
  quest::settimer("getloc",15); #mob will get position every 15 seconds if pulled away from spawn point
}

sub EVENT_TIMER {
  quest::clear_proximity();
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  quest::set_proximity($x - 200, $x + 200, $y - 200, $y + 200);
}

sub EVENT_DEATH {
  quest::stoptimer("getloc");
  quest::clear_proximity();
}

# EOF zone: soldungb ID: 32040 NPC: Lord_Nagafen

