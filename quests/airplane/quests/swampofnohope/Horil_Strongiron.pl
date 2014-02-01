#############
#Quest Name: ~EMPTY~
#Author: TBA
#NPCs Involved: Horil_Strongiron
#Items Involved:
#zone: swampofnohope
#Revised: Crabclaw

sub EVENT_SAY {
	my $greetings = int(rand(4));
	if($text=~/Hail/i && $greetings == 0){
		quest::say("Greetings and well met!");
	}elsif($text=~/Hail/i && $greetings == 1){
		quest::say("Greetings to you! <Frooak!>");
	}elsif($text=~/Hail/i && $greetings == 2){
		quest::say("Well, what can I help you with fine sir!");
	}elsif($text=~/Hail/i && $greetings == 3){
		quest::say("A fine day today, is it not?");
	}
}
#END of FILE Zone:swampofnohope ID:83274