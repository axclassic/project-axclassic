# triggers vyzh`dra the exiled on death
#

sub EVENT_SPAWN {
  quest::settimer("despawn",3600);
}

sub EVENT_DEATH {
  quest::stoptimer("despawn");
  quest::spawn2(162232,0,0,-51,-9,-218.1,63);
}

sub EVENT_TIMER {
  quest::stoptimer("despawn");
  quest::depop();
}

# EOF zone: ssratemple ID: 162261 NPC: #a_glyph_covered_serpent

