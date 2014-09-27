sub EVENT_SIGNAL {
if($signal == 109) { #signal 109 signal from controller to speak#
quest::shout("Ah, yes. You must forgive Fire, for he cares little for pleasantries. It is part of his charm. You most certainly will be worthy opponents. I am honored to face you.");
}
}
sub EVENT_DEATH {
quest::signalwith(340049,113,0); 
}