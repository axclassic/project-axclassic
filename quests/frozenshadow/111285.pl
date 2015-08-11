sub EVENT_DEATH {
quest::signalwith(111197,407,0);
quest::delglobal("omica");
 quest::setglobal("omica",2,3,"F");
 $omica=undef;
}