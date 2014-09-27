sub EVENT_SIGNAL {
if($signal == 109) { #signal 109 signal from controller to speak#
quest::emote(' In a clear, ringing voice');
quest::shout("Please forgive my poor humor, but I am very eager to test your mettle.");
}
}
sub EVENT_DEATH {
quest::signalwith(340049,113,0); 
}
