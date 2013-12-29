sub EVENT_DEATH {
#player kills a_shadow_master
if ((163477==1)&&(163478==1)&&(163479==1)&&(163480==1)&&(163481==1)&&(163482==1)&&(163483==3)&&(163484==1)&&(163485==1)&&(163486==1)&&(163045==1)&&(163046==1)){
quest::depop(163075);
quest::spawn2(163156);
}
}

sub EVENT_SPAWN
{
quest::setnexthpevent(25);
}
sub EVENT_HP
{
quest::spawn2(163097);
}