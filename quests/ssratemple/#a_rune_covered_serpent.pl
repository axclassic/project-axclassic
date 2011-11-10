# triggers vyzh`dra the banished on death
#

sub EVENT_SPAWN {
  quest::settimer("despawn",3600);
}

sub EVENT_DEATH {
  quest::stoptimer("despawn");
  quest::spawn2(162214,0,0,-51,-9,-218.1,63);
}

sub EVENT_TIMER {
  quest::stoptimer("despawn");
  quest::depop();
}

# EOF zone: ssratemple ID: 162253 NPC: #a_rune_covered_serpent

