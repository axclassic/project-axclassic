sub EVENT_SIGNAL {
if ($signal == 1005){
quest::shout("Fools, I have followed the steps of this pathetic weakling who believes themselves to be a shadowknight. Now your lives will end and I will retrieve the blade destined to be mine! All of Norrath will fall before the might of the Mata Muram! Attack! Leave none standing!");
quest::signalwith(336101,1006,1000);
quest::depop();
}
}