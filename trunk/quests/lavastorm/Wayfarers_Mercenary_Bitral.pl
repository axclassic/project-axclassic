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
  if ($ulevel <= 30 && $ulevel >= 21 && $text=~/Hail/i){
  quest::say("Good Day to you traveler, I am sorry but I have nothing available for someone of your experiance, check with the others as they may have something that you can do.");
	 }
  if ($ulevel >= 41 && $text=~/work/i){
  quest::say("Sadly, the creatures of the Stillmoon Temple have overrun the area. Perhaps it was always so, but it's making it dangerous even for rogues to pass through. Norrath's Keepers has been looking for aid, so now this task falls to you.");
  quest::say("take this and fill it with drake-spikes, combine them and return it to me as proof, I am sure the keepers will reward us handsomely for this."); 
  quest::summonitem(17039);
  }
  if ($ulevel <= 40 && $text=~/Hail/i){
   quest::say("Good Day to you traveler, I am sorry but I have nothing available for someone of your experiance, check with the others as they may have something that you can do.");
   }
  }
  sub EVENT_ITEM {
  if ($ulevel <= 30 && $ulevel >= 21 && plugin::check_handin(\%itemcount, 54602 => 4)) {
  quest::say("Nice work $name. Here is your cut.");
  quest::ding();
  quest::exp(1000000);
  quest::givecash(0,0,0,30);
  }
  elsif ($ulevel >= 41 && plugin::check_handin(\%itemcount, 120166 => 1)) {
  quest::say("Nice work $name. Here is your cut.");
  quest::ding();
  quest::exp(20000000);
  quest::givecash(0,0,0,50);
  }
          else {
    plugin::return_items(\%itemcount);
    quest::say("I have no use for this.");
   }
  }
  