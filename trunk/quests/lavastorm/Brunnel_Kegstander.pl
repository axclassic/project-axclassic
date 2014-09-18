sub EVENT_SAY {
my $Firebrand = quest::saylink("Firebrand", 1);
my $trading = quest::saylink("trading", 1);
   if ($text=~/Hail/i && $ulevel <= 21){
   quest::say("'ello there. I set sail from me home on a quest and I be happy to report I've had me a bit o' success! I found me the secret to making Forged $Firebrand Weapons. It's me own secret though and I ain't tellin'.");
   }
    if ($text=~/Hail/i && $ulevel >= 22){
	quest::say("I am sorry but I have nuttin' that ye would be interested in, ask the others here abouts, they may have something for ye.");
	}
   if ($text=~/Firebrand/i && $ulevel <= 21){
   quest::say("Oh, I'll tell ye about them that's for sure! They have in 'em the very power of fire! I'm a brewer by trade that's for sure but I decided to take up smithin' as me livelihood after I came across the secret. It's me own secret by the way. Think ye'd be willin' to do a bit of $trading with me?"); 
   }
   if ($text=~/trading/i && $ulevel <= 21){
   quest::say("Well that's a might nice of ye! Ye bring me a Fiery Ore, some Imp Blood and an Essence of Fire. I uh. . . I just like collectin' them things, they have nuthin to do with me recipe. Anyway, I'll trade ye fer whatever weapon I have.");
   }
 }
   sub EVENT_ITEM {
  if ($ulevel <= 21 && plugin::check_handin(\%itemcount, 86004 => 4)) {
   quest::say("Well done $name!,That should help in keeping our scouting parties safe.");
   $random = quest::ChooseRandom(7901,7892,7899,7898,7896);
   quest::summonitem($random);
   quest::ding();
   quest::exp(10000);
   quest::givecash(0,0,0,10);
   }
 }