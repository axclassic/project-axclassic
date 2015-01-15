sub EVENT_SPAWN {
quest::say("I wish to speak with the one that freed me.");
   }
sub EVENT_SAY {
   if($text=~/Hail/i){
   quest::say("Aaaah! I thank you, $name. You have freed me from such torture! Imagine me, Grinbik the Fertile, forced to kill and destroy! I was created to nurture and protect! I must go back to my own home and begin again to be what I was ment to be. I am honored and grateful to you for saving me. I see that you carry a powerful seed, nearly a seedling with its desire to grow! I should aid you in your quest but alas the item you seek, I have lost. Thank you again $name! All present should praise you for your kind heart and warrior soul.");   
   quest::depop();
   }
 }