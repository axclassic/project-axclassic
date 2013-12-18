# Shaman Epic 1.0
# Ooglyn
# Erud's Crossing (erudxing)
# Aramid September 2006
	
sub EVENT_SAY {
       if($text=~/ready/i) {
      quest::say("Ok $name, let us be off.");
  quest::start(64);
  quest::settimer("Speak",175);
	 quest::spawn2(98046,0,0,4210.8,-1609.6,-289.4,181);
	 }
	}

sub EVENT_TIMER {
 if ($timer eq "Speak") {
  quest::say("Ok, here is place for you to for waiting. Hab fun $name!");
  quest::stoptimer("Speak");
  quest::depop();
    
}
}