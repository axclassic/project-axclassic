##Warden Hanvar 317139 is first of four killable versions of Warden Hanvar##
sub EVENT_SPAWN {
quest::setnexthpevent(75);
}
 sub EVENT_HP {
 if($hpevent == 75){
 	   quest::signalwith(317146,503,0);
  }
 }

