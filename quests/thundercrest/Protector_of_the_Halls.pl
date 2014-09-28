sub EVENT_DEATH {
quest::shout("sending signal 313 to controller.");
quest::signalwith(340056,313,0); 
}