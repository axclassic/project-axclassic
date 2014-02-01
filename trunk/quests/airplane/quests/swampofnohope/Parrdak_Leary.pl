#############
#Quest Name: ~EMPTY~
#Author: TBA
#NPCs Involved: Parrdak_Leary
#Items Involved:
#zone: swampofnohope
#Revised: Crabclaw 

sub EVENT_SAY {
	my $greetings = int(rand(5));
	if($text=~/Hail/i && $greetings == 0){
		quest::say("*giggles* Greetings sir! Can I help you?");
	}elsif($text=~/Hail/i && $greetings == 1){
		quest::say("*winks at Garrl* yes and it comes closer to town every day.");
	}elsif($text=~/Hail/i && $greetings == 2){
		quest::say("A pleasure to meet you $name! Pots and clay our our business!");
	}elsif($text=~/Hail/i && $greetings == 3){
		quest::say("*smirks back at Garrl* Yes, but she has my heart you know!");
	}elsif($text=~/Hail/i && $greetings == 4){
		quest::say("Good day to you sir!");
	}
}
#END of FILE Zone:swampofnohope ID:83284