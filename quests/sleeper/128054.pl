##128054 Master of the Guard##
sub EVENT_ATTACK{
quest::signalwith(128152,12820,10);
}
sub EVENT_SLAY{
quest::signalwith(128152,12821,10);
}
sub EVENT_DEATH{
quest::signalwith(128152,12821,10);
}