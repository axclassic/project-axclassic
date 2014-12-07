sub EVENT_SAY {
my $path = quest::saylink("path", 1);
my $collecting = quest::saylink("collecting", 1);
my $Army = quest::saylink("Army", 1);
my $Blood = quest::saylink("Blood", 1);
my $Diseased = quest::saylink("Diseased", 1);
my $Clearing = quest::saylink("Clearing", 1);
my $Muddy = quest::saylink("Muddy", 1);
my $Reap = quest::saylink("Reap", 1);
my $Poison = quest::saylink("Poison", 1);
my $Snowfoot = quest::saylink("Snowfoot", 1);
   if ($ulevel <= 20 && $text=~/Hail/i){
   quest::say("$name! You dare to address me so informally? I ought to have you slain! Be gone!'");
   }
   if ($ulevel <= 30 && $ulevel >= 21 && $text=~/Hail/i){
   quest::say("I have but one job for someone of your experiance, Go to Lavaspinners Lair and collect four Caustic Lavaspinner Venom. Survive and return them to me for your reward.");
   }
   if ($ulevel <= 40 && $ulevel >= 31 && $text=~/Hail/i){
   quest::say("I have but one job for someone of your experiance, Go to Tirranun's Delve and collect four Simmering Basilisk Blood. Survive and return them to me for your reward.");
   }
   if ($ulevel <= 50 && $ulevel >= 41 && $text=~/Hail/i){
   quest::say("$name! You dare to address me so informally? I ought to have you slain! Be gone!'");
   }
   if ($ulevel >= 51 && $text=~/Hail/i){
   quest::say("Perhaps you will find a $path of the Dark Reign -- a place I'm sure I shall find myself someday... someday.");
   }
   if ($text=~/path/i){
   quest::say("Show your loyalty to the Dark Reign by scouting and $collecting items so that we may gain knowledge to combat our enemies.");
   }
   if ($ulevel <= 60 && $ulevel >= 51 && $text=~/collecting/i){
   quest::say("There are several ways you can help , I will allow you to choose which one or more you think you can handle.");
   quest::say("Let's see, there is $Army of Stone, $Blood of Sand, $Clearing the Path, $Muddy the Waters. Thats the ones I know about but there may be more.");
   }
   if ($ulevel >= 61 && $text=~/collecting/i){
   quest::say("There are several ways you can help , I will allow you to choose which one or more you think you can handle.");
   quest::say("Let's see, there is $Reap the Kirin Mind or $Snowfoot Attack. Thats the ones I know about but there may be more.");
   }
   if ($ulevel <= 60 && $ulevel >= 51 && $text=~/Army/i){
   quest::say("In Stillmoon Temple there is a new form of creature. They appear to be guardians made of clay, yet when you get close to them, they spring to life and kill the poor unsuspecting soul.");
   quest::say("Bring me four of the Animated Guardian Essences so we can study them and I shall reward you.");
   }
   if ($ulevel <= 60 && $ulevel >= 51 && $text=~/Blood/i){
   quest::say("Stillmoon Temple residents unfortunately with the recent turmoil, have become infected with a mysterious virus and have passed it along to several of our members that have grown sick while traveling through the Temple. We ask you to please venture to the Temple and obtain seven samples of impure goblin blood so that we may perhaps find a cure for the infection.");
   quest::say("Place the seven impure goblin bloods in this container, combine them and bring to me a Vial of Impure Goblin Blood.");
   quest::summonitem(120121);
   }
   if ($ulevel <= 60 && $ulevel >= 51 && $text=~/Clearing/i){
   quest::say("Show your alligence to the Dark Reign, go to Stillmoon temple and kill Stillmoon drakes. Loot eight drake intestines and combine them in this bag. Return to me with the finished bag and I shall reward your alligence to the Dark Reign.");
   quest::summonitem(120123);
   }
   if ($ulevel <= 60 && $ulevel >= 51 && $text=~/Muddy/i){
   quest::say("Show your alligence to the Dark Reign, go to Stillmoon temple and kill Stillmoon water servants. Loot seven water goblin bloods and combine them in this container,combine them and Return to me with the finished bag and I shall reward your alligence to the Dark Reign.");
   quest::summonitem(120125);
   }
   if ($ulevel >= 61 && $text=~/Reap/i){
   quest::say("Those kirins in The Ascent that leads up the mountain into the clouds are truly abhorrent, but may serve a purpose to us. We believe they are highly intelligent if we understand our lore correctly. Should we be able to steal their knowledge, we may be able to use it against the dragons, or better, the light races of Norrath.");
quest::say("We shall need a few samples to work on so loot 3 Pristine Kirin Brains and return them to me...Whats that? Yes, yes you shall be rewarded.");
   }
   if ($ulevel >= 61 && $text=~/Snowfoot/i){
   quest::say("Show your alligence to the Dark Reign, go to the Ascent northern most section and kill Snowfoot goblins. Loot ten Rough Patch of Goblin Skin and combine them in this bag. Return to me with the finished bag and I shall reward your alligence to the Dark Reign.");
   quest::summonitem(120128);
  }
 }
 sub EVENT_ITEM {
if ($ulevel == 21 && plugin::check_handin(\%itemcount, 52498 =>4 )) {  
   quest::ding();
   quest::exp(126100);
   quest::say("These are exactly what we needed. Thank you $name");
   quest::givecash(2,6,5,50);
   }
   elsif ($ulevel == 22 && plugin::check_handin(\%itemcount, 52498 =>4 )) {  
   quest::ding();
   quest::exp(138700);
   quest::say("These are exactly what we needed. Thank you $name");
   quest::givecash(2,6,5,50);
   }
   elsif ($ulevel == 23 && plugin::check_handin(\%itemcount, 52498 =>4 )) {  
   quest::ding();
   quest::exp(151900);
   quest::say("These are exactly what we needed. Thank you $name");
   quest::givecash(2,6,5,50);
   }
   elsif ($ulevel == 24 && plugin::check_handin(\%itemcount, 52498 =>4 )) {  
   quest::ding();
   quest::exp(165700);
   quest::say("These are exactly what we needed. Thank you $name");
   quest::givecash(2,6,5,50);
   }
   elsif ($ulevel == 25 && plugin::check_handin(\%itemcount, 52498 =>4 )) {  
   quest::ding();
   quest::exp(180100);
   quest::say("These are exactly what we needed. Thank you $name");
   quest::givecash(2,6,5,50);
   }
   elsif ($ulevel == 26 && plugin::check_handin(\%itemcount, 52498 =>4 )) {  
   quest::ding();
   quest::exp(195100);
   quest::say("These are exactly what we needed. Thank you $name");
   quest::givecash(2,6,5,50);
   }
   elsif ($ulevel == 27 && plugin::check_handin(\%itemcount, 52498 =>4 )) {  
   quest::ding();
   quest::exp(210700);
   quest::say("These are exactly what we needed. Thank you $name");
   quest::givecash(2,6,5,50);
   }
   elsif ($ulevel == 28 && plugin::check_handin(\%itemcount, 52498 =>4 )) {  
   quest::ding();
   quest::exp(226900);
   quest::say("These are exactly what we needed. Thank you $name");
   quest::givecash(2,6,5,50);
   }
   elsif ($ulevel == 29 && plugin::check_handin(\%itemcount, 52498 =>4 )) {  
   quest::ding();
   quest::exp(243700);
   quest::say("These are exactly what we needed. Thank you $name");
   quest::givecash(2,6,5,50);
   }
   elsif ($ulevel == 30 && plugin::check_handin(\%itemcount, 52498 =>4 )) {  
   quest::ding();
   quest::exp(531100);
   quest::say("These are exactly what we needed. Thank you $name");
   quest::givecash(2,6,5,50);
   }
elsif ($ulevel == 31 && plugin::check_handin(\%itemcount, 52499 =>4 )) {  
   quest::ding();
   quest::exp(307010);
   quest::say("These are exactly what we needed. Thank you $name");
   quest::givecash(2,6,5,50);
   }
   elsif ($ulevel == 32 && plugin::check_handin(\%itemcount, 52499 =>4 )) {  
   quest::ding();
   quest::exp(327470);
   quest::say("These are exactly what we needed. Thank you $name");
   quest::givecash(2,6,5,50);
   }
   elsif ($ulevel == 33 && plugin::check_handin(\%itemcount, 52499 =>4 )) {  
   quest::ding();
   quest::exp(348590);
   quest::say("These are exactly what we needed. Thank you $name");
   quest::givecash(2,6,5,50);
   }
   elsif ($ulevel == 34 && plugin::check_handin(\%itemcount, 52499 =>4 )) {  
   quest::ding();
   quest::exp(370370);
   quest::say("These are exactly what we needed. Thank you $name");
   quest::givecash(2,6,5,50);
   }
   elsif ($ulevel == 35 && plugin::check_handin(\%itemcount, 52499 =>4 )) {  
   quest::ding();
   quest::exp(479640);
   quest::say("These are exactly what we needed. Thank you $name");
   quest::givecash(2,6,5,50);
   }
   elsif ($ulevel == 36 && plugin::check_handin(\%itemcount, 52499 =>4 )) {  
   quest::ding();
   quest::exp(453720);
   quest::say("These are exactly what we needed. Thank you $name");
   quest::givecash(2,6,5,50);
   }
   elsif ($ulevel == 37 && plugin::check_handin(\%itemcount, 52499 =>4 )) {  
   quest::ding();
   quest::exp(479640);
   quest::say("These are exactly what we needed. Thank you $name");
   quest::givecash(2,6,5,50);
   }
   elsif ($ulevel == 38 && plugin::check_handin(\%itemcount, 52499 =>4 )) {  
   quest::ding();
   quest::exp(506280);
   quest::say("These are exactly what we needed. Thank you $name");
   quest::givecash(2,6,5,50);
   }
   elsif ($ulevel == 39 && plugin::check_handin(\%itemcount, 52499 =>4 )) {  
   quest::ding();
   quest::exp(633640);
   quest::say("These are exactly what we needed. Thank you $name");
   quest::givecash(2,6,5,50);
   }
   elsif ($ulevel == 40 && plugin::check_handin(\%itemcount, 52499 =>4 )) {  
   quest::ding();
   quest::exp(1201720);
   quest::say("These are exactly what we needed. Thank you $name");
   quest::givecash(2,6,5,50);
   }
elsif ($ulevel == 51 && plugin::check_handin(\%itemcount, 52501 =>4 )) {  
   quest::ding();
   quest::exp(2397650);
   quest::say("These are exactly what we needed. Thank you $name");
   quest::givecash(2,6,5,50);
   }
   elsif ($ulevel == 52 && plugin::check_handin(\%itemcount, 52501 =>4 )) {  
   quest::ding();
   quest::exp(2599630);
   quest::say("These are exactly what we needed. Thank you $name");
   quest::givecash(2,6,5,50);
   }
   elsif ($ulevel == 53 && plugin::check_handin(\%itemcount, 52501 =>4 )) {  
   quest::ding();
   quest::exp(2811810);
   quest::say("These are exactly what we needed. Thank you $name");
   quest::givecash(2,6,5,50);
   }
   elsif ($ulevel == 54 && plugin::check_handin(\%itemcount, 52501 =>4 )) {  
   quest::ding();
   quest::exp(4609070);
   quest::say("These are exactly what we needed. Thank you $name");
   quest::givecash(2,6,5,50);
   }
   elsif ($ulevel == 55 && plugin::check_handin(\%itemcount, 52501 =>4 )) {  
   quest::ding();
   quest::exp(3356840);
   quest::say("These are exactly what we needed. Thank you $name");
   quest::givecash(2,6,5,50);
   }
   elsif ($ulevel == 56 && plugin::check_handin(\%itemcount, 52501 =>4 )) {  
   quest::ding();
   quest::exp(3604360);
   quest::say("These are exactly what we needed. Thank you $name");
   quest::givecash(2,6,5,50);
   }
   elsif ($ulevel == 57 && plugin::check_handin(\%itemcount, 52501 =>4 )) {  
   quest::ding();
   quest::exp(3863100);
   quest::say("These are exactly what we needed. Thank you $name");
   quest::givecash(2,6,5,50);
   }
   elsif ($ulevel == 58 && plugin::check_handin(\%itemcount, 52501 =>4 )) {  
   quest::ding();
   quest::exp(4133300);
   quest::say("These are exactly what we needed. Thank you $name");
   quest::givecash(2,6,5,50);
   }
   elsif ($ulevel == 59 && plugin::check_handin(\%itemcount, 52501 =>4 )) {  
   quest::ding();
   quest::exp(6468990);
   quest::say("These are exactly what we needed. Thank you $name");
   quest::givecash(2,6,5,50);
   }
   elsif ($ulevel == 60 && plugin::check_handin(\%itemcount, 52501 =>4 )) {  
   quest::ding();
   quest::exp(4815250);
   quest::say("These are exactly what we needed. Thank you $name");
   quest::givecash(2,6,5,50);
   }
elsif ($ulevel == 51 && plugin::check_handin(\%itemcount, 120122 =>1 )) { 
   quest::ding();
   quest::exp(2397650);
   quest::say("Perfect, exactly what we needed. Thank you $name");
   quest::givecash(2,6,5,50);
   }
   elsif ($ulevel == 52 && plugin::check_handin(\%itemcount, 120122 =>1 )) {  
   quest::ding();
   quest::exp(2599630);
   quest::say("Perfect, exactly what we needed. Thank you $name");
   quest::givecash(2,6,5,50);
   }
   elsif ($ulevel == 53 && plugin::check_handin(\%itemcount, 120122 =>1 )) { 
   quest::ding();
   quest::exp(2811810);
   quest::say("Perfect, exactly what we needed. Thank you $name");
   quest::givecash(2,6,5,50);
   }
   elsif ($ulevel == 54 && plugin::check_handin(\%itemcount, 120122 =>1 )) {  
   quest::ding();
   quest::exp(4609070);
   quest::say("Perfect, exactly what we needed. Thank you $name");
   quest::givecash(2,6,5,50);
   }
   elsif ($ulevel == 55 && plugin::check_handin(\%itemcount, 120122 =>1 )) {  
   quest::ding();
   quest::exp(3356840);
   quest::say("Perfect, exactly what we needed. Thank you $name");
   quest::givecash(2,6,5,50);
   }
   elsif ($ulevel == 56 && plugin::check_handin(\%itemcount, 120122 =>1 )) {  
   quest::ding();
   quest::exp(3604360);
   quest::say("Perfect, exactly what we needed. Thank you $name");
   quest::givecash(2,6,5,50);
   }
   elsif ($ulevel == 57 && plugin::check_handin(\%itemcount, 120122 =>1 )) {  
   quest::ding();
   quest::exp(3863100);
   quest::say("Perfect, exactly what we needed. Thank you $name");
   quest::givecash(2,6,5,50);
   }
   elsif ($ulevel == 58 && plugin::check_handin(\%itemcount, 120122 =>1 )) {  
   quest::ding();
   quest::exp(4133300);
   quest::say("Perfect, exactly what we needed. Thank you $name");
   quest::givecash(2,6,5,50);
   }
   elsif ($ulevel == 59 && plugin::check_handin(\%itemcount, 120122 =>1 )) { 
   quest::ding();
   quest::exp(6468990);
   quest::say("Perfect, exactly what we needed. Thank you $name");
   quest::givecash(2,6,5,50);
   }
   elsif ($ulevel == 60 && plugin::check_handin(\%itemcount, 120122 =>1 )) {  
   quest::ding();
   quest::exp(4815250);
   quest::say("Perfect, exactly what we needed. Thank you $name");
   quest::givecash(2,6,5,50);
   }
elsif ($ulevel == 51 && plugin::check_handin(\%itemcount, 120124 =>1 )) {  
   quest::ding();
   quest::exp(2397650);
   quest::say("These are exactly what we needed. Thank you $name");
   quest::givecash(2,6,5,50);
   }
   elsif ($ulevel == 52 && plugin::check_handin(\%itemcount, 120124 =>1 )) {  
   quest::ding();
   quest::exp(2599630);
   quest::say("These are exactly what we needed. Thank you $name");
   quest::givecash(2,6,5,50);
   }
   elsif ($ulevel == 53 && plugin::check_handin(\%itemcount, 120124 =>1 )) {  
   quest::ding();
   quest::exp(2811810);
   quest::say("These are exactly what we needed. Thank you $name");
   quest::givecash(2,6,5,50);
   }
   elsif ($ulevel == 54 && plugin::check_handin(\%itemcount, 120124 =>1 )) {  
   quest::ding();
   quest::exp(4609070);
   quest::say("These are exactly what we needed. Thank you $name");
   quest::givecash(2,6,5,50);
   }
   elsif ($ulevel == 55 && plugin::check_handin(\%itemcount, 120124 =>1 )) {  
   quest::ding();
   quest::exp(3356840);
   quest::say("These are exactly what we needed. Thank you $name");
   quest::givecash(2,6,5,50);
   }
   elsif ($ulevel == 56 && plugin::check_handin(\%itemcount, 120124 =>1 )) {  
   quest::ding();
   quest::exp(3604360);
   quest::say("These are exactly what we needed. Thank you $name");
   quest::givecash(2,6,5,50);
   }
   elsif ($ulevel == 57 && plugin::check_handin(\%itemcount, 120124 =>1 )) {  
   quest::ding();
   quest::exp(3863100);
   quest::say("These are exactly what we needed. Thank you $name");
   quest::givecash(2,6,5,50);
   }
   elsif ($ulevel == 58 && plugin::check_handin(\%itemcount, 120124 =>1 )) {  
   quest::ding();
   quest::exp(4133300);
   quest::say("These are exactly what we needed. Thank you $name");
   quest::givecash(2,6,5,50);
   }
   elsif ($ulevel == 59 && plugin::check_handin(\%itemcount, 120124 =>1 )) {  
   quest::ding();
   quest::exp(6468990);
   quest::say("These are exactly what we needed. Thank you $name");
   quest::givecash(2,6,5,50);
   }
   elsif ($ulevel == 60 && plugin::check_handin(\%itemcount, 120124 =>1 )) {  
   quest::ding();
   quest::exp(4815250);
   quest::say("These are exactly what we needed. Thank you $name");
   quest::givecash(2,6,5,50);
   }
elsif ($ulevel == 51 && plugin::check_handin(\%itemcount, 120126 =>1 )) {  
   quest::ding();
   quest::exp(2397650);
   quest::say("These are exactly what we needed. Thank you $name");
   quest::givecash(2,6,5,50);
   }
   elsif ($ulevel == 52 && plugin::check_handin(\%itemcount, 120126 =>1 )) {  
   quest::ding();
   quest::exp(2599630);
   quest::say("These are exactly what we needed. Thank you $name");
   quest::givecash(2,6,5,50);
   }
   elsif ($ulevel == 53 && plugin::check_handin(\%itemcount, 120126 =>1 )) {  
   quest::ding();
   quest::exp(2811810);
   quest::say("These are exactly what we needed. Thank you $name");
   quest::givecash(2,6,5,50);
   }
   elsif ($ulevel == 54 && plugin::check_handin(\%itemcount, 120126 =>1 )) {  
   quest::ding();
   quest::exp(4609070);
   quest::say("These are exactly what we needed. Thank you $name");
   quest::givecash(2,6,5,50);
   }
   elsif ($ulevel == 55 && plugin::check_handin(\%itemcount, 120126 =>1 )) {  
   quest::ding();
   quest::exp(3356840);
   quest::say("These are exactly what we needed. Thank you $name");
   quest::givecash(2,6,5,50);
   }
   elsif ($ulevel == 56 && plugin::check_handin(\%itemcount, 120126 =>1 )) {  
   quest::ding();
   quest::exp(3604360);
   quest::say("These are exactly what we needed. Thank you $name");
   quest::givecash(2,6,5,50);
   }
   elsif ($ulevel == 57 && plugin::check_handin(\%itemcount, 120126 =>1 )) {  
   quest::ding();
   quest::exp(3863100);
   quest::say("These are exactly what we needed. Thank you $name");
   quest::givecash(2,6,5,50);
   }
   elsif ($ulevel == 58 && plugin::check_handin(\%itemcount, 120126 =>1 )) {  
   quest::ding();
   quest::exp(4133300);
   quest::say("These are exactly what we needed. Thank you $name");
   quest::givecash(2,6,5,50);
   }
   elsif ($ulevel == 59 && plugin::check_handin(\%itemcount, 120126 =>1 )) {  
   quest::ding();
   quest::exp(6468990);
   quest::say("These are exactly what we needed. Thank you $name");
   quest::givecash(2,6,5,50);
   }
   elsif ($ulevel == 60 && plugin::check_handin(\%itemcount, 120126 =>1 )) {  
   quest::ding();
   quest::exp(4815250);
   quest::say("These are exactly what we needed. Thank you $name");
   quest::givecash(2,6,5,50);
   }   
elsif ($ulevel == 61 && plugin::check_handin(\%itemcount, 52502 =>3 )) {  
   quest::ding();
   quest::exp(2835560);
   quest::say("These are exactly what we needed. Thank you $name");
   quest::givecash(2,6,5,50);
   }
   elsif ($ulevel == 62 && plugin::check_handin(\%itemcount, 52502 =>3 )) {  
   quest::ding();
   quest::exp(2950220);
   quest::say("These are exactly what we needed. Thank you $name");
   quest::givecash(2,6,5,50);
   }
   elsif ($ulevel == 63 && plugin::check_handin(\%itemcount, 52502 =>3 )) {  
   quest::ding();
   quest::exp(3042940);
   quest::say("These are exactly what we needed. Thank you $name");
   quest::givecash(2,6,5,50);
   }
   elsif ($ulevel == 64 && plugin::check_handin(\%itemcount, 52502 =>3 )) {  
   quest::ding();
   quest::exp(3145220);
   quest::say("These are exactly what we needed. Thank you $name");
   quest::givecash(2,6,5,50);
   }
   elsif ($ulevel == 65 && plugin::check_handin(\%itemcount, 52502 =>3 )) {  
   quest::ding();
   quest::exp(3245060);
   quest::say("These are exactly what we needed. Thank you $name");
   quest::givecash(2,6,5,50);
   }
elsif ($ulevel >= 61 && plugin::check_handin(\%itemcount, 120129 =>1 )) {  
   quest::ding();
   quest::exp(2835560);
   quest::say("This is exactly what we needed. Thank you $name");
   quest::givecash(0,0,0,60);
   }
   elsif ($ulevel >= 62 && plugin::check_handin(\%itemcount, 120129 =>1 )) {  
   quest::ding();
   quest::exp(2950220);
   quest::say("This is exactly what we needed. Thank you $name");
   quest::givecash(0,0,0,60);
   }
   elsif ($ulevel >= 63 && plugin::check_handin(\%itemcount, 120129 =>1 )) {  
   quest::ding();
   quest::exp(3042940);
   quest::say("This is exactly what we needed. Thank you $name");
   quest::givecash(0,0,0,60);
   }
   elsif ($ulevel >= 64 && plugin::check_handin(\%itemcount, 120129 =>1 )) {  
   quest::ding();
   quest::exp(3145220);
   quest::say("This is exactly what we needed. Thank you $name");
   quest::givecash(0,0,0,60);
   }
   elsif ($ulevel >= 65 && plugin::check_handin(\%itemcount, 120129 =>1 )) {  
   quest::ding();
   quest::exp(3245060);
   quest::say("This is exactly what we needed. Thank you $name");
   quest::givecash(0,0,0,60);
   }
       else {
    plugin::return_items(\%itemcount);
    quest::say("I have no use for this.");
   }
 }