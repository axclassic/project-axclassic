sub EVENT_SAY {
my $missions = quest::saylink("missions", 1);
my $Clues = quest::saylink("Clues", 1);
my $symbol = quest::saylink("symbol", 1);
my $see = quest::saylink("see", 1);
my $Monolith = quest::saylink("Monolith", 1);
my $Drakes = quest::saylink("Drakes", 1);
my $Dragons = quest::saylink("Dragons", 1);
my $Blackwing = quest::saylink("Blackwing", 1);
my $Metal = quest::saylink("Metal", 1);
my $Yes = quest::saylink("Yes", 1);
my $No = quest::saylink("No", 1);
my $Eye = quest::saylink("Eye", 1);
  if ($ulevel <= 40 && $text=~/Hail/i){
   quest::say("I am sorry but I have nothing you could possibly do. Check with the others in the camp as they may have work that someone of your experiance might be able to help the Norrath Keepers with.");
   }
  if ($ulevel <= 50 && $ulevel >= 41 && $text=~/Hail/i){
   quest::say("Hail and well met $name. My orders came through and I have a few $missions that you may be able to help me with.");
   }
  if ($ulevel <= 50 && $ulevel >= 41 && $text=~/missions/i){
   quest::say("For those brave souls I have $Clues, $Dragons Egg, Lair of the $Blackwing, Scrap $Metal, Spiders $Eye");
   quest::say("I also have some jobs that require a greater force to accomplish, 18 or so. If you think you are up for the challenge you can $see those as well.");
   }
  if ($ulevel <= 50 && $ulevel >= 41 && $text=~/Clues/i){
   quest::say("Reports say that the place the dragons call the Nest doesn't look much like a nest.");
   quest::say("We know that adventurers have been in there and they tend to be pretty destructive, but from what we've heard they probably didn't cause the kind of damage that has been reported. Our agents have discovered a secret entrance into the ice lair. Get in there and see if you can find anything useful about what happened. You probably won't find a $symbol, dragons live a very long time and pass their traditions down verbally. To be honest, I'm not really sure what we're looking for. Just go look and see what you can find.");
   quest::say("If you do find something, return it to Tatsujiro the Serene.");
   }
  if ($ulevel <= 50 && $ulevel >= 41 && $text=~/see/i){
   quest::say("These missions will require you to team up with friends as they are not easy.you willneed at least 12 members in your party. more will make it easier.");
   quest::say("The following events are available to you. Circle of $Drakes or The Rampaging $Monolith");
    }
  if ($ulevel <= 50 && $ulevel >= 41 && $text=~/Drakes/i){
   quest::say("Very well, gather a force if at least 12 and make your way to the center of the nest, there you will find an associate of mine. Tell him you are there to challenge the drakes.");
   }
  if ($ulevel <= 50 && $ulevel >= 41 && $text=~/Dragons/i){
   quest::say("With all the destruction that Norrathians are causing in these new lands, some of us are worried about the dragon young. It seems unlikely that many of their eggs will remain safe and we feel guilty about their destruction at the hands of fellow adventurers. Please rescue one dragon egg and bring it to Tatsujiro the Serene . We will nurture it and keep it safe.");
   }
  if ($ulevel <= 50 && $ulevel >= 41 && $text=~/Blackwing/i){
   quest::say("There is a flock of drakes that regularly fly from the Nest to hunt our scouting parties. We need a group of adventurers to journey to their lair and clear out their nests. Slay four of these creatures and return with their talons as proof your kills. Be warned, our scouts report that these black wing drakes are part of a corrupted brood, a clutch that hatched near the epicenter of the curse that has spread through the Nest. It is whispered that dark magic now corrupts their bodies, making them more volatile and malignant than ordinary drakes. This will not be an easy task.");
   }
  if ($ulevel <= 50 && $ulevel >= 41 && $text=~/Metal/i){
   quest::say("We are in a battle for our lives with these dragons. We need the material to build weapons and armors that might give us an advantage. Our surviving scouts tell us that they have seen dragons wear a coat of shimmering scales, possibly some new metal. Our smiths believe that they can make weapons and armor from their scales or perhaps their egg shells. This is a dangerous mission, but we need someone to delve into the nesting grounds for these dragons and gather us materials. We'll need a large volume of scales and egg shells."); 
   quest::say("You need 3 empty inventory slots for this mission. Do you have 3 empty inventory slots for the collection boxes? $Yes or $No.");
   }
  if ($ulevel <= 50 && $ulevel >= 41 && $text=~/Yes/i){
   quest::say("Good, you must fill each of these boxes with what they want, combine each of them and return the finished items to me.");
   quest::summonitem(120155);
   quest::summonitem(120157);
   quest::summonitem(120159);
   quest::say("Make your way to the Nest and collect the items. The rest is up to you $name.");
   }
  if ($ulevel <= 50 && $ulevel >= 41 && $text=~/No/i){
   quest::say("A good scout travels light perhaps you should pay a visit ta a bank and lighten your load.");
   }
  if ($ulevel <= 50 && $ulevel >= 41 && $text=~/Eye/i){
   quest::say("Stories say that when the most ancient spider queens die their bodies turn to dust because of their age. That dust blows away, leaving two stones behind. Some tales say that the brain and heart become the stones; others say that it is the soul and the mind. They say that these stones have incredible magical powers when placed together to form what is called the Spider's Eye. Some say that the combined stone will grant eternal life to one that ingests it if they survive the pain of it. Others say that it turns the imbiber into a powerful half spider creature. One tale describes the planted stone growing into a magical tree; another says it's a nest of spiders that serve their new master. If even one of these stories is true, this Spider's Eye is a powerful item that might mean our salvation. This is important to us, please see if you can find the two stones and return them to us undamaged and separated.");
   } 
  if ($ulevel <= 50 && $ulevel >= 41 && $text=~/Monolith/i){ 
   quest::say("Our scouts have dicovered a beast that lives within the nest. It appears to be a very large stone statue, when you see it you will know. Destroy this beast and bring me proof of its demise.");  
 }
 if ($ulevel >= 51 && $text=~/Hail/i){
   quest::say("I am sorry but everything I have would be a waist of your talents. Check with the others in the camp as they may have work that someone of your experiance might be able to help the Norrath Keepers with.");
   }
} 
sub EVENT_ITEM {
if ($ulevel == 41 && plugin::check_handin(\%itemcount, 86004 => 4)) {
   quest::say("Well done $name!,That should help in keeping our scouting parties safe.");
   quest::summonitem(71514);
   quest::ding();
   quest::exp(639370);
   quest::givecash(0,0,0,50);
   }
   elsif ($ulevel == 42 && plugin::check_handin(\%itemcount, 86004 => 4)) {
   quest::say("Well done $name!,That should help in keeping our scouting parties safe.");
   quest::summonitem(71514);
   quest::ding();
   quest::exp(671710);
   quest::givecash(0,0,0,50);
   }
   elsif ($ulevel == 43 && plugin::check_handin(\%itemcount, 86004 => 4)) {
   quest::say("Well done $name!,That should help in keeping our scouting parties safe.");
   quest::summonitem(71514);
   quest::ding();
   quest::exp(704470);
   quest::givecash(0,0,0,50);
   }
   elsif ($ulevel == 44 && plugin::check_handin(\%itemcount, 86004 => 4)) {
   quest::say("Well done $name!,That should help in keeping our scouting parties safe.");
   quest::summonitem(71514);
   quest::ding();
   quest::exp(738010);
   quest::givecash(0,0,0,50);
   }
   elsif ($ulevel == 45 && plugin::check_handin(\%itemcount, 86004 => 4)) {
   quest::say("Well done $name!,That should help in keeping our scouting parties safe.");
   quest::summonitem(71514);
   quest::ding();
   quest::exp(1629580);
   quest::givecash(0,0,0,50);
   }
   elsif ($ulevel == 46 && plugin::check_handin(\%itemcount, 86004 => 4)) {
   quest::say("Well done $name!,That should help in keeping our scouting parties safe.");
   quest::summonitem(71514);
   quest::ding();
   quest::exp(869540);
   quest::givecash(0,0,0,50);
   }
   elsif ($ulevel == 47 && plugin::check_handin(\%itemcount, 86004 => 4)) {
   quest::say("Well done $name!,That should help in keeping our scouting parties safe.");
   quest::summonitem(71514);
   quest::ding();
   quest::exp(908180);
   quest::givecash(0,0,0,50);
   }
   elsif ($ulevel == 48 && plugin::check_handin(\%itemcount, 86004 => 4)) {
   quest::say("Well done $name!,That should help in keeping our scouting parties safe.");
   quest::summonitem(71514);
   quest::ding();
   quest::exp(947660);
   quest::givecash(0,0,0,50);
   }
   elsif ($ulevel == 49 && plugin::check_handin(\%itemcount, 86004 => 4)) {
   quest::say("Well done $name!,That should help in keeping our scouting parties safe.");
   quest::summonitem(71514);
   quest::ding();
   quest::exp(987980);
   quest::givecash(0,0,0,50);
   }
   elsif ($ulevel == 50 && plugin::check_handin(\%itemcount, 86004 => 4)) {
   quest::say("Well done $name!,That should help in keeping our scouting parties safe.");
   quest::summonitem(71514);
   quest::ding();
   quest::exp(1029140);
   quest::givecash(0,0,0,50);
   }
elsif ($ulevel == 41 && plugin::check_handin(\%itemcount, 120156 => 1 && 120158 => 1 && 120160 => 1)) {
   quest::say("Well done $name!,This is exactly what we needed.");
   quest::ding();
   quest::exp(639370);
   quest::givecash(0,0,0,50);
   } 
   elsif ($ulevel == 42 && plugin::check_handin(\%itemcount, 120156 => 1 && 120158 => 1 && 120160 => 1)) {
   quest::say("Well done $name!,This is exactly what we needed.");
   quest::ding();
   quest::exp(671710);
   quest::givecash(0,0,0,50);
   } 
   elsif ($ulevel == 43 && plugin::check_handin(\%itemcount, 120156 => 1 && 120158 => 1 && 120160 => 1)) {
   quest::say("Well done $name!,This is exactly what we needed.");
   quest::ding();
   quest::exp(704470);
   quest::givecash(0,0,0,50);
   } 
   elsif ($ulevel == 44 && plugin::check_handin(\%itemcount, 120156 => 1 && 120158 => 1 && 120160 => 1)) {
   quest::say("Well done $name!,This is exactly what we needed.");
   quest::ding();
   quest::exp(738010);
   quest::givecash(0,0,0,50);
   } 
   elsif ($ulevel == 45 && plugin::check_handin(\%itemcount, 120156 => 1 && 120158 => 1 && 120160 => 1)) {
   quest::say("Well done $name!,This is exactly what we needed.");
   quest::ding();
   quest::exp(1629580);
   quest::givecash(0,0,0,50);
   } 
   elsif ($ulevel == 46 && plugin::check_handin(\%itemcount, 120156 => 1 && 120158 => 1 && 120160 => 1)) {
   quest::say("Well done $name!,This is exactly what we needed.");
   quest::ding();
   quest::exp(869540);
   quest::givecash(0,0,0,50);
   } 
   elsif ($ulevel == 47 && plugin::check_handin(\%itemcount, 120156 => 1 && 120158 => 1 && 120160 => 1)) {
   quest::say("Well done $name!,This is exactly what we needed.");
   quest::ding();
   quest::exp(908180);
   quest::givecash(0,0,0,50);
   } 
   elsif ($ulevel == 48 && plugin::check_handin(\%itemcount, 120156 => 1 && 120158 => 1 && 120160 => 1)) {
   quest::say("Well done $name!,This is exactly what we needed.");
   quest::ding();
   quest::exp(947660);
   quest::givecash(0,0,0,50);
   } 
   elsif ($ulevel == 49 && plugin::check_handin(\%itemcount, 120156 => 1 && 120158 => 1 && 120160 => 1)) {
   quest::say("Well done $name!,This is exactly what we needed.");
   quest::ding();
   quest::exp(987980);
   quest::givecash(0,0,0,50);
   } 
   elsif ($ulevel == 50 && plugin::check_handin(\%itemcount, 120156 => 1 && 120158 => 1 && 120160 => 1)) {
   quest::say("Well done $name!,This is exactly what we needed.");
   quest::ding();
   quest::exp(1029140);
   quest::givecash(0,0,0,50);
   } 
elsif ($ulevel == 41 && plugin::check_handin(\%itemcount, 81911 => 1 && 81912 => 1)) {
   quest::say("Well done $name!,These are perfect. Here is your reward.");
   quest::ding();
   quest::exp(639370);
   quest::givecash(0,0,0,50);
   }
   elsif ($ulevel == 42 && plugin::check_handin(\%itemcount, 81911 => 1 && 81912 => 1)) {
   quest::say("Well done $name!,These are perfect. Here is your reward.");
   quest::ding();
   quest::exp(671710);
   quest::givecash(0,0,0,50);
   }
   elsif ($ulevel == 43 && plugin::check_handin(\%itemcount, 81911 => 1 && 81912 => 1)) {
   quest::say("Well done $name!,These are perfect. Here is your reward.");
   quest::ding();
   quest::exp(704470);
   quest::givecash(0,0,0,50);
   }
   elsif ($ulevel == 44 && plugin::check_handin(\%itemcount, 81911 => 1 && 81912 => 1)) {
   quest::say("Well done $name!,These are perfect. Here is your reward.");
   quest::ding();
   quest::exp(738010);
   quest::givecash(0,0,0,50);
   }
   elsif ($ulevel == 45 && plugin::check_handin(\%itemcount, 81911 => 1 && 81912 => 1)) {
   quest::say("Well done $name!,These are perfect. Here is your reward.");
   quest::ding();
   quest::exp(1629580);
   quest::givecash(0,0,0,50);
   }
   elsif ($ulevel == 46 && plugin::check_handin(\%itemcount, 81911 => 1 && 81912 => 1)) {
   quest::say("Well done $name!,These are perfect. Here is your reward.");
   quest::ding();
   quest::exp(869540);
   quest::givecash(0,0,0,50);
   }
   elsif ($ulevel == 47 && plugin::check_handin(\%itemcount, 81911 => 1 && 81912 => 1)) {
   quest::say("Well done $name!,These are perfect. Here is your reward.");
   quest::ding();
   quest::exp(908180);
   quest::givecash(0,0,0,50);
   }
   elsif ($ulevel == 48 && plugin::check_handin(\%itemcount, 81911 => 1 && 81912 => 1)) {
   quest::say("Well done $name!,These are perfect. Here is your reward.");
   quest::ding();
   quest::exp(947660);
   quest::givecash(0,0,0,50);
   }
   elsif ($ulevel == 49 && plugin::check_handin(\%itemcount, 81911 => 1 && 81912 => 1)) {
   quest::say("Well done $name!,These are perfect. Here is your reward.");
   quest::ding();
   quest::exp(987980);
   quest::givecash(0,0,0,50);
   }
   elsif ($ulevel == 50 && plugin::check_handin(\%itemcount, 81911 => 1 && 81912 => 1)) {
   quest::say("Well done $name!,These are perfect. Here is your reward.");
   quest::ding();
   quest::exp(1029140);
   quest::givecash(0,0,0,50);
   }
elsif ($ulevel == 41 && plugin::check_handin(\%itemcount, 120161 => 1)) {
   quest::say("Well done $name!. At last our scouting parties can get back to exploring the nest.");
   quest::ding();
   quest::exp(639370);
   quest::givecash(0,0,0,50);
   }
   elsif ($ulevel == 42 && plugin::check_handin(\%itemcount, 120161 => 1)) {
   quest::say("Well done $name!. At last our scouting parties can get back to exploring the nest.");
   quest::ding();
   quest::exp(671710);
   quest::givecash(0,0,0,50);
   }
   elsif ($ulevel == 43 && plugin::check_handin(\%itemcount, 120161 => 1)) {
   quest::say("Well done $name!. At last our scouting parties can get back to exploring the nest.");
   quest::ding();
   quest::exp(704470);
   quest::givecash(0,0,0,50);
   }
   elsif ($ulevel == 44 && plugin::check_handin(\%itemcount, 120161 => 1)) {
   quest::say("Well done $name!. At last our scouting parties can get back to exploring the nest.");
   quest::ding();
   quest::exp(738010);
   quest::givecash(0,0,0,50);
   }
   elsif ($ulevel == 45 && plugin::check_handin(\%itemcount, 120161 => 1)) {
   quest::say("Well done $name!. At last our scouting parties can get back to exploring the nest.");
   quest::ding();
   quest::exp(1629580);
   quest::givecash(0,0,0,50);
   }
   elsif ($ulevel == 46 && plugin::check_handin(\%itemcount, 120161 => 1)) {
   quest::say("Well done $name!. At last our scouting parties can get back to exploring the nest.");
   quest::ding();
   quest::exp(869540);
   quest::givecash(0,0,0,50);
   }
   elsif ($ulevel == 47 && plugin::check_handin(\%itemcount, 120161 => 1)) {
   quest::say("Well done $name!. At last our scouting parties can get back to exploring the nest.");
   quest::ding();
   quest::exp(908180);
   quest::givecash(0,0,0,50);
   }
   elsif ($ulevel == 48 && plugin::check_handin(\%itemcount, 120161 => 1)) {
   quest::say("Well done $name!. At last our scouting parties can get back to exploring the nest.");
   quest::ding();
   quest::exp(947660);
   quest::givecash(0,0,0,50);
   }
   elsif ($ulevel == 49 && plugin::check_handin(\%itemcount, 120161 => 1)) {
   quest::say("Well done $name!. At last our scouting parties can get back to exploring the nest.");
   quest::ding();
   quest::exp(987980);
   quest::givecash(0,0,0,50);
   }
   elsif ($ulevel == 50 && plugin::check_handin(\%itemcount, 120161 => 1)) {
   quest::say("Well done $name!. At last our scouting parties can get back to exploring the nest.");
   quest::ding();
   quest::exp(1029140);
   quest::givecash(0,0,0,50);
   }
elsif ($ulevel == 41 && plugin::check_handin(\%itemcount, 81914 => 1)) {
   quest::say("Ah, a symbol, it looks to be very old and damaged but I will give it to our scholers and see  if they can make anything out of it. Thank you $name.");
   quest::ding();
   quest::exp(639370);
   quest::givecash(0,0,0,50);
   }
   elsif ($ulevel == 42 && plugin::check_handin(\%itemcount, 81914 => 1)) {
   quest::say("Ah, a symbol, it looks to be very old and damaged but I will give it to our scholers and see  if they can make anything out of it. Thank you $name.");
   quest::ding();
   quest::exp(671710);
   quest::givecash(0,0,0,50);
   }
   elsif ($ulevel == 43 && plugin::check_handin(\%itemcount, 81914 => 1)) {
   quest::say("Ah, a symbol, it looks to be very old and damaged but I will give it to our scholers and see  if they can make anything out of it. Thank you $name.");
   quest::ding();
   quest::exp(704470);
   quest::givecash(0,0,0,50);
   }
   elsif ($ulevel == 44 && plugin::check_handin(\%itemcount, 81914 => 1)) {
   quest::say("Ah, a symbol, it looks to be very old and damaged but I will give it to our scholers and see  if they can make anything out of it. Thank you $name.");
   quest::ding();
   quest::exp(738010);
   quest::givecash(0,0,0,50);
   }
   elsif ($ulevel == 45 && plugin::check_handin(\%itemcount, 81914 => 1)) {
   quest::say("Ah, a symbol, it looks to be very old and damaged but I will give it to our scholers and see  if they can make anything out of it. Thank you $name.");
   quest::ding();
   quest::exp(1629580);
   quest::givecash(0,0,0,50);
   }
   elsif ($ulevel == 46 && plugin::check_handin(\%itemcount, 81914 => 1)) {
   quest::say("Ah, a symbol, it looks to be very old and damaged but I will give it to our scholers and see  if they can make anything out of it. Thank you $name.");
   quest::ding();
   quest::exp(869840);
   quest::givecash(0,0,0,50);
   }
   elsif ($ulevel == 47 && plugin::check_handin(\%itemcount, 81914 => 1)) {
   quest::say("Ah, a symbol, it looks to be very old and damaged but I will give it to our scholers and see  if they can make anything out of it. Thank you $name.");
   quest::ding();
   quest::exp(908180);
   quest::givecash(0,0,0,50);
   }
   elsif ($ulevel == 48 && plugin::check_handin(\%itemcount, 81914 => 1)) {
   quest::say("Ah, a symbol, it looks to be very old and damaged but I will give it to our scholers and see  if they can make anything out of it. Thank you $name.");
   quest::ding();
   quest::exp(947660);
   quest::givecash(0,0,0,50);
   }
   elsif ($ulevel == 49 && plugin::check_handin(\%itemcount, 81914 => 1)) {
   quest::say("Ah, a symbol, it looks to be very old and damaged but I will give it to our scholers and see  if they can make anything out of it. Thank you $name.");
   quest::ding();
   quest::exp(987980);
   quest::givecash(0,0,0,50);
   }
   elsif ($ulevel == 50 && plugin::check_handin(\%itemcount, 81914 => 1)) {
   quest::say("Ah, a symbol, it looks to be very old and damaged but I will give it to our scholers and see  if they can make anything out of it. Thank you $name.");
   quest::ding();
   quest::exp(1029140);
   quest::givecash(0,0,0,50);
   }
   
        else {
    plugin::return_items(\%itemcount);
    quest::say("I have no use for this.");
   }
 }        
