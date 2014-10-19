#Officer Vacax Rol'Tas#
sub EVENT_SAY {
my $Drake = quest::saylink("Drake", 1);
my $Scroll = quest::saylink("Scroll", 1);
   if ($ulevel <= 30 $text=~/Hail/i){
  quest::say("Good Day to you traveler, I am sorry but I have nothing available for someone of your experiance, check with the others as they may have something that you can do.");
   }
   if ($ulevel <= 40 && $ulevel >= 31 && $text=~/Hail/i){
   quest::say("Hm. I'm surprised to see you here. I won't say I'm pleased, but perhaps you may prove useful as I see you have survived other simple tasks thus far. Some believe the goblins in Tirranum's Delve plan to take up arms against us. You must go thwart their efforts. Should you fail, don't dare show your face here again.");
   quest::say("Bring me the Letter from Tirranun as proof of thier intentions and I shall reward your worthless soul."); 
   }
   if ($ulevel <= 50 && $ulevel >= 41 && $text=~/Hail/i){
   quest::say("A party of filthy Norrath's Keepers have found a way into the Nest. We're not sure what they are after, but it must be important for them to undertake such a risky quest. They've had a few hours head start on you, so you'll need to move quickly. Follow their tracks, catch up to them, and kill them. If they have found what they seek, bring it to Pericolo L`Morte. If not, keep moving and find one. If you're unable to uncover the treasure, then I'll find someone else to do the job once you fail.");
   #need Norrath Keepers named Corgoth of Norrath`s Keepers, Drogorus of Norrath`s Keepers, Syllan of Norrath`s Keepers, Vincent of Norrath`s Keepers#
   #Place  item 86005 make sure surrounding mobs can drop some to as you need 1 egg#
   }
   if ($ulevel >= 60 && $text=~/Hail/i){
   quest::say("These are indeed good days for the will of hate and fear. We will overcome the races of light and prevail. Pledge allegiance to Lanys T`Vyl!");
   quest::say("Have you come to aid our cause? I have 2 missions that surely you can handle, $Drake eggs and The Guilded $Scroll.");
   }
   if ($ulevel >= 60 && $text=~/Drake/i){
   quest::say("We believe that eggs from the drakes in The Ascent could be some use in making powerful new potions. Go to The Ascent and collect one of these eggs for study. Once you have it, we will send you to an agent to collect it from you.");
   #Add a_drake to stillmoonb with loot of item 49022# 
   }
    if ($ulevel >= 60 && $text=~/Scroll/i){
   quest::say("The Storm Dragon, Yar'Lir, has caused one of her minions to create a scroll that can tear up the land and toss it into the air. I want that scroll. Find it and bring it back. I also want you to kill the creature that made the scroll. No, not Yar'Lir. . . the minion. I want to be the only one with such power. All you need to do now is return the scroll.");
   }
   if ($ulevel <= 40 && $ulevel >= 31 && $text=~/aid/i){
   quest::say("");
   }
   }
   sub EVENT_ITEM {
   if ($ulevel >= 60 && plugin::check_handin(\%itemcount, 81885 => 1)) {
   quest::say("Wonderful! I can't wait to see what this thing can do! Well done. We won't forget your help here."); 
   quest::ding();
   quest::exp(10000000);
   quest::givecash(0,0,0,75);
   }
   elsif ($ulevel <= 50 && $ulevel >= 41 && plugin::check_handin(\%itemcount, 48139 => 1)) {
   quest::say("The goblins were no match for you, but Dark Reign likely has more dangerous tasks in mind for you.");
   quest::ding();
   quest::exp(45000000);
   quest::givecash(0,0,0,39);
   }
   }

