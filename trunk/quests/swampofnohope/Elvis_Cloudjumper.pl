#############
#Quest Name: ~EMPTY~
#Author: TBA
#NPCs Involved: Elvis_Cloudjumper
#Items Involved:
#zone: swampofnohope
#Revised: Crabclaw 

sub EVENT_SAY {
	my $greetings = int(rand(4));
	if($text=~/Hail/i && $greetings == 0){
		quest::say("Well met! You'll never find a truer shot than with the fine arrows we make!");
	}elsif($text=~/Hail/i && $greetings == 1){
		quest::say("<Frooooak!>. My sons will be glad to tend to your needs!");
	}elsif($text=~/Hail/i && $greetings == 2){
		quest::say("Cloudjumpers bows are of the finest quality! <Ribbit!>");
	}elsif($text=~/Hail/i && $greetings == 3){
		quest::say("Good day!");
	}
}
#END of FILE Zone:swampofnohope ID:83258