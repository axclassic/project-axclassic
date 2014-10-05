sub EVENT_WAYPOINT { 
  if($wp == 5) { 
  quest::signalwith(340079,566,0);
  }
  elsif($wp == 6) {
  quest::spawn2(340087,340076,0,825.8,-406,-6.1,254.8);
  quest::depop();
  }
  }
  sub EVENT_DEATH {
  quest::signalwith(340080,666,0);
  quest::spawn2(340087,340076,0,825.8,-406,-6.1,254.8);
  }