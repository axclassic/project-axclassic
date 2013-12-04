 sub EVENT_SAY {
 my $return = quest::saylink("return", 1);
 if($text=~/hail/i) {
 quest::say("Well done $name, speak $return and so it will be."); }
if($text=~/return/i) {
  	quest::movepc(78,3604,2097,-159,0);
	quest::depop()
	}
 }