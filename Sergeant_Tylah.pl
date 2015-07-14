sub EVENT_SAY{
if($text=~/Hail/i){
   quest::say("Good day to you $name, would you happen to have any boiled rockhopper eggs for sale? I'm so very hungry and they're my favorite food."); 
   }
   }
   sub EVENT_ITEM{
   if (plugin::check_handin(\%itemcount, 3457 == 4)) {
   quest::emote('devours all four of the eggs in the blink of an eye.');
   quest::say("Delicious! May the spirits bless you Shizukana! Here are a few acrylia flakes for your trouble. I'll be happy to pay for more should you find yourself with any extra!");
   quest::summonitem(3459);
   quest::ding();
   quest::exp (3000);
   }
   }
   #End of Script Sergeant_Tylah ID#166080 Hollowshade Moor
