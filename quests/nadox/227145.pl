sub EVENT_SIGNAL {
if($signal == 101) {
quest::settimer(101, 30);
  }
}

sub EVENT_TIMER {
quest::stoptimer(101);
quest::depopall(227119);
quest::depopall(227140);
quest::depopall(227143);
quest::depopall(227142);
quest::depop(227145);
  }
