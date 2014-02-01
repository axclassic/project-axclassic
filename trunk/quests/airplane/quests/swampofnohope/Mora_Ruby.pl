#############
#Quest Name: ~EMPTY~
#Author: TBA
#NPCs Involved: Mora_Ruby
#Items Involved:
#zone: swampofnohope
#Revised: Crabclaw

sub EVENT_SAY {
	my $greetings = int(rand(4));
	if($text=~/Hail/i && $greetings == 0){
		quest::say("*bows* Greetings fine sir!");
	}elsif($text=~/Hail/i && $greetings == 1){
		quest::say("<Ribbit!> My husband Noirin so worries of Txlin....");
	}elsif($text=~/Hail/i && $greetings == 2){
		quest::say("A pleasure to meet you as well!.");
	}elsif($text=~/Hail/i && $greetings == 3){
		quest::say("Buying something for your someone special?");
	}
}
#END of FILE Zone:swampofnohope ID:83279