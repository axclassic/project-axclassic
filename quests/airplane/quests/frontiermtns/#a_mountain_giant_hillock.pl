# 3 corners spawn1
# EOF zone: frontiermtns
# SW corner mob 

sub EVENT_DEATH
{
my $a = quest::ChooseRandom(92154,92065,92173); # eboneyes, burynai miner, burynai grand cenobite
#quest::say("Spawning NW corner mob");
quest::spawn2($a,151,0,2486,1386,267.88,192);
}
