sub EVENT_WAYPOINT { 
  if($wp == 6) { 
  quest::signalwith(340079,566,0);
  }
  if($wp == 7) {
  quest::spawn2(340085,340073,0,-643.7,-667.6,61.6,191.1);
  quest::depop();
  }
  }
  sub EVENT_DEATH {
  quest::signalwith(340080,666,0);
  quest::spawn2(340085,340073,0,-643.7,-667.6,61.6,191.1);
  }