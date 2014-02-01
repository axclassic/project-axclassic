#############
#Quest Name: ~EMPTY~
#Author: TBA
#NPCs Involved: Merabo_Dizzy
#Items Involved:
#zone: swampofnohope
#Revised: Crabclaw

sub EVENT_SAY {
	my $greetings = int(rand(4));
	if($text=~/Hail/i && $greetings == 0){
		quest::say("Greetings and well met!");
	}elsif($text=~/Hail/i && $greetings == 1){
		quest::say("<Frooooak!>. Good day for a drink, eh!");
	}elsif($text=~/Hail/i && $greetings == 2){
		quest::say("<Hiccup!>");
	}elsif($text=~/Hail/i && $greetings == 3){
		quest::say("Ah, nothing beats some crispy flies and a cold ale!");
	}
}
#END of FILE Zone:swampofnohope ID:83262