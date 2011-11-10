#############
#Quest Name: ~EMPTY~
#Author: TBA
#NPCs Involved: Noirin_Ruby
#Items Involved:
#zone: swampofnohope
#Revised: Crabclaw

sub EVENT_SAY {
	my $greetings = int(rand(4));
	if($text=~/Hail/i && $greetings == 0){
		quest::say("Greetings, a fine shiny perhaps?");
	}elsif($text=~/Hail/i && $greetings == 1){
		quest::say("<Frooak!> Do not mind my child, Tyxlin over there. He will enjoy taking to the the family trade.");
	}elsif($text=~/Hail/i && $greetings == 2){
		quest::say("The Ruby family has only the best gems in the norrath. Scavenged from the deepest depths of Norrath, insuring the rarest quality.");
	}elsif($text=~/Hail/i && $greetings == 3){
		quest::say("A fine day for shopping?");
	}
}
#END of FILE Zone:swampofnohope ID:83278