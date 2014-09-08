sub EVENT_SPAWN {
quest::spawn2(338215,0,0,+657.5,1262.8,4.3,187.4);
}
sub EVENT_DEATH {
quest::signalwith(338215,850,0);

}