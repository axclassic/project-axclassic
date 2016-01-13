sub EVENT_SIGNAL{
  if($signal == 405){
quest::shout("I got it, sending new signal");
    quest::signalwith(166962,401,0);
quest::shout("signal sent");
    }
  }
