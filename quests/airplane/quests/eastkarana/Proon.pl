#NPC: Proon   Zone: eastkarana
#by Qadar

sub EVENT_SPAWN {
  quest::settimer(1,400);
}

sub EVENT_COMBAT {
  if($combat_state == 1) {
    quest::stoptimer(1);
  }
  if($combat_state == 0) {
    quest::settimer(1,400);
  }
}

sub EVENT_DEATH {
  quest::say("ARGH!!!..  Broon?  Broon?  That you?  What all this bright light?  I coming son.  argh.. argh..  Don't cry..  Poppa here now..  argh..");
}

sub EVENT_WAYPOINT {
  if($wp == 20){
    quest::start(136);
  }
}

sub EVENT_TIMER {
  if($timer == 1) {
    quest::depop();
  }
}
