#############
#Quest Name: ~EMPTY~
#Author: TBA
#NPCs Involved: Tyxlin_Ruby
#Items Involved:
#zone: swampofnohope
#Revised: Crabclaw <<Good froggie for a gem-collecta quest>>

sub EVENT_SAY {
	my $greetings = int(rand(4));
	if($text=~/Hail/i && $greetings == 0){
		quest::say("*bows* Greetings fine sir. Can I be of service to you?");
	}elsif($text=~/Hail/i && $greetings == 1){
		quest::say("*sighs* To be trapped in here on this fine day...I would rather be out with my more learned freinds, talking of poetry and song....");
	}elsif($text=~/Hail/i && $greetings == 2){
		quest::say("A pleasure to meet you.");
	}elsif($text=~/Hail/i && $greetings == 3){
		quest::say("<Ribbit!> Good day, I suppose.");
	}
}
#END of FILE Zone:swampofnohope ID:83280