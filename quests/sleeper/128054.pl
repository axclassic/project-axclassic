##128054 Master of the Guard##
sub EVENT_ATTACK{
quest::signalwith(128152,12820,0);
}
sub EVENT_SLAY{
quest::signalwith(128152,12821,0);
}
sub EVENT_DEATH{
quest::signalwith(128152,12821,0);
}