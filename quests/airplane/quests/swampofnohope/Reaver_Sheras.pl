#############
#Quest Name: ~EMPTY~
#Author: TBA
#NPCs Involved: Reaver_Sheras
#Items Involved:
#zone: swampofnohope
#Revised: Crabclaw

sub EVENT_SAY {
	my $greetings = int(rand(4));
	if($text=~/Hail/i && $greetings == 0){
		quest::say("By the darkness, begon with you.");
	}elsif($text=~/Hail/i && $greetings == 1){
		quest::say("<Growls!>. You better have a good excuse....");
	}elsif($text=~/Hail/i && $greetings == 2){
		quest::say("Don't you hail me pondscum! <Frooak!>");
	}elsif($text=~/Hail/i && $greetings == 3){
		quest::say("My bussiness is my pleasure my freind. *glares*");
	}
}
#END of FILE Zone:swampofnohope ID:83298