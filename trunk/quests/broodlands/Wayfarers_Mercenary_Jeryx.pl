sub EVENT_SAY {
my $errands = quest::saylink("errands", 1);
my $Meat = quest::saylink("Meat", 1);
my $Taunting = quest::saylink("Taunting", 1);   
   if ($ulevel <= 50 && $text=~/Hail/i) {
   quest::say("I am sorry but I have nothing for you to do. I suggest you check with the others around here, they may have something for someone of your experiance could do.");
   }
   if ($ulevel >= 61 && $text=~/Hail/i) {
   quest::say("I am sorry the menial tasks I have would be a waist of your time explorer, Check with the others around here as they may have something you may be able to help with.");
   }   
   if ($ulevel <= 60 && $ulevel >= 51 && $text=~/Hail/i) {
   quest::say("So, you want to get in good with them dark crusaders, eh? I might be able to help you. If you run a few $errands for me, I can probably put in a good word.");
   }
   if ($ulevel <= 60 && $ulevel >= 51 && $text=~/errands/i) {
   quest::say("I have to jobs that would fit an explorer of your experiance. $Meat for Stew or $Taunting the Brood.");
   }
   if ($ulevel <= 60 && $ulevel >= 51 && $text=~/Meat/i) { 
   quest::say("You can certainly help us gather some goblin flesh from the Stillmoon Temple. Turns out it makes a pretty hearty stew for the Dark Reign. If you would, go loot 4 Mottled Goblin Meat and return them to me, I will split the profits with you."); 
   }
   if ($ulevel <= 60 && $ulevel >= 51 && $text=~/Taunting/i) {
   quest::say("Always coming after our goods, they are. The Dark Reign are trying to thin the population of the Stillmoon Temple to see if there is any reaction -- trying to draw dragons out. Maybe you can help them if you kill some Stillmoon creatures.");
   quest::say("Take this box and fill it with the Signet Rings that some of the Stillmoon Temple Residents must carry. Combine them in the box and return to me what you have created and I will reward you.");
   quest::summonitem(17148); 
   }
  }
 sub EVENT_ITEM {
if ($ulevel <= 51 && plugin::check_handin(\%itemcount, 54601 =>4)) { 
   quest::say("perfect! I will hand these over to the Dark Reign. Here is your cut.");
   quest::ding();
   quest::exp(2397650);
   quest::givecash(0,0,0,50);
   }
   elsif ($ulevel <= 52 && plugin::check_handin(\%itemcount, 54601 =>4)) { 
   quest::say("perfect! I will hand these over to the Dark Reign. Here is your cut.");
   quest::ding();
   quest::exp(2599630);
   quest::givecash(0,0,0,50);
   }
   elsif ($ulevel <= 53 && plugin::check_handin(\%itemcount, 54601 =>4)) { 
   quest::say("perfect! I will hand these over to the Dark Reign. Here is your cut.");
   quest::ding();
   quest::exp(2811810);
   quest::givecash(0,0,0,50);
   }
   elsif ($ulevel <= 54 && plugin::check_handin(\%itemcount, 54601 =>4)) { 
   quest::say("perfect! I will hand these over to the Dark Reign. Here is your cut.");
   quest::ding();
   quest::exp(4609070);
   quest::givecash(0,0,0,50);
   }
   elsif ($ulevel <= 55 && plugin::check_handin(\%itemcount, 54601 =>4)) { 
   quest::say("perfect! I will hand these over to the Dark Reign. Here is your cut.");
   quest::ding();
   quest::exp(3556840);
   quest::givecash(0,0,0,50);
   }
   elsif ($ulevel <= 56 && plugin::check_handin(\%itemcount, 54601 =>4)) { 
   quest::say("perfect! I will hand these over to the Dark Reign. Here is your cut.");
   quest::ding();
   quest::exp(3604360);
   quest::givecash(0,0,0,50);
   }
   elsif ($ulevel <= 57 && plugin::check_handin(\%itemcount, 54601 =>4)) { 
   quest::say("perfect! I will hand these over to the Dark Reign. Here is your cut.");
   quest::ding();
   quest::exp(3863100);
   quest::givecash(0,0,0,50);
   }
   elsif ($ulevel <= 58 && plugin::check_handin(\%itemcount, 54601 =>4)) { 
   quest::say("perfect! I will hand these over to the Dark Reign. Here is your cut.");
   quest::ding();
   quest::exp(4133300);
   quest::givecash(0,0,0,50);
   }
   elsif ($ulevel <= 59 && plugin::check_handin(\%itemcount, 54601 =>4)) { 
   quest::say("perfect! I will hand these over to the Dark Reign. Here is your cut.");
   quest::ding();
   quest::exp(6468990);
   quest::givecash(0,0,0,50);
   }
   elsif ($ulevel <= 60 && plugin::check_handin(\%itemcount, 54601 =>4)) { 
   quest::say("perfect! I will hand these over to the Dark Reign. Here is your cut.");
   quest::ding();
   quest::exp(4815250);
   quest::givecash(0,0,0,50);
   }
elsif ($ulevel <= 51 && plugin::check_handin(\%itemcount, 120177 => 1)) { 
   quest::say("The Dark Reign thanks you, these will melt down and make a nice trinket that we can sell.");
   quest::ding();
   quest::exp(2397650);
   quest::givecash(0,0,0,50);
   }
   elsif ($ulevel <= 52 && plugin::check_handin(\%itemcount, 120177 => 1)) { 
   quest::say("The Dark Reign thanks you, these will melt down and make a nice trinket that we can sell.");
   quest::ding();
   quest::exp(2599630);
   quest::givecash(0,0,0,50);
   }
   elsif ($ulevel <= 53 && plugin::check_handin(\%itemcount, 120177 => 1)) { 
   quest::say("The Dark Reign thanks you, these will melt down and make a nice trinket that we can sell.");
   quest::ding();
   quest::exp(2811810);
   quest::givecash(0,0,0,50);
   }
   elsif ($ulevel <= 54 && plugin::check_handin(\%itemcount, 120177 => 1)) { 
   quest::say("The Dark Reign thanks you, these will melt down and make a nice trinket that we can sell.");
   quest::ding();
   quest::exp(4609070);
   quest::givecash(0,0,0,50);
   }
   elsif ($ulevel <= 55 && plugin::check_handin(\%itemcount, 120177 => 1)) { 
   quest::say("The Dark Reign thanks you, these will melt down and make a nice trinket that we can sell.");
   quest::ding();
   quest::exp(3556840);
   quest::givecash(0,0,0,50);
   }
   elsif ($ulevel <= 56 && plugin::check_handin(\%itemcount, 120177 => 1)) { 
   quest::say("The Dark Reign thanks you, these will melt down and make a nice trinket that we can sell.");
   quest::ding();
   quest::exp(3604360);
   quest::givecash(0,0,0,50);
   }
   elsif ($ulevel <= 57 && plugin::check_handin(\%itemcount, 120177 => 1)) { 
   quest::say("The Dark Reign thanks you, these will melt down and make a nice trinket that we can sell.");
   quest::ding();
   quest::exp(3863100);
   quest::givecash(0,0,0,50);
   }
   elsif ($ulevel <= 58 && plugin::check_handin(\%itemcount, 120177 => 1)) { 
   quest::say("The Dark Reign thanks you, these will melt down and make a nice trinket that we can sell.");
   quest::ding();
   quest::exp(4133300);
   quest::givecash(0,0,0,50);
   }
   elsif ($ulevel <= 59 && plugin::check_handin(\%itemcount, 120177 => 1)) { 
   quest::say("The Dark Reign thanks you, these will melt down and make a nice trinket that we can sell.");
   quest::ding();
   quest::exp(6468990);
   quest::givecash(0,0,0,50);
   }
   elsif ($ulevel <= 60 && plugin::check_handin(\%itemcount, 120177 => 1)) { 
   quest::say("The Dark Reign thanks you, these will melt down and make a nice trinket that we can sell.");
   quest::ding();
   quest::exp(4815250);
   quest::givecash(0,0,0,50);
   }
       else {
    plugin::return_items(\%itemcount);
    quest::say("I have no use for this.");
   }
 }