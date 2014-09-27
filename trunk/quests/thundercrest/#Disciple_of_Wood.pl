sub EVENT_SIGNAL {
if($signal == 109) { #signal 109 signal from controller to speak#
quest::shout("May our efforts here earn favor with those that watch over us all.");
}
}
sub EVENT_DEATH {
quest::signalwith(340049,113,0); 
}