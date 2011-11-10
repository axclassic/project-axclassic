# Doomspade event spawner
#

sub EVENT_SPAWN {
  $doomshade = 0;
}

sub EVENT_SIGNAL {
  if ($signal == 99) {
    $doomshade += 1;
    if ($doomshade == 4) {
      quest::settimer("spawndoom",5);
    }
  }
  if ($signal == 199) {
    quest::settimer("nospawndoom",1800);
  }
}

sub EVENT_TIMER {
  if ($timer eq "spawndoom") {
    quest::emote("echoes throughout the plains as a tormented spirit is released upon the land.");
    quest::spawn2(176088,0,0,120,-297.5,5,63.5);
    quest::stoptimer("spawndoom");
    quest::depop();
  }
  if ($timer eq "nospawndoom") {
    quest::stoptimer("nospawndoom");
    quest::signalwith(176105,399,0);
    quest::depop();
  }
}

# EOF Zone: umbral ID: 176087 NPC: a_tortured_scream

