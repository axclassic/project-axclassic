#Pericolo_L'Monte ID 27136#
sub EVENT_SAY {
my $missions = quest::saylink("missions", 1);
my $Clues = quest::saylink("Clues", 1);
my $papers = quest::saylink("papers", 1);
my $see = quest::saylink("see", 1);
my $Drakes = quest::saylink("Drakes", 1);
my $Dragons = quest::saylink("Dragons", 1);
my $Blackwing = quest::saylink("Blackwing", 1);
my $Metal = quest::saylink("Metal", 1);
my $Yes = quest::saylink("Yes", 1);
my $No = quest::saylink("No", 1);
my $Eye = quest::saylink("Eye", 1);
my $Comrades = quest::saylink("Comrades", 1);
my $Web = quest::saylink("Web", 1);
  if ($text=~/Hail/i && $ulevel <= 50 && $ulevel >= 41){
   quest::say("Hail and well met $name. My orders came through and I have a few $missions that you may be able to help me with.");
   }
  if ($text=~/missions/i && $ulevel <= 50 && $ulevel >= 41){
   quest::say("For those brave souls I have $Clues, $Dragons Egg, Lair of the $Blackwing, Scrap $Metal, Spiders $Eye, Lost $Comrades or $Web of Lies.");
   quest::say("I also have some jobs that require a greater force to accomplish, 18 or so. If you think you are up for the challenge you can $see those as well.");
   }
  if ($text=~/Clues/i && $ulevel <= 50 && $ulevel >= 41){
   quest::say("Reports say that the place the dragons call the Nest doesn't look much like a nest.");
   quest::say("We know that adventurers have been in there and they tend to be pretty destructive, but from what we've heard they probably didn't cause the kind of damage that has been reported. Our agents have discovered a secret entrance into the ice lair. Get in there and see if you can find anything useful about what happened. You probably won't find any $papers or lore, dragons live a very long time and pass their traditions down verbally. To be honest, I'm not really sure what we're looking for. Just go look and see what you can find.");
   }
  if ($text=~/papers/i && $ulevel <= 50 && $ulevel >= 41){
   quest::say("If you do find something, return it to Xeib Darkskies.");
   }
  if ($text=~/see/i && $ulevel <= 50 && $ulevel >= 41){
   quest::say("These missions will require you to team up with friends as they are not easy.");
   quest::say("The following events are available to you. Circle of $Drakes.");
    }
  if ($text=~/Drakes/i && $ulevel <= 50 && $ulevel >= 41){
   quest::say("Very well, gather a force if at least 12 and make your way to the center of the nest, there you will find an associate of mine. Tell him you are there to challenge the drakes.");
   }
  if ($text=~/Dragons/i && $ulevel <= 50 && $ulevel >= 41){
   quest::say("We are seeking some truely fearsome mounts to instill fear in our enemies. I believe the dragons here would work quite well, and I have no doubt that we could train one of those beasts if we raised it from birth. We would be unstoppable! You must find an egg and return it to Xeib Darkskies, he will start working on it immediately. Make your way into the very nest of them and bring me one, get going!");
   }
  if ($text=~/Blackwing/i && $ulevel <= 50 && $ulevel >= 41){
   quest::say("Scouts return with reports of a black-wing drakes that hunt our operatives in the Dragon Lands. I need a group of adventurers to journey to the Nest and clean out their lair."); 
   quest::say("Slay these creatures and return with four of their talons as proof your kills. Be warned, our scouts report that these black wing drakes are part of a corrupted brood, a clutch that hatched near the epicenter of the curse that has spread through the Nest. It is whispered that dark magic now corrupts their bodies, making them more volatile and malignant than ordinary drakes. This will not be an easy task.");
   }
  if ($text=~/Metal/i && $ulevel <= 50 && $ulevel >= 41){
   quest::say("These dragons are dangerous foes, of that there is no doubt. We cannot let them sway our stance. We need weapons and armor that will allow us to be victorious in our battles against these creatures. We can craft what we need, you just have to get us the raw material. They say that there are dragons with scales made of metal and that their egg shells are also metallic. Bring me a large amount of their scales and shells and we'll make it worth your while. We've found a way into the lair, or nest, or whatever it is, of these dragons."); 
   quest::say("You need 3 empty inventory slots for this mission. Do you have 3 empty inventory slots for the collection boxes? $Yes or $No.");
   }
  if ($text=~/Yes/i && $ulevel <= 50 && $ulevel >= 41){
   quest::say("Good, you must fill each of these boxes with what they want, combine each of them and return the finished items to me.");
   quest::summonitem(120155);
   quest::summonitem(120157);
   quest::summonitem(120159);
   quest::say("Make your way to the Nest and collect the items. The rest is up to you $name.");
   }
  if ($text=~/No/i && $ulevel <= 50 && $ulevel >= 41){
   quest::say("A good scout travels light perhaps you should pay a visit ta a bank and lighten your load.");
   }
  if ($text=~/Eye/i && $ulevel <= 50 && $ulevel >= 41){
   quest::say("Stories say that when the most ancient spider queens die their bodies turn to dust because of their age. That dust blows away, leaving two stones behind. Some tales say that the brain and heart become the stones; others say it is the soul and the mind. They say that these stones have incredible magic powers when placed together to form what is called the Spider's Eye. Some say that the combined stone will grant eternal life to the one that ingests it if they survive the pain of it. Others say that it turns the imbiber into a powerful half spider creature. One tale describes the planted stone growing into a magical tree; another says it's a nest of spiders that serve their new master. If even one of these stories is true, this Spider's Eye is a powerful item that will add to our own power. Bring these stones to me, undamaged and separated.");
   } 
  if ($text=~/Comrades/i && $ulevel <= 50 && $ulevel >= 41){
   quest::say("Five days ago I sent a group of adventurers into the Nest. Their mission was to explore the ice dragons' lair and recover a lost artifact known as the Orb of Midwinter. Only one adventurer has returned, and he arrived slumped over his horse, almost dead in his saddle. We do not know what has become of the rest of the group, but based upon the survivor's fevered whispers, we believe others may have also survived. Journey into the Nest and see if you can salvage this expedition. Find any survivors and then recover the Orb of Midwinter. The missing adventurers are named Varronghast, Dorsya, Kellendro, and Gorvash.");
   }
   if ($text=~/Web/i && $ulevel <= 50 && $ulevel >= 41){
   quest::say("We have learned that some people are attempting to gain an alliance with the goblins that live in the Nest. It seems that they are unhappy with their draconic masters attempt to use them as fodder against our assaults. The faction of fools that is trying to sway them to turn on their masters is telling them that the assaults are entirely our doing and that the Norrathians invading their lands have been urged to do so by us alone! So far the goblins have only allowed one emissary into their lair unharmed, some halfling woman. I guess she's too small to scare them or she smells like pies or something. Regardless of the reason, I need you to go in their and kill her. Then tell these goblins about the deception played on them by these fools. You just have to be convincing enough that the goblins don't kill you before you can get out. We all know that both sides are exploiting the opportunity for new loot and power, but as least we're honest about it."); 
   quest::say("bring me proof of her demise and you will be rewarded.");
   }
} 
 sub EVENT_ITEM {
  if ($ulevel <= 50 && $ulevel >= 41 && plugin::check_handin(\%itemcount, 86004 => 4)) {
   quest::say("Well done $name!,That should help in keeping our scouts safe.");
   quest::summonitem(71514);
   quest::ding();
   quest::exp(30000000);
   quest::givecash(0,0,0,50);
   }
  elsif ($ulevel <= 50 && $ulevel >= 41 && plugin::check_handin(\%itemcount, 120156 => 1 && 120158 => 1 && 120160 => 1)) {
   quest::say("Well done $name!,This is exactly what we needed.");
   quest::ding();
   quest::exp(30000000);
   quest::givecash(0,0,0,50);
   } 
  elsif ($ulevel <= 50 && $ulevel >= 41 && plugin::check_handin(\%itemcount, 81911 => 1 && 81912 => 1)) {
   quest::say("Well done $name!,These are perfect. Here is your reward.");
   quest::ding();
   quest::exp(30000000);
   quest::givecash(0,0,0,50);
   }
  elsif ($ulevel <= 50 && $ulevel >= 41 && plugin::check_handin(\%itemcount, 86002 => 1)) {
   quest::say("Well done $name!,The Orb of Midwinter! Here is your reward.");
   quest::ding();
   quest::exp(30000000);
   quest::givecash(0,0,0,50);
   }
  elsif ($ulevel <= 50 && $ulevel >= 41 && plugin::check_handin(\%itemcount, 120162 => 1)) {
   quest::say("Well done $name!,Maybe that will persuade the goblins to our side or at least stop them from joining the keepers.");
   quest::ding();
   quest::exp(30000000);
   quest::givecash(0,0,0,50);
   }
   elsif ($ulevel <= 50 && $ulevel >= 41 && plugin::check_handin(\%itemcount, 86005 => 1)) {
   quest::say("So the mysterious egg that Officer Vacax Rol'Tas was talking about eh?, Well it dont look like much to me but a deal is a deal.");
   quest::ding();
   quest::exp(4500000);
   quest::givecash(0,0,0,50);
   }
 }   

