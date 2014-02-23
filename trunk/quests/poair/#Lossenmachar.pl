sub EVENT_AGGRO{
	if defined($qglobals{dust_done}){
	quest::shout("Dust Done is active so I won't do anything!")
}
sub EVENT_DEATH {
	quest::signalwith(215461, 5);#Signal to #Dust_Trigger
}
