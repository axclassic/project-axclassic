sub EVENT_SAY {
my $rumors = quest::saylink("rumors", 1);
my $Perch = quest::saylink("Perch", 1);
my $Reflections = quest::saylink("Reflections", 1);
my $Storms = quest::saylink("Storms", 1);
  if ($text=~/Hail/i){
   quest::say("Welcome traveler, Have you heard the news? New areas of exploration have been found. Already there are many reports that there is trouble.");
   quest::say("I am looking for adventurers that are willing to face the unknown and see if these $rumors are true.");
   }
   if ($ulevel <= 30 && $text=~/rumors/i){
   quest::say("I am sorry but I have nothing you could possibly do. Check with the others in the camp as they may have work that someone of your experiance might be able to help the Norrath Keepers with.");
   }
   if ($ulevel <= 40 && $ulevel >= 31 && $text=~/rumors/i){
   quest::say("Tirranun has proven himself to be a deadly adversary. He shows no discretion, remorse, or reason for the wholesale slaughter for which he is responsible. Many innocents that crossed his path here in Lavastorm lie dead because of his irrational rage. Take a force into the Delve and smother his flames once and for all. The beast must not be allowed to wreak havoc on our people any longer.");
   }
   if ($ulevel <= 50 && $ulevel >= 41 && $text=~/rumors/i){
   quest::say("You must travel into the Nest and learn as much as you can about the corruption of the place. There are a number of drakes in the caverns of the Nest that have been twisted somehow. We want you to look for a drake that has been rumored to be altered so significantly that it has unique magic. Go learn more about it and kill it if you can.");
   quest::say("Bring to me a Shadowscale as proof.");
   }
   if ($ulevel <= 60 && $ulevel >= 51 && $text=~/Hail/i){
   quest::say("I am sorry but I have nothing you could possibly do. Check with the others in the camp as they may have work that someone of your experiance might be able to help the Norrath Keepers with.");
   }
   if ($ulevel >= 61 && $text=~/rumors/i){
   quest::say("Someone of your vast experiance is just what I need. I have three missions that you could help The keepers of Norrath with.");
   quest::say("Kessdona's $Perch, $Reflections of Silver and An End to the $Storms. Which would you like to attempt?")
   }
   if ($ulevel >= 61 && $text=~/Perch/i){
   quest::say("Perhaps we can appeal to Kessdona to cease the unnecessary violence and bloodshed. She could be the key to stopping Dark Reign. Rumor has it that she is wise beyond all imagination. Ascend to the summit of the snow-capped peak in Stillmoon Temple and deal with her. In case she will not listen to reason, bring a force to defend yourself.");
   quest::say("Bring me proof that you have done this task and I will reward you.");
   }
   if ($ulevel >= 61 && $text=~/Storms/i){
   quest::say("Make your way to the isles in the sky. There you will find the great tempest dragon. We want to show a hand of good faith, but do proceed with care. We are almost certain this will be a hopeless mission and you will more than likely be required to defend yourself. Should she wish to see the end of the Norrathians for invading her home, then you must do what is necessary to prevent it.");
   quest::say("Return to me with her answer either way."); 
   }   
   if ($ulevel >= 61 && $text=~/Reflections/i){
   quest::say("Our scouts have informed us that Rikkukin is in danger of being attacked by Dark Reign. I must ask you to travel to the highest peak of Stillmoon and find this dragon. He is known among his kind as 'The Defender', and while that is somewhat encouraging, the forces of Dark Reign are tenacious and resourceful and likely to exploit a weakness. If he proves to be unwilling to speak, prepare to defend yourself.");
   }   
 }

