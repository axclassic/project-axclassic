#############
#Quest Name: ~EMPTY~
#Author: TBA
#NPCs Involved: Fahar_Sasy
#Items Involved:
#zone: swampofnohope
#Revised: Crabclaw 

sub EVENT_SAY {
	my $greetings = int(rand(4));
	if($text=~/Hail/i && $greetings == 0){
		quest::say("Greetings and well met!");
	}elsif($text=~/Hail/i && $greetings == 1){
		quest::say("<Frooooak!>. Well met my freind!");
	}elsif($text=~/Hail/i && $greetings == 2){
		quest::say("Good day to you! <Ribbit!>");
	}elsif($text=~/Hail/i && $greetings == 3){
		quest::say("A fine day, is it not?");
	}
}
#END of FILE Zone:swampofnohope ID:83287