#############
#Quest Name: ~EMPTY~
#Author: TBA
#NPCs Involved: Hokar_Cloudjumper
#Items Involved:
#zone: swampofnohope
#Revised: Crabclaw 

sub EVENT_SAY {
	my $greetings = int(rand(4));
	if($text=~/Hail/i && $greetings == 0){
		quest::say("Well met!");
	}elsif($text=~/Hail/i && $greetings == 1){
		quest::say("Father! We are low on bow cams! Should I order to Qeynos to get some more? <Frooooak!>");
	}elsif($text=~/Hail/i && $greetings == 2){
		quest::say("<Ribbit!> Greetings!");
	}elsif($text=~/Hail/i && $greetings == 3){
		quest::say("Enjoy our wares!");
	}
}
#END of FILE Zone:swampofnohope ID:83281