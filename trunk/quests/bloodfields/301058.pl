sub EVENT_SPAWN {
quest::say("I wish to speak with the one that freed me.");
   }
sub EVENT_SAY {
   if($text=~/Hail/i){
   quest::say("Aaaah! I thank you, $name. You have freed me from such torture! Imagine me, Grinbik the Fertile, forced to kill and destroy! I was created to nurture and protect! I must go back to my own home and begin again to be what I was ment to be. I am honored and grateful to you for saving me. I see that you carry a powerful seed, nearly a seedling with its desire to grow! As my first act upon regaining myself I must aid you. If you wish that seed to flourish, you must find the land here that remains fertile. It is a rare thing but I have seen it. Take with you my blessing. This is a portion of my own power and it will aid you and that seed. Thank you again $name! All present should praise you for your kind heart and warrior soul.");   
   quest::summonitem(62622);
   quest::spawn2(301060,0,0,575,178.1,-953.2,25.2);
   quest::depop();
   }
 }