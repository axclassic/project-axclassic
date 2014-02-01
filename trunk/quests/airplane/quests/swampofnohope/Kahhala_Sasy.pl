#############
#Quest Name: ~EMPTY~
#Author: TBA
#NPCs Involved: Kahhala_Sasy
#Items Involved:
#zone: swampofnohope
#Revised: Crabclaw

sub EVENT_SAY {
	my $greetings = int(rand(5));
	if($text=~/Hail/i && $greetings == 0){
		quest::say("Greetings and well met!");
	}elsif($text=~/Hail/i && $greetings == 1){
		quest::say("<Frooooak!> Perhaps a slice of cake?");
	}elsif($text=~/Hail/i && $greetings == 2){
		quest::say("Looking or anything? I just got in some crispy flies, quite delicious! <Ribbit!>");
	}elsif($text=~/Hail/i && $greetings == 3){
		quest::say("A fine day for some of my fine fineries!");
	}elsif($text=~/Hail/i && $greetings == 4){
		quest::say("Have you spoken with my husband Farhar?");
	}
}
#END of FILE Zone:swampofnohope ID:83285