# vyzh`dra the cursed event controller
#

my $counter;

sub EVENT_SPAWN {
  $counter = 0;
}

sub EVENT_SIGNAL {

  if (($signal == 162012) || ($signal == 162021) || ($signal == 162013) || ($signal == 162060) || ($signal == 162024) || ($signal == 162011) || ($signal == 162059) || ($signal == 162023) || ($signal == 162089) || ($signal == 162258)) {
    quest::settimer("one",3600);
    $counter += 1;
    if ($counter == 10) {
      quest::stoptimer("one");
      quest::spawn2(162261,0,0,-51,-9,-218.1,63);
      $counter = 0;
    }
  }
}

sub EVENT_TIMER {
  if ($timer eq "one") {
    quest::stoptimer("one");
    $counter = 0;
    quest::spawn2(162253,0,0,-51,-9,-218.1,63);
  }
}

# EOF zone: ssratemple ID: 162255 NPC: #Trigger_one

