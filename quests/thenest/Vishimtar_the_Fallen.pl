sub EVENT_SPAWN {

 quest::setnexthpevent(75);

 }

sub EVENT_HP {
 if (hpevent == 75){
 quest::signalwith(343255,620,0);
 quest::depop();
  }
}
