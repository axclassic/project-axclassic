 sub EVENT_SAY {
 my $return = quest::saylink("return", 1);
 my $finish = quest::saylink("finish", 1);
 if($text=~/hail/i) {
 quest::say("You $name have reached the end of this cave. Return any coin you may possess. If you wish to work you way through the tunnel again, speak $return and I shall place you back at the beginning."); 
 quest::say("If you are finished here and wish to go back to Grand Historian Gersh, speak $finish and it will be so."); }
if($text=~/return/i) {
  	quest::movepc(318,0.0,0.0,-11.1); }
if($text=~/finish/i) {
    quest::movepc(302,-1558.1,317.0,203.1); }
	}

sub EVENT_ITEM
 {

 if(plugin::check_handin(\%itemcount, 119839 => 1)){
    	quest::say("Thank you! Your actions shall be rewarded.");
    	quest::exp(1617247);
 	}

  elsif(plugin::check_handin(\%itemcount, 119839 => 2)){
    	quest::say("Thank you! Your actions shall be rewarded.");
    	quest::exp(3234494);
 	}
 
  elsif(plugin::check_handin(\%itemcount, 119839 => 3)){
    	quest::say("Thank you! Your actions shall be rewarded.");
    	quest::exp(4851742);
 	}

  elsif(plugin::check_handin(\%itemcount, 119839 => 4)){
    	quest::say("Thank you! Your actions shall be rewarded.");
    	quest::exp(6468990);
 	}

  else {

    quest::say("I hold no use for such items.");
        plugin::return_items(\%itemcount);
     if($platinum != 0 || $gold !=0 || $silver != 0 || $copper != 0) {
      quest::givecash($copper, $silver, $gold, $platinum);

	}

     }
}

