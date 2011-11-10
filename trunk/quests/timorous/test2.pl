sub EVENT_SAY
{

if ($text =~/Hail/i)
{
quest::say ("Well hello there $name. Do you want to run away with me? Oh well I bet you want to [go] to the Plane of Knowledge? If you wish it I can send you to [Butcherblock] or [North Ro] ");
}

if ($text =~/go/i)
{
quest::say ("$name , stand close to me while I cast..");
quest::emote ("moves his hands as if chanting...");
quest::movepc(202, -118,-193,-156);
}

if ($text =~/butcherblock/i)
{
quest::say ("Very well $name, to Butcherblock you must go.");
quest::emote ("turns slightly to the left and winks.");
quest::movepc (68, 1355, 3252, 13);
}

if ($text =~/north ro/i)
{
quest::say ("Well if you must go to your death fine I'll not be to blame.");
quest::emote ("sighs as she summons a spinning vortex.");
quest::movepc (34, 790, -923, 2);
}
}

