##Dark_Lady_controller##
sub EVENT_SPAWN{
quest::spawn2(340071,0,0,2262.5,-816.3,125.5,237);
quest::signalwith(340071,551,48000);
}
sub EVENT_SIGNAL {
if ($signal == 550){
quest::spawn2(340069,0,0,2101.5,-624.7,126.7,252.8);
quest::depop();
}
}