 sub EVENT_SAY {
 my $return = quest::saylink("return", 1);
 my $finish = quest::saylink("finish", 1);
 if($text=~/hail/i) {
 quest::say("You $name have reached the end of this cave. If you wish to work you way through the tunnel again, speak $return and I shall place you back at the beginning."); 
 quest::say("If you are finished here and wish to go back to Grand Historian Gersh, speak $finish and it will be so."); }
if($text=~/return/i) {
  	quest::movepc(320,5.0,-51.0,-44.6); }
if($text=~/finish/i) {
    quest::movepc(302,-1558.1,317.0,203.1); }
	}

