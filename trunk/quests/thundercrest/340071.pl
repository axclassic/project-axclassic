sub EVENT_SIGNAL {
IF ($SIGNAL == 551) {
quest::shout("What is going on here? Someone shall answer to the Lady of the Tempest for their actions here!");
quest::signalwith(340070,550,12000);
quest::depop();
}
}
