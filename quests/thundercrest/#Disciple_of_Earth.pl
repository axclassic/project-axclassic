sub EVENT_SIGNAL {
if($signal == 109) { #signal 109 signal from controller to speak#
quest::shout("When we have defeated you, I shall see that your corpses rot in the soil as is proper.");
}
}
sub EVENT_DEATH {
quest::signalwith(340049,113,0); 
}