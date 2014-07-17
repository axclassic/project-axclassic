
sub EVENT_SAY {
 if($text =~ /Hail/i) {
	quest::say('Close the door and be gone fool !! You are going to give away my hiding spot!!');
 }
}

sub EVENT_ITEM {
 if($itemcount{10400} == 1) {
	quest::say('At last I may leave this place!! Good luck destroying my abomination, you will surely need it against my most powerful yet uncontrolable creation!');
    quest::ding();
	quest::faction(71,-10)
    quest::faction(91,10)
    quest::faction(115,10)
    quest::faction(76,10) 
    quest::exp(2500);	
	quest::spawn2(63098,0,0,60.9,597.3,19.8,124.9);
	quest::depop();
 }
}
