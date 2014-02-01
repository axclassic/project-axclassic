#############
#Quest Name: ~EMPTY~
#Author: TBA
#NPCs Involved: Garrl_Leary
#Items Involved:
#zone: swampofnohope
#Revised: Crabclaw 

sub EVENT_SAY {
	my $greetings = int(rand(5));
	if($text=~/Hail/i && $greetings == 0){
		quest::say("*smiles* Greetings! Can I help you?");
	}elsif($text=~/Hail/i && $greetings == 1){
		quest::say("*Ignores you while talking intently to Parrdak* Did you see the size of that flying monstrosity? I swaer it almost had us when we were pelting it with rocks!");
	}elsif($text=~/Hail/i && $greetings == 2){
		quest::say("A pleasure to meet you! Pots and clay our our business!");
	}elsif($text=~/Hail/i && $greetings == 3){
		quest::say("*smirks at Parrdak whispering* She was a nice one wasn't she....");
	}elsif($text=~/Hail/i && $greetings == 4){
		quest::say("Good day to you sir!");
	}
}
#END of FILE Zone:swampofnohope ID:83286