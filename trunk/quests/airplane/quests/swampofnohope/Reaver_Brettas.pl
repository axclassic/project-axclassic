#############
#Quest Name: ~EMPTY~
#Author: TBA
#NPCs Involved: Reaver_Brettas
#Items Involved:
#zone: swampofnohope
#Revised: Crabclaw

sub EVENT_SAY {
	my $greetings = int(rand(4));
	if($text=~/Hail/i && $greetings == 0){
		quest::say("Death to our enemies.");
	}elsif($text=~/Hail/i && $greetings == 1){
		quest::say("<Frooooak!>. *glares at you*");
	}elsif($text=~/Hail/i && $greetings == 2){
		quest::say("Are you all we have? <Grumble.>");
	}elsif($text=~/Hail/i && $greetings == 3){
		quest::say("Go away.");
	}
}
#END of FILE Zone:swampofnohope ID:83297