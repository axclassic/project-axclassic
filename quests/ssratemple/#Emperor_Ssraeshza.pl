# no-target emperor to depop when blood/blood golem killed
#

sub EVENT_SIGNAL {
  if ($signal == 99) {
    quest::settimer("spawnemp",350);
  }
}

sub EVENT_TIMER {
  if ($timer eq "spawnemp") {
    quest::spawn2(162227,0,0,$x,$y,$z,189.5);
    quest::stoptimer("spawnemp");
    quest::depop();
  }
}

# EOF zone: ssratemple ID: 162065 NPC: #Emperor_Ssraeshza

