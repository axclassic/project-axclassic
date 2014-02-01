#############
#Quest Name: ~EMPTY~
#Author: TBA
#NPCs Involved: Fherik_Alarhun
#Items Involved:
#zone: swampofnohope
#Revised: Crabclaw 

sub EVENT_SAY {
	my $greetings = int(rand(5));
	if($text=~/Hail/i && $greetings == 0){
		quest::say("*bows* Greetings! Purchasing a work of clay today?");
	}elsif($text=~/Hail/i && $greetings == 1){
		quest::say("Garri! Pardak! A customer has arrived! Stop hopping around and see if $name needs assistance!");
	}elsif($text=~/Hail/i && $greetings == 2){
		quest::say("A pleasure to meet you!");
	}elsif($text=~/Hail/i && $greetings == 3){
		quest::say("Those brothers...always <Ribbit!> foolimg around!");
	}elsif($text=~/Hail/i && $greetings == 4){
		quest::say("Good day to you sir!");
	}
}
#END of FILE Zone:swampofnohope ID:83288