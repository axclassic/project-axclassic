# Tegea_Prendyn
# patrikpatrik added levitate feature for boat 1/15/2017

sub EVENT_SAY {
	my $levitate = quest::saylink("levitate", 1);
	if($text=~/Hail/i) {
		quest::say("Hello $name. Would you like a $levitate?");
	} elsif($text=~/levitate/i) {
		quest::say("There you are, safe travels!");
		$npc->CastSpell(261, $userid);
	}
}