#############
#Quest Name: ~EMPTY~
#Author: TBA
#NPCs Involved: Reaver_Dovan
#Items Involved:
#zone: swampofnohope
#Revised: Crabclaw

sub EVENT_SAY {
	my $greetings = int(rand(4));
	if($text=~/Hail/i && $greetings == 0){
		quest::say("All hail the darkness!");
	}elsif($text=~/Hail/i && $greetings == 1){
		quest::say("<Frooooak!>. Revenge for our fallen!");
	}elsif($text=~/Hail/i && $greetings == 2){
		quest::say("Weakling begone! <Ribbit!>");
	}elsif($text=~/Hail/i && $greetings == 3){
		quest::say("You better have a good reason to bother me!");
	}
}
#END of FILE Zone:swampofnohope ID:83299