sub EVENT_SPAWN
{
quest::settimer(3,3600);
}

sub EVENT_TIMER
{
if($timer == 3)
{
quest::depop;
}
}

sub EVENT_DEATH
{
quest::spawn2(200060,33,0,325,325,-71.5,138.6);
quest::spawn2(200061,34,0,290,325,-71.5,138.6);
}

