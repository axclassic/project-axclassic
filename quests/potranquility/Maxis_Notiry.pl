## Scroll Sale Whole Sale
## Resqu Miplez



sub EVENT_SAY{

  if($text=~/hail/i) {

    quest::say("Hello $name, I am looking to trade a nice sum for some Planes spell items, Parchments and Runes bring a good price in the bazzar. Do you have any you are willing to trade?");

  }


}


## Scroll Sale ##


sub EVENT_ITEM
 {

 if(plugin::check_handin(\%itemcount, 29112 => 1)){
    	quest::say("Thank you! I shall convert these and sell in the market.");

	quest::givecash(0, 0, 0, 100);

	}

  elsif(plugin::check_handin(\%itemcount, 29131 => 1)){
    			quest::say("Thank you! I shall convert these and sell in the market.");

  	quest::givecash(0, 0, 0, 200);

 	}
 
  elsif(plugin::check_handin(\%itemcount, 29132 => 1)){
    			quest::say("Thank you! I shall convert these and sell in the market.");

    	quest::givecash(0, 0, 0, 500);

  	}

  else {

    quest::say("I cant sell these! I need more contacts for that.");
        plugin::return_items(\%itemcount);
     if($platinum != 0 || $gold !=0 || $silver != 0 || $copper != 0) {
      quest::givecash($copper, $silver, $gold, $platinum);

	}

     }

}


