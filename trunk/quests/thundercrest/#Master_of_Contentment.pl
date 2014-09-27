sub EVENT_SIGNAL {
if($signal == 109) { #signal 109 signal from controller to speak#
quest::emote(' drawls');
quest::shout("Ah! I am pleased to meet you all. This is a fine challenge for us, is it not? I find this sort of exercise invigorating, though rarely do I find invigoration to be a good thing.");
}
}
sub EVENT_DEATH {
quest::signalwith(340049,113,0); 
}