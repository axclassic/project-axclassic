sub EVENT_SAY {
if ($ulevel <= 40 && $ulevel >= 31 && $text=~/Hail/i){
   quest::say("Did you find the keys? If you have, then hand them to me so we can get out of this place!");
   }
 } 
sub EVENT_ITEM {
   if ($ulevel <= 40 && $ulevel >= 31 && plugin::check_handin(\%itemcount, 56020 => 1, 56021 => 1, 56022 => 1)) {  
   quest::say("I am free! Thank you $name."); 
   quest::ding();
   quest::exp(10000000);
   quest::givecash(0,0,0,40);
   $userid->Message(14,"Amaro has been freed. You have earned thanks from us all.");
   quest::depop();
   }
 }   