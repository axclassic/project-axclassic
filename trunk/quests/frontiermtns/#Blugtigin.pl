# 3 corners spawn1
# EOF zone: frontiermtns
# SE corner mob

sub EVENT_DEATH
{
my $a = quest::ChooseRandom(92178,92029,9218); # Gromlok,a mountain giant hillock,mountain giant prospector
#quest::say("Spawning SW corner mob");
quest::spawn2($a,55,0,-1798,-29,-109.50,0);
}
