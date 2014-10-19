sub EVENT_SAY {
my $audience = quest::saylink("audience", 1);
   if ($ulevel <= 20 && $text=~/Hail/i) {
   quest::say("I am sorry but I have nothing for you to do. I suggest you check with the others around here, they may have something for someone of your experiance could do.");
   }
   if ($ulevel <= 30 && $ulevel >= 21 && $text=~/Hail/i){
   quest::say("I'm not that interested in becoming a servant of those followers of Firiona Vie myself, but I don't mind the cash they pay me. I keep most for me and throw a little back to the Wayfarers crew. If you're looking to get on their good side, I can make some money and you can gain their $audience.");
   }
   if ($ulevel <= 50 && $ulevel >= 31 && $text=~/Hail/i) {
   quest::say("I am sorry but I have nothing for you to do. I suggest you check with the others around here, they may have something for someone of your experiance could do.");
   }
   if ($ulevel <= 60 && $ulevel >= 51 && $text=~/Hail/i){
   quest::say("I'm not that interested in becoming a servant of those followers of Firiona Vie myself, but I don't mind the cash they pay me. I keep most for me and throw a little back to the Wayfarers crew. If you're looking to get on their good side, I can make some money and you can gain their $audience.");
   }
   if ($ulevel <= 30 && $ulevel >= 21 && $text=~/audience/i){
   quest::say("The blood of the drake is used for by the Norrath's Keepers to create potions that wards against some magical attacks. It serves them in the dragon lands. It would help me and them if you would gather some from Lavaspinner's Lair."); 
   quest::say("Collect four frothing drake bloods and return them to me, I will give your cut of the profits.");
   }
   if ($ulevel <= 60 && $ulevel >= 51 && $text=~/audience/i){
   quest::say("It would seem that little bit of fat from goblin flesh is good for our stock that we bring to Norrath's Keepers, especially the ones from Stillmoon Temple. It would seem it provides us with some resistances to the extreme conditions here. Go loot four Mottled Goblin Meat and return them to me.");
 }
 if ($ulevel >= 61 && $text=~/Hail/i) {
   quest::say("I am sorry but I have nothing for you to do. I suggest you check with the others around here, they may have something for someone of your experiance could do.");
   }
} 
sub EVENT_ITEM { 
   if ($ulevel <= 30 && $ulevel >= 21 && plugin::check_handin(\%itemcount, 54600 => 4)) {
   quest::ding();
   quest::exp(2000000);
   quest::givecash(0,0,0,25);
   }
   elsif ($ulevel <= 60 && $ulevel >= 51 && plugin::check_handin(\%itemcount, 54601 => 4)) {
   quest::ding();
   quest::exp(6000000);
   quest::givecash(0,0,0,50);
   }
 }  