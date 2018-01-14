# gnome slave 56102
sub EVENT_SAY {
   if($text=~/Hail/i) {
      quest::say("Slavers are just lackeys for the [taskmaster]. He is the real one in charge.");
   }
   if($text=~/taskmaster/i) {
      quest::say("The taskmaster?? He's in Crushbone and is a large orc who runs around with that [bronze earring] in his ear.");
   }
   if($text=~/bronze earring/i) {
      quest::say("Yeah, a bronze earring. He wears it like a newly crowned king. If I ever had that earring I know I would stand a chance at escape.");
   }
}

sub EVENT_ITEM {
   #Shackle key
   if($copper >= 1 || $item1 != 20024) {
      quest::say("Not that!! I need key number 24!!");
   }
   if($item1 == 20024) {
      quest::say("Good work!! I shall be on my way. Farewell my friend!!");
      quest::givecash(0,2,4,0);
      quest::ding();
      quest::exp(10000);
      quest::faction(76,-2);  # Deep Muses
      quest::faction(115,-1); # Gem Choppers
      quest::faction(176,-1); # King AkAnon
      quest::faction(210,-1); # Kelethin Merchants
      quest::depop();
   }

   #Taskmaster earring
   if($item1 == 10351) {
      quest::say("You killed the taskmaster?!  Absolutely amazing! The orcs will be fighting among themselves for power now and I can disappear in the commotion. Thanks, friend! Take this for your deeds!");
      quest::summonitem(18903);
      quest::ding();
      quest::exp(15000);
      quest::depop();
   }
}
