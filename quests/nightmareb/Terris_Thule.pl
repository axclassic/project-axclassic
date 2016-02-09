sub EVENT_SPAWN{
   quest::shout("You fool! You did not earn this prize on your own! The contract that has been drawn is now invalid. You will never leave my grasp, prepare your soul for eternal torment!");
   quest::emote(' laughs heartily and then vanishes in a swirl of incorporeal mist.');
   quest::signalwith(221009,221,1000);
   quest::settimer("Terris_up",50);
  }
 sub EVENT_TIMER{
 if($timer eq "Terris_up"){
     quest::stoptimer("Terris_up");
   quest::depop();
   }
 }  