sub EVENT_ITEM { 
if ($ulevel == 41 && plugin::check_handin(\%itemcount, 57201 => 1)) {
   quest::say("Well done $name! Your first run in with a dragon, there will be many more as you continue on your journeys.");
   quest::ding();
   quest::exp(639370);
   quest::givecash(0,0,0,50);
   }
   elsif ($ulevel == 42 && plugin::check_handin(\%itemcount, 57201 => 1)) {
   quest::say("Well done $name! Your first run in with a dragon, there will be many more as you continue on your journeys.");
   quest::ding();
   quest::exp(671710);
   quest::givecash(0,0,0,50);
   }
   elsif ($ulevel == 43 && plugin::check_handin(\%itemcount, 57201 => 1)) {
   quest::say("Well done $name! Your first run in with a dragon, there will be many more as you continue on your journeys.");
   quest::ding();
   quest::exp(704470);
   quest::givecash(0,0,0,50);
   }
   elsif ($ulevel == 44 && plugin::check_handin(\%itemcount, 57201 => 1)) {
   quest::say("Well done $name! Your first run in with a dragon, there will be many more as you continue on your journeys.");
   quest::ding();
   quest::exp(738010);
   quest::givecash(0,0,0,50);
   }
   elsif ($ulevel == 45 && plugin::check_handin(\%itemcount, 57201 => 1)) {
   quest::say("Well done $name! Your first run in with a dragon, there will be many more as you continue on your journeys.");
   quest::ding();
   quest::exp(1629580);
   quest::givecash(0,0,0,50);
   }
   elsif ($ulevel == 46 && plugin::check_handin(\%itemcount, 57201 => 1)) {
   quest::say("Well done $name! Your first run in with a dragon, there will be many more as you continue on your journeys.");
   quest::ding();
   quest::exp(869540);
   quest::givecash(0,0,0,50);
   }
   elsif ($ulevel == 47 && plugin::check_handin(\%itemcount, 57201 => 1)) {
   quest::say("Well done $name! Your first run in with a dragon, there will be many more as you continue on your journeys.");
   quest::ding();
   quest::exp(908180);
   quest::givecash(0,0,0,50);
   }
   elsif ($ulevel == 48 && plugin::check_handin(\%itemcount, 57201 => 1)) {
   quest::say("Well done $name! Your first run in with a dragon, there will be many more as you continue on your journeys.");
   quest::ding();
   quest::exp(947660);
   quest::givecash(0,0,0,50);
   }
   elsif ($ulevel == 49 && plugin::check_handin(\%itemcount, 57201 => 1)) {
   quest::say("Well done $name! Your first run in with a dragon, there will be many more as you continue on your journeys.");
   quest::ding();
   quest::exp(987980);
   quest::givecash(0,0,0,50);
   }
   elsif ($ulevel == 50 && plugin::check_handin(\%itemcount, 57201 => 1)) {
   quest::say("Well done $name! Your first run in with a dragon, there will be many more as you continue on your journeys.");
   quest::ding();
   quest::exp(1029140);
   quest::givecash(0,0,0,50);
   }
elsif ($ulevel == 61 && plugin::check_handin(\%itemcount, 120142 => 1)) { 
   quest::say("So Kessdona would not listen to reason. We hope the reward was worth the effort. Thank you for helping us.");
   quest::exp(2855560);
   quest::ding();
   quest::givecash(0,0,0,60);
   }
   elsif ($ulevel == 62 && plugin::check_handin(\%itemcount, 120142 => 1)) { 
   quest::say("So Kessdona would not listen to reason. We hope the reward was worth the effort. Thank you for helping us.");
   quest::exp(2950220);
   quest::ding();
   quest::givecash(0,0,0,60);
   }
   elsif ($ulevel == 63 && plugin::check_handin(\%itemcount, 120142 => 1)) { 
   quest::say("So Kessdona would not listen to reason. We hope the reward was worth the effort. Thank you for helping us.");
   quest::exp(3042940);
   quest::ding();
   quest::givecash(0,0,0,60);
   }
   elsif ($ulevel == 64 && plugin::check_handin(\%itemcount, 120142 => 1)) { 
   quest::say("So Kessdona would not listen to reason. We hope the reward was worth the effort. Thank you for helping us.");
   quest::exp(3145220);
   quest::ding();
   quest::givecash(0,0,0,60);
   }
   elsif ($ulevel == 65 && plugin::check_handin(\%itemcount, 120142 => 1)) { 
   quest::say("So Kessdona would not listen to reason. We hope the reward was worth the effort. Thank you for helping us.");
   quest::exp(3245060);
   quest::ding();
   quest::givecash(0,0,0,60);
   }
elsif ($ulevel == 61 && plugin::check_handin(\%itemcount, 120164 => 1)) {
   quest::say("Tis a sad day indeed, We had hoped for a better ending but hope does not always win out. Thank you $name.");
   quest::exp(2855560);
   quest::ding();
   quest::givecash(0,0,0,60);
   }   
   elsif ($ulevel == 62 && plugin::check_handin(\%itemcount, 120164 => 1)) {
   quest::say("Tis a sad day indeed, We had hoped for a better ending but hope does not always win out. Thank you $name.");
   quest::exp(2950220);
   quest::ding();
   quest::givecash(0,0,0,60);
   }   
   elsif ($ulevel == 63 && plugin::check_handin(\%itemcount, 120164 => 1)) {
   quest::say("Tis a sad day indeed, We had hoped for a better ending but hope does not always win out. Thank you $name.");
   quest::exp(3042940);
   quest::ding();
   quest::givecash(0,0,0,60);
   }   
   elsif ($ulevel == 64 && plugin::check_handin(\%itemcount, 120164 => 1)) {
   quest::say("Tis a sad day indeed, We had hoped for a better ending but hope does not always win out. Thank you $name.");
   quest::exp(3145220);
   quest::ding();
   quest::givecash(0,0,0,60);
   }   
   elsif ($ulevel == 65 && plugin::check_handin(\%itemcount, 120164 => 1)) {
   quest::say("Tis a sad day indeed, We had hoped for a better ending but hope does not always win out. Thank you $name.");
   quest::exp(3245060);
   quest::ding();
   quest::givecash(0,0,0,60);
   }   
elsif ($ulevel == 61 && plugin::check_handin(\%itemcount, 120165 => 1)) {
   quest::say("I do not understand what is going on with the Stillmoon creatures, all our attempts to make peace seem to have failed. No fault of yours I am sure but puzzleing just the same.");
   quest::exp(2855560);
   quest::ding();
   quest::givecash(0,0,0,60);
   }
   elsif ($ulevel == 62 && plugin::check_handin(\%itemcount, 120165 => 1)) {
   quest::say("I do not understand what is going on with the Stillmoon creatures, all our attempts to make peace seem to have failed. No fault of yours I am sure but puzzleing just the same.");
   quest::exp(2950220);
   quest::ding();
   quest::givecash(0,0,0,60);
   }
   elsif ($ulevel == 63 && plugin::check_handin(\%itemcount, 120165 => 1)) {
   quest::say("I do not understand what is going on with the Stillmoon creatures, all our attempts to make peace seem to have failed. No fault of yours I am sure but puzzleing just the same.");
   quest::exp(3042940);
   quest::ding();
   quest::givecash(0,0,0,60);
   }
   elsif ($ulevel == 64 && plugin::check_handin(\%itemcount, 120165 => 1)) {
   quest::say("I do not understand what is going on with the Stillmoon creatures, all our attempts to make peace seem to have failed. No fault of yours I am sure but puzzleing just the same.");
   quest::exp(3145220);
   quest::ding();
   quest::givecash(0,0,0,60);
   }
   elsif ($ulevel == 65 && plugin::check_handin(\%itemcount, 120165 => 1)) {
   quest::say("I do not understand what is going on with the Stillmoon creatures, all our attempts to make peace seem to have failed. No fault of yours I am sure but puzzleing just the same.");
   quest::exp(3245060);
   quest::ding();
   quest::givecash(0,0,0,60);
   }
        else {
    plugin::return_items(\%itemcount);
    quest::say("I have no use for this.");
   }   
}