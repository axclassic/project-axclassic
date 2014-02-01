#############
#Quest Name: ~EMPTY~
#Author: TBA
#NPCs Involved: Perago_Dizzy
#Items Involved:
#zone: swampofnohope
#Revised: Crabclaw

sub EVENT_SAY {
	my $greetings = int(rand(4));
	if($text=~/Hail/i && $greetings == 0){
		quest::say("Greetings and well met!");
	}elsif($text=~/Hail/i && $greetings == 1){
		quest::say("Don't mind my family, I am the only one who does not drink. <Frooooak!>");
	}elsif($text=~/Hail/i && $greetings == 2){
		quest::say("<Ribbit!> I must apologise for Basur he never got over the dire straights we are all in.");
	}elsif($text=~/Hail/i && $greetings == 3){
		quest::say("A fine day, indeed!");
	}
}
#END of FILE Zone:swampofnohope ID:83261