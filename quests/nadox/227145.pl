sub EVENT_SIGNAL {
if($signal == 101) {
quest::settimer($spiritkeeper, 30);
  }
}

sub EVENT_TIMER {
if($spiritseeker == 1) {
quest::stoptimer(1);
quest::depopall(227119);
quest::depopall(227140);
quest::depopall(227143);
quest::depopall(227142);
quest::depop(227145);
  }
 } 