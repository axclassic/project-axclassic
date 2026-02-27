sub EVENT_WAYPOINT { 
  if($wp == 4) { 
  quest::signalwith(340079,566,10);
  }
  elsif($wp == 5) {
  quest::spawn2(340082,340070,0,183.5,936.8,61.5,255.2);
  quest::depop();
  }
  }
  sub EVENT_DEATH {
  quest::signalwith(340080,666,10);
  quest::spawn2(340082,340070,0,183.5,936.8,61.5,255.2);
  }