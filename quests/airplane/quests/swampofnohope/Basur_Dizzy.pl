#############
#Quest Name: ~EMPTY~
#Author: TBA
#NPCs Involved: Basur_Dizzy
#Items Involved:
#zone: swampofnohope
#Revised: Crabclaw 

sub EVENT_SAY {
	my $greetings = int(rand(4));
	if($text=~/Hail/i && $greetings == 0){
		quest::say("*looks at you dizzly* Is that you Merabo?");
	}elsif($text=~/Hail/i && $greetings == 1){
		quest::say("Oh my! <Frooooak!> Excuse me.");
	}elsif($text=~/Hail/i && $greetings == 2){
		quest::say("Isshh a good day for a dwink eh? <Ribbit!>");
	}elsif($text=~/Hail/i && $greetings == 3){
		quest::say( "<Ribbit!> Another drink to Mithaniel Marr!");
	}
}
#END of FILE Zone:swampofnohope ID:83264