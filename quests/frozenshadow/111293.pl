sub EVENT_DEATH {
quest::signalwith(111214,424,0);
quest::delglobal("Tserr");
 quest::setglobal("Tserr",2,3,"F");
 $Tserr=undef;
}