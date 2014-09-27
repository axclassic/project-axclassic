sub EVENT_SIGNAL {
if($signal == 109) { #signal 109 signal from controller to speak#
quest::emote(' mutters, I. . . You. . .');
quest::emote(' sighs');
quest::shout("I do not know what will happen next. I see the same misgiving in some of you. Could it be that you are like me? No, that seems unlikely.");
}
}
sub EVENT_DEATH {
quest::signalwith(340049,113,0); 
}