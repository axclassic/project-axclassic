#############
#Quest Name: ~EMPTY~
#Author: TBA
#NPCs Involved: Radie_Strongiron
#Items Involved:
#zone: swampofnohope
#Revised: Crabclaw

sub EVENT_SAY {
	my $greetings = int(rand(4));
	if($text=~/Hail/i && $greetings == 0){
		quest::say("Greetings and well met!");
	}elsif($text=~/Hail/i && $greetings == 1){
		quest::say("<Frooooak!>. Strike whilst the iron is hot I say!");
	}elsif($text=~/Hail/i && $greetings == 2){
		quest::say("Salutations <Ribbit!>");
	}elsif($text=~/Hail/i && $greetings == 3){
		quest::say("Taken to smithing I see?");
	}
}
#END of FILE Zone:swampofnohope ID:83275