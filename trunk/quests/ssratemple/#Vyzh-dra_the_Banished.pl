# triggers vyzh`dra the cursed on death
#

sub EVENT_SPAWN {
  quest::settimer("despawn",3600);
}

sub EVENT_DEATH {
  quest::stoptimer("despawn");
  quest::spawn2(162206,0,0,-51,-9,-218.1,63);
}

sub EVENT_TIMER {
  quest::stoptimer("despawn");
  quest::depop();
}

# EOF zone: ssratemple ID: 162214 NPC: #Vyzh`dra_the_Banished

