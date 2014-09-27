sub EVENT_SIGNAL {
if($signal == 109) { #signal 109 signal from controller to speak#
quest::shout("I make no apologies. I shall burn your hearts out!");
}
}
sub EVENT_DEATH {
quest::signalwith(340049,113,0); 
}