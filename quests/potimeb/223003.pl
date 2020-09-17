# 223003.pl a_summoned_boar

sub EVENT_DEATH {
    quest::signalwith(223158,1234,0); #signals phase5_trigger.pl with signal 1234
}
