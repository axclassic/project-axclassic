sub EVENT_SAY {
 if($text=~/hail/i) {
      quest::say("Hail and well met young traveler, do you have the item I need?");
	  }
	}
sub EVENT_ITEM {
 if (plugin::check_handin(\%itemcount, 48143 => 1)) {	
      quest::say("Ah, finally I have finshed the elixer. Do me one last favor and bring this to Boldger Bristlebeard. I am sure he will reward you for this.");
	  quest::summonitem(120184);
	  quest::ding();
      quest::exp(1000000);
      quest::givecash(0,0,0,10);
   }
  }