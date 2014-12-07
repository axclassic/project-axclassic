sub EVENT_SPAWN {
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
	}
sub EVENT_ENTER {
    if($ulevel >= 15 && $ulevel <= 25) {
    quest::say("Hey young traveler, wonder if ye be interested in some work?");
 }
 }
sub EVENT_SAY {
my $Firebrand = quest::saylink("Firebrand", 1);
my $trading = quest::saylink("trading", 1);
   if ($ulevel >= 15 && $ulevel <= 25 && $text=~/Hail/i){
   quest::say("'ello there. I set sail from me home on a quest and I be happy to report I've had me a bit o' success! I found me the secret to making Forged $Firebrand Weapons. It's me own secret though and I ain't tellin'.");
   }
    if ($ulevel >= 26 && $text=~/Hail/i){
	quest::say("I am sorry but I have nuttin' that ye would be interested in, ask the others here abouts, they may have something for ye.");
	}
   if ($ulevel >= 15 && $ulevel <= 25 && $text=~/Firebrand/i){
   quest::say("Oh, I'll tell ye about them that's for sure! They have in 'em the very power of fire! I'm a brewer by trade that's for sure but I decided to take up smithin' as me livelihood after I came across the secret. It's me own secret by the way. Think ye'd be willin' to do a bit of $trading with me?"); 
   }
   if ($ulevel >= 15 && $ulevel <= 25 && $text=~/trading/i){
   quest::say("Well that's a might nice of ye! Ye bring me a Fiery Ore, some Imp Blood and an Essence of Fire. I uh. . . I just like collectin' them things, they have nuthin to do with me recipe. Anyway, I'll trade ye fer whatever weapon I have.");
   }
 }
   sub EVENT_ITEM {
  if ($ulevel == 15 && plugin::check_handin(\%itemcount, 7882 => 1, 7885 => 1, 7886 => 1)) {
   quest::say("Well done $name!,That should help in keeping our scouting parties safe.");
   $random = quest::ChooseRandom(7901,7892,7899,7898,7896);
   quest::summonitem($random);
   quest::ding();
   quest::exp(105166);
   quest::givecash(0,0,0,10);
   }
   if ($ulevel == 16 && plugin::check_handin(\%itemcount, 7882 => 1, 7885 => 1, 7886 => 1)) {
   quest::say("Well done $name!,That should help in keeping our scouting parties safe.");
   $random = quest::ChooseRandom(7901,7892,7899,7898,7896);
   quest::summonitem($random);
   quest::ding();
   quest::exp(120166);
   quest::givecash(0,0,0,10);
   }
   if ($ulevel == 17 && plugin::check_handin(\%itemcount, 7882 => 1, 7885 => 1, 7886 => 1)) {
   quest::say("Well done $name!,That should help in keeping our scouting parties safe.");
   $random = quest::ChooseRandom(7901,7892,7899,7898,7896);
   quest::summonitem($random);
   quest::ding();
   quest::exp(136166);
   quest::givecash(0,0,0,10);
   }
   if ($ulevel == 18 && plugin::check_handin(\%itemcount, 7882 => 1, 7885 => 1, 7886 => 1)) {
   quest::say("Well done $name!,That should help in keeping our scouting parties safe.");
   $random = quest::ChooseRandom(7901,7892,7899,7898,7896);
   quest::summonitem($random);
   quest::ding();
   quest::exp(153166);
   quest::givecash(0,0,0,10);
   }
   if ($ulevel == 19 && plugin::check_handin(\%itemcount, 7882 => 1, 7885 => 1, 7886 => 1)) {
   quest::say("Well done $name!,That should help in keeping our scouting parties safe.");
   $random = quest::ChooseRandom(7901,7892,7899,7898,7896);
   quest::summonitem($random);
   quest::ding();
   quest::exp(171166);
   quest::givecash(0,0,0,10);
   }
   if ($ulevel == 20 && plugin::check_handin(\%itemcount, 7882 => 1, 7885 => 1, 7886 => 1)) {
   quest::say("Well done $name!,That should help in keeping our scouting parties safe.");
   $random = quest::ChooseRandom(7901,7892,7899,7898,7896);
   quest::summonitem($random);
   quest::ding();
   quest::exp(190166);
   quest::givecash(0,0,0,10);
   }
   if ($ulevel == 21 && plugin::check_handin(\%itemcount, 7882 => 1, 7885 => 1, 7886 => 1)) {
   quest::say("Well done $name!,That should help in keeping our scouting parties safe.");
   $random = quest::ChooseRandom(7901,7892,7899,7898,7896);
   quest::summonitem($random);
   quest::ding();
   quest::exp(210166);
   quest::givecash(0,0,0,10);
   }
   if ($ulevel == 22 && plugin::check_handin(\%itemcount, 7882 => 1, 7885 => 1, 7886 => 1)) {
   quest::say("Well done $name!,That should help in keeping our scouting parties safe.");
   $random = quest::ChooseRandom(7901,7892,7899,7898,7896);
   quest::summonitem($random);
   quest::ding();
   quest::exp(229666);
   quest::givecash(0,0,0,10);
   }
   if ($ulevel == 23 && plugin::check_handin(\%itemcount, 7882 => 1, 7885 => 1, 7886 => 1)) {
   quest::say("Well done $name!,That should help in keeping our scouting parties safe.");
   $random = quest::ChooseRandom(7901,7892,7899,7898,7896);
   quest::summonitem($random);
   quest::ding();
   quest::exp(253166);
   quest::givecash(0,0,0,10);
   }
   if ($ulevel == 24 && plugin::check_handin(\%itemcount, 7882 => 1, 7885 => 1, 7886 => 1)) {
   quest::say("Well done $name!,That should help in keeping our scouting parties safe.");
   $random = quest::ChooseRandom(7901,7892,7899,7898,7896);
   quest::summonitem($random);
   quest::ding();
   quest::exp(276166);
   quest::givecash(0,0,0,10);
   }
   if ($ulevel == 25 && plugin::check_handin(\%itemcount, 7882 => 1, 7885 => 1, 7886 => 1)) {
   quest::say("Well done $name!,That should help in keeping our scouting parties safe.");
   $random = quest::ChooseRandom(7901,7892,7899,7898,7896);
   quest::summonitem($random);
   quest::ding();
   quest::exp(300166);
   quest::givecash(0,0,0,10);
   }
           else {
    plugin::return_items(\%itemcount);
    quest::say("I have no use for this.");
   }
 }