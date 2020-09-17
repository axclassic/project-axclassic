# 223195.pl A_Firebone_Caster

sub EVENT_DEATH {
	quest::signalwith(223158,1234,0); #signals phase5_trigger.pl with signal 1234
}
