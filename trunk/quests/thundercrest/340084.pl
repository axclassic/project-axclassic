sub EVENT_WAYPOINT { 
  if($wp == 5) { 
  quest::signalwith(340079,566,0);
  }
  if($wp == 6) {
  quest::spawn2(340084,340072,0,648.4,298.5,61.6,62);
  quest::depop();
  }
  }
  sub EVENT_DEATH {
  quest::signalwith(340080,666,0);
  quest::spawn2(340084,340072,0,648.4,298.5,61.6,62);
  }