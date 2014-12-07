sub EVENT_SAY {
my $work = quest::saylink("work", 1);
  if ($ulevel <= 20 && $text=~/Hail/i){
  quest::say("Good Day to you traveler, I am sorry but I have nothing available for someone of your experiance, check with the others as they may have something that you can do.");
   }
  if ($ulevel <= 30 && $ulevel >= 21 && $text=~/Hail/i){
   quest::say("Hmm, you seem the sort that might benefit from an association with Norrath's Keepers. It can't be all bad being on the side of Firiona Vie. I don't care much myself, they just pay me for my $work -- not all of it is noble.");
   }
  if ($ulevel <= 30 && $ulevel >= 21 && $text=~/work/i){
   quest::say("The spiders of the Lavaspinner's Lair create a silk that the Norrath's Keepers seek! I don't know why, and I'm not sure I care, but we must gain favor with that goodly camp, as well as some money . . . for me."); 
   quest::say("Go to Lavaspinners Lair and collect 4 Lavasinner's Silk, I shall split the profits with you.");
   }
  if ($ulevel <= 50 && $ulevel >= 31 && $text=~/Hail/i){
  quest::say("Good Day to you traveler, I am sorry but I have nothing available for someone of your experiance, check with the others as they may have something that you can do.");
	 }
  if ($ulevel >= 51 && $ulevel <= 60 && $text=~/work/i){
  quest::say("Sadly, the creatures of the Stillmoon Temple have overrun the area. Perhaps it was always so, but it's making it dangerous even for rogues to pass through. Norrath's Keepers has been looking for aid, so now this task falls to you.");
  quest::say("take this and fill it with drake-spikes, combine them and return it to me as proof, I am sure the keepers will reward us handsomely for this."); 
  quest::summonitem(17039);
  }
  if ($ulevel >= 61 && $text=~/Hail/i){
   quest::say("Good Day to you traveler, I am sorry but I have nothing available for someone of your experiance, check with the others as they may have something that you can do.");
   }
  }
  sub EVENT_ITEM {
if ($ulevel == 21 && plugin::check_handin(\%itemcount, 54602 => 4)) {
  quest::say("Nice work $name. Here is your cut.");
  quest::ding();
  quest::exp(126100);
  quest::givecash(0,0,0,30);
  }
  elsif ($ulevel == 22 && plugin::check_handin(\%itemcount, 54602 => 4)) {
  quest::say("Nice work $name. Here is your cut.");
  quest::ding();
  quest::exp(138700);
  quest::givecash(0,0,0,30);
  }
  elsif ($ulevel == 23 && plugin::check_handin(\%itemcount, 54602 => 4)) {
  quest::say("Nice work $name. Here is your cut.");
  quest::ding();
  quest::exp(151900);
  quest::givecash(0,0,0,30);
  }
  elsif ($ulevel == 24 && plugin::check_handin(\%itemcount, 54602 => 4)) {
  quest::say("Nice work $name. Here is your cut.");
  quest::ding();
  quest::exp(165700);
  quest::givecash(0,0,0,30);
  }
  elsif ($ulevel == 25 && plugin::check_handin(\%itemcount, 54602 => 4)) {
  quest::say("Nice work $name. Here is your cut.");
  quest::ding();
  quest::exp(180100);
  quest::givecash(0,0,0,30);
  }
  elsif ($ulevel == 26 && plugin::check_handin(\%itemcount, 54602 => 4)) {
  quest::say("Nice work $name. Here is your cut.");
  quest::ding();
  quest::exp(195100);
  quest::givecash(0,0,0,30);
  }
  elsif ($ulevel == 27 && plugin::check_handin(\%itemcount, 54602 => 4)) {
  quest::say("Nice work $name. Here is your cut.");
  quest::ding();
  quest::exp(210700);
  quest::givecash(0,0,0,30);
  }
  elsif ($ulevel == 28 && plugin::check_handin(\%itemcount, 54602 => 4)) {
  quest::say("Nice work $name. Here is your cut.");
  quest::ding();
  quest::exp(226900);
  quest::givecash(0,0,0,30);
  }
  elsif ($ulevel == 29 && plugin::check_handin(\%itemcount, 54602 => 4)) {
  quest::say("Nice work $name. Here is your cut.");
  quest::ding();
  quest::exp(243700);
  quest::givecash(0,0,0,30);
  }
  elsif ($ulevel == 30 && plugin::check_handin(\%itemcount, 54602 => 4)) {
  quest::say("Nice work $name. Here is your cut.");
  quest::ding();
  quest::exp(531100);
  quest::givecash(0,0,0,30);
  }
elsif ($ulevel == 51 && plugin::check_handin(\%itemcount, 120166 => 1)) {
  quest::say("Nice work $name. Here is your cut.");
  quest::ding();
  quest::exp(2397650);
  quest::givecash(0,0,0,50);
  }
  elsif ($ulevel == 52 && plugin::check_handin(\%itemcount, 120166 => 1)) {
  quest::say("Nice work $name. Here is your cut.");
  quest::ding();
  quest::exp(2599630);
  quest::givecash(0,0,0,50);
  }
  elsif ($ulevel == 53 && plugin::check_handin(\%itemcount, 120166 => 1)) {
  quest::say("Nice work $name. Here is your cut.");
  quest::ding();
  quest::exp(2811810);
  quest::givecash(0,0,0,50);
  }
  elsif ($ulevel == 54 && plugin::check_handin(\%itemcount, 120166 => 1)) {
  quest::say("Nice work $name. Here is your cut.");
  quest::ding();
  quest::exp(4609070);
  quest::givecash(0,0,0,50);
  }
  elsif ($ulevel == 55 && plugin::check_handin(\%itemcount, 120166 => 1)) {
  quest::say("Nice work $name. Here is your cut.");
  quest::ding();
  quest::exp(3556840);
  quest::givecash(0,0,0,50);
  }
  elsif ($ulevel == 56 && plugin::check_handin(\%itemcount, 120166 => 1)) {
  quest::say("Nice work $name. Here is your cut.");
  quest::ding();
  quest::exp(3604360);
  quest::givecash(0,0,0,50);
  }
  elsif ($ulevel == 57 && plugin::check_handin(\%itemcount, 120166 => 1)) {
  quest::say("Nice work $name. Here is your cut.");
  quest::ding();
  quest::exp(3863100);
  quest::givecash(0,0,0,50);
  }
  elsif ($ulevel == 58 && plugin::check_handin(\%itemcount, 120166 => 1)) {
  quest::say("Nice work $name. Here is your cut.");
  quest::ding();
  quest::exp(4133300);
  quest::givecash(0,0,0,50);
  }
  elsif ($ulevel == 59 && plugin::check_handin(\%itemcount, 120166 => 1)) {
  quest::say("Nice work $name. Here is your cut.");
  quest::ding();
  quest::exp(6468990);
  quest::givecash(0,0,0,50);
  }
  elsif ($ulevel == 60 && plugin::check_handin(\%itemcount, 120166 => 1)) {
  quest::say("Nice work $name. Here is your cut.");
  quest::ding();
  quest::exp(4815250);
  quest::givecash(0,0,0,50);
  }
          else {
    plugin::return_items(\%itemcount);
    quest::say("I have no use for this.");
   }
  }
  