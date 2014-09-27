sub EVENT_SIGNAL {
if($signal == 109) { #signal 109 signal from controller to speak#
quest::emote(' smiles broadly');
quest::shout("You certainly will find Rage difficult to stop. I see it boiling up inside many of you. Allow it to take over, and Rage will ruin you.");
}
}
sub EVENT_DEATH {
quest::signalwith(340049,113,0); 
}