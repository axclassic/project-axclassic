sub EVENT_SIGNAL {
if($signal == 109) { #signal 109 signal from controller to speak#
quest::shout("I hate you! I will rend you into bite-sized chunks of flesh and feed them to the puma!' Rage's face darkens with blood and flecks of spittle fly from his mouth as he pants and stares at his enemies.");
}
}
sub EVENT_DEATH {
quest::signalwith(340049,113,0); 
}