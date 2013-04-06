# Resqu Miplez

# Plane patterns



sub EVENT_SAY{

  if($text=~/hail/i) {

    quest::say("Hello $name, I conduct trade with the Planes Guards, prehaps you would be interested in making a [deal]?");

  }

  elsif($text=~/deal/i) {

    quest::say("I would be willing to buy any patterns or molds. Well, as long as they are from the [planes]!");

  }

  elsif($text=~/planes/i) {

    quest::say("The Planes hold Ornate or Elemental armor patterns. They are used by the guards to renew their armor. Now what do you say you head off and find me some? I feel the cash rewards are more then fair.");

  }

}


## cash Ornate and Elemental Patterns ##


sub EVENT_ITEM
 {

 if(plugin::check_handin(\%itemcount, 16290 => 1)){
    	quest::say("Thank you!");

	quest::givecash(0, 0, 0, 200);

	}

  elsif(plugin::check_handin(\%itemcount, 16291 => 1)){
    			quest::say("Thank you!");

  	quest::givecash(0, 0, 0, 200);

 	}
 
  elsif(plugin::check_handin(\%itemcount, 16292 => 1)){
    			quest::say("Thank you!");

    	quest::givecash(0, 0, 0, 200);

  	}

  elsif(plugin::check_handin(\%itemcount, 16293 => 1)){
    			quest::say("Thank you!");

    	quest::givecash(0, 0, 0, 200);

  	}
 
  elsif(plugin::check_handin(\%itemcount, 16294 => 1)){
    			quest::say("Thank you!");

    	quest::givecash(0, 0, 0, 200);

  	}

  elsif(plugin::check_handin(\%itemcount, 16295 => 1)){
    			quest::say("Thank you!");

    	quest::givecash(0, 0, 0, 200);

  	}

  elsif(plugin::check_handin(\%itemcount, 16296 => 1)){
    			quest::say("Thank you!");

   	quest::givecash(0, 0, 0, 200);

  	}

  elsif(plugin::check_handin(\%itemcount, 16297 => 1)){
    			quest::say("Thank you!");

    	quest::givecash(0, 0, 0, 200);

  	}

  elsif(plugin::check_handin(\%itemcount, 16298 => 1)){
    			quest::say("Thank you!");

    	quest::givecash(0, 0, 0, 200);

  	}

  elsif(plugin::check_handin(\%itemcount, 16299 => 1)){
    			quest::say("Thank you!");

    	quest::givecash(0, 0, 0, 200);

  	}

  elsif(plugin::check_handin(\%itemcount, 16343 => 1)){
    			quest::say("Thank you!");

    	quest::givecash(0, 0, 0, 200);

  	}

  elsif(plugin::check_handin(\%itemcount, 16344 => 1)){
    			quest::say("Thank you!");

    	quest::givecash(0, 0, 0, 200);

  	}

  elsif(plugin::check_handin(\%itemcount, 16345 => 1)){
    			quest::say("Thank you!");

    	quest::givecash(0, 0, 0, 200);

  	}

  elsif(plugin::check_handin(\%itemcount, 16346 => 1)){
    			quest::say("Thank you!");

    	quest::givecash(0, 0, 0, 200);

  	}

  elsif(plugin::check_handin(\%itemcount, 16347 => 1)){
    			quest::say("Thank you!");

    	quest::givecash(0, 0, 0, 200);

  	}

  elsif(plugin::check_handin(\%itemcount, 16348 => 1)){
    			quest::say("Thank you!");

    	quest::givecash(0, 0, 0, 200);

  	}

  elsif(plugin::check_handin(\%itemcount, 16349 => 1)){
    			quest::say("Thank you!");

    	quest::givecash(0, 0, 0, 200);

  	}

  elsif(plugin::check_handin(\%itemcount, 16350 => 1)){
    			quest::say("Thank you!");

    	quest::givecash(0, 0, 0, 200);

  	}

  elsif(plugin::check_handin(\%itemcount, 16351 => 1)){
    			quest::say("Thank you!");

   	quest::givecash(0, 0, 0, 200);

  	}

  elsif(plugin::check_handin(\%itemcount, 16352 => 1)){
    			quest::say("Thank you!");

    	quest::givecash(0, 0, 0, 200);

  	}

  elsif(plugin::check_handin(\%itemcount, 16353 => 1)){
    			quest::say("Thank you!");

    	quest::givecash(0, 0, 0, 200);

  	}

  elsif(plugin::check_handin(\%itemcount, 16354 => 1)){
    			quest::say("Thank you!");

    	quest::givecash(0, 0, 0, 200);

  	}

  elsif(plugin::check_handin(\%itemcount, 16355 => 1)){
    			quest::say("Thank you!");

    	quest::givecash(0, 0, 0, 200);

  	}

  elsif(plugin::check_handin(\%itemcount, 16356 => 1)){
    			quest::say("Thank you!");

    	quest::givecash(0, 0, 0, 200);

  	}
  
elsif(plugin::check_handin(\%itemcount, 16357 => 1)){
    			quest::say("Thank you!");

    	quest::givecash(0, 0, 0, 200);

  	}

  elsif(plugin::check_handin(\%itemcount, 16358 => 1)){
    			quest::say("Thank you!");

    	quest::givecash(0, 0, 0, 200);

  	}

  elsif(plugin::check_handin(\%itemcount, 16359 => 1)){
   			quest::say("Thank you!");

   	quest::givecash(0, 0, 0, 200);

  	}

  elsif(plugin::check_handin(\%itemcount, 16360 => 1)){
    			quest::say("Thank you!");

    	quest::givecash(0, 0, 0, 200);

  	}

  elsif(plugin::check_handin(\%itemcount, 16362 => 1)){
    			quest::say("Thank you!");

    	quest::givecash(0, 0, 0, 400);

  	}

  elsif(plugin::check_handin(\%itemcount, 16364 => 1)){
    			quest::say("Thank you!");

    	quest::givecash(0, 0, 0, 400);

  	}

  elsif(plugin::check_handin(\%itemcount, 16365 => 1)){
    			quest::say("Thank you!");

    	quest::givecash(0, 0, 0, 400);

  	}

  elsif(plugin::check_handin(\%itemcount, 16366 => 1)){
    			quest::say("Thank you!");

    	quest::givecash(0, 0, 0, 400);

  	}

  elsif(plugin::check_handin(\%itemcount, 16367 => 1)){
    			quest::say("Thank you!");

    	quest::givecash(0, 0, 0, 400);

  	}

  elsif(plugin::check_handin(\%itemcount, 16368 => 1)){
    			quest::say("Thank you!");

    	quest::givecash(0, 0, 0, 400);

  	}

  elsif(plugin::check_handin(\%itemcount, 16369 => 1)){
    			quest::say("Thank you!");

    	quest::givecash(0, 0, 0, 400);

  	}

  elsif(plugin::check_handin(\%itemcount, 16370 => 1)){
    			quest::say("Thank you!");

    	quest::givecash(0, 0, 0, 400);

  	}

  elsif(plugin::check_handin(\%itemcount, 16371 => 1)){
    			quest::say("Thank you!");

    	quest::givecash(0, 0, 0, 400);

  	}
  elsif(plugin::check_handin(\%itemcount, 16372 => 1)){
    			quest::say("Thank you!");

    	quest::givecash(0, 0, 0, 400);

  	}

  elsif(plugin::check_handin(\%itemcount, 16373 => 1)){
    			quest::say("Thank you!");

    	quest::givecash(0, 0, 0, 400);

 	}

  elsif(plugin::check_handin(\%itemcount, 16374 => 1)){
    			quest::say("Thank you!");

    	quest::givecash(0, 0, 0, 400);

  	}

  elsif(plugin::check_handin(\%itemcount, 16376 => 1)){
    		quest::say("Thank you!");

    	quest::givecash(0, 0, 0, 400);

  	}

  elsif(plugin::check_handin(\%itemcount, 16378 => 1)){
   	 		quest::say("Thank you!");

    	quest::givecash(0, 0, 0, 400);

  	}

  elsif(plugin::check_handin(\%itemcount, 16379 => 1)){
   	 		quest::say("Thank you!");

   	quest::givecash(0, 0, 0, 400);
  	        
	}

  elsif(plugin::check_handin(\%itemcount, 16380 => 1)){
   	 		quest::say("Thank you!");

   	quest::givecash(0, 0, 0, 400);
  	        
	}

  elsif(plugin::check_handin(\%itemcount, 16381 => 1)){
  			quest::say("Thank you!");

  	quest::givecash(0, 0, 0, 400);
  	        
	}

  elsif(plugin::check_handin(\%itemcount, 16382 => 1)){
    			quest::say("Thank you!");

    	quest::givecash(0, 0, 0, 400);
  	        
	}

  elsif(plugin::check_handin(\%itemcount, 16383 => 1)){
    			quest::say("Thank you!");

    	quest::givecash(0, 0, 0, 400);
  	        
	}

  elsif(plugin::check_handin(\%itemcount, 16385 => 1)){
  			quest::say("Thank you!");

    	quest::givecash(0, 0, 0, 400);
  	        
	}

  elsif(plugin::check_handin(\%itemcount, 16386 => 1)){
    			quest::say("Thank you!");

    	quest::givecash(0, 0, 0, 400);
  	        
	}

  elsif(plugin::check_handin(\%itemcount, 16387 => 1)){
    			quest::say("Thank you!");

    	quest::givecash(0, 0, 0, 400);
  	        
	}

  elsif(plugin::check_handin(\%itemcount, 16388 => 1)){
    			quest::say("Thank you!");

    	quest::givecash(0, 0, 0, 400);
  	        
	}

  elsif(plugin::check_handin(\%itemcount, 16389 => 1)){
   			quest::say("Thank you!");

   	quest::givecash(0, 0, 0, 400);
  	        
	}

  else {

    quest::say("This is not what I asked for.");
        plugin::return_items(\%itemcount);
     if($platinum != 0 || $gold !=0 || $silver != 0 || $copper != 0) {
      quest::givecash($copper, $silver, $gold, $platinum);

	}

     }

}


