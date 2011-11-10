#############
#Quest Name: ~EMPTY~
#Author: TBA
#NPCs Involved: Sardax
#Items Involved:
#zone: swampofnohope
#Revised: Crabclaw

sub EVENT_SAY {
	my $greetings = int(rand(4));
	if($text=~/Hail/i && $greetings == 0){
		quest::say("And why would you wish to disturb me!");
	}elsif($text=~/Hail/i && $greetings == 1){
		quest::say("<Frooooak!>. Blasted interuptions!");
	}elsif($text=~/Hail/i && $greetings == 2){
		quest::say("Leave me be! <Ribbit!>");
	}elsif($text=~/Hail/i && $greetings == 3){
		quest::say("I have no time for you!");
	}
}
#END of FILE Zone:swampofnohope ID:83200