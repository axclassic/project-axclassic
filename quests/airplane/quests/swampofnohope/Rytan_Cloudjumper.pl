#############
#Quest Name: ~EMPTY~
#Author: TBA
#NPCs Involved: Rytan_Cloudjumper
#Items Involved:
#zone: swampofnohope
#Revised: Crabclaw 

sub EVENT_SAY {
	my $greetings = int(rand(4));
	if($text=~/Hail/i && $greetings == 0){
		quest::say("Well met and good day to you!");
	}elsif($text=~/Hail/i && $greetings == 1){
		quest::say("<Ribbit!> *sighs* Still no sigh of our mother. I hope she made it out of Guk alive....");
	}elsif($text=~/Hail/i && $greetings == 2){
		quest::say("<Ribbit!> Greetings, is there anything you are looking for?");
	}elsif($text=~/Hail/i && $greetings == 3){
		quest::say("Please look around!");
	}
}
#END of FILE Zone:swampofnohope ID:83289