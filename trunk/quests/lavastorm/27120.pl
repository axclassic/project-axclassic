sub EVENT_SAY {
my $path = quest::saylink("path", 1);
my $collecting = quest::saylink("collecting", 1);
my $Army = quest::saylink("Army", 1);
my $Blood = quest::saylink("Blood", 1);
my $Diseased = quest::saylink("Diseased", 1);
my $Clearing = quest::saylink("Clearing", 1);
my $Muddy = quest::saylink("Muddy", 1);
my $Reap = quest::saylink("Reap", 1);
my $Snowfoot = quest::saylink("Snowfoot", 1);
   if ($text=~/Hail/i){
   quest::say("Perhaps you will find a $path of the Dark Reign -- a place I'm sure I shall find myself someday... someday.");
   }
   if ($text=~/path/i){
   quest::say("Show your loyalty to the Dark Reign by scouting and $collecting items so that we may gain knowledge to combat our enemies.");
   }
   if ($text=~/collecting/i){
   quest::say("There are several ways you can help , I will allow you to choose which one or more you think you can handle.");
   quest::say("Let's see, there is $Army of Stone, $Blood of Sand, $Diseased Pumas, $Clearing the Path, $Muddy the Waters, $Reap the Kirin Mind, $Snowfoot Attack. Thats the ones I know about but there may be more.");
   }
   if ($text=~/Army/i){
   quest::say("In Stillmoon Temple there is a new form of creature. They appear to be guardians made of clay, yet when you get close to them, they spring to life and kill the poor unsuspecting soul.");
   quest::say("Bring me four of the Animated Guardian Essences so we can study them and I shall reward you.");
   }
   if ($text=~/Blood/i){
   quest::say("Stillmoon Temple residents unfortunately with the recent turmoil, have become infected with a mysterious virus and have passed it along to several of our members that have grown sick while traveling through the Temple. We ask you to please venture to the Temple and obtain seven samples of impure goblin blood so that we may perhaps find a cure for the infection.");
   quest::say("Place the seven impure goblin bloods in this container, combine them and bring to me a Vial of Impure Goblin Blood.");
   quest::summonitem(120121);
   }
   if ($text=~/Diseased/i){  
   quest::say("The pumas of Stillmoon Temple are said to be revered and blessed protectors. Unfortunately with the recent turmoil, some of the pumas have become infected with a mysterious virus and have passed it along to several of our members that have grown sick while traveling through the Temple. We ask you to please venture to the Temple and obtain four samples of infected puma blood so that we may perhaps find a cure for the infection. Once you find the blood samples, return them to me.");
   } 
   if ($text=~/Clearing/i){
   quest::say("Show your alligence to the Dark Reign, go to Stillmoon temple and kill Stillmoon drakes. Loot eight drake intestines and combine them in this bag. Return to me with the finished bag and I shall reward your alligence to the Dark Reign.");
   quest::summonitem(120123);
   }
   if ($text=~/Muddy/i){
   quest::say("Show your alligence to the Dark Reign, go to Stillmoon temple and kill Stillmoon water servants. Loot seven water goblin bloods and combine them in this container,combine them and Return to me with the finished bag and I shall reward your alligence to the Dark Reign.");
   quest::summonitem(120125);
   }
   if ($text=~/Reap/i){
   quest::say("Those kirins in The Ascent that leads up the mountain into the clouds are truly abhorrent, but may serve a purpose to us. We believe they are highly intelligent if we understand our lore correctly. Should we be able to steal their knowledge, we may be able to use it against the dragons, or better, the light races of Norrath.");
quest::say("We shall need a few samples to work on so loot 3 Pristine Kirin Brains and return them to me...Whats that? Yes, yes you shall be rewarded.");
   }
   if ($text=~/Snowfoot/i){
   quest::say("Show your alligence to the Dark Reign, go to the Ascent northern most section and kill Snowfoot goblins. Loot ten Rough Patch of Goblin Skin and combine them in this bag. Return to me with the finished bag and I shall reward your alligence to the Dark Reign.");
   quest::summonitem(120128);
  }
 }
 sub EVENT_ITEM {
   if (plugin::check_handin(\%itemcount, 52501 =>1, 52501 =>1, 52501 =>1, 52501 =>1 )) {
   quest::ding();
   quest::exp(100000);
   quest::say("These are exactly what we needed. Thank you $name");
   quest::givecash(2,6,5,50);
   }
   elsif (plugin::check_handin(\%itemcount, 120122 =>1 )) {
   quest::ding();
   quest::exp(100000);
   quest::say("These are exactly what we needed. Thank you $name");
   quest::givecash(2,6,5,50);
   }
   elsif (plugin::check_handin(\%itemcount, 49019 =>1, 49019 =>1, 49019 =>1, 49019 =>1 )) {
   quest::ding();
   quest::exp(100000);
   quest::say("These are exactly what we needed. Thank you $name");
   quest::givecash(2,6,5,50);
   }
   elsif (plugin::check_handin(\%itemcount, 120124 =>1 )) {
   quest::ding();
   quest::exp(100000);
   quest::say("These are exactly what we needed. Thank you $name");
   quest::givecash(2,6,5,50);
   }
   elsif (plugin::check_handin(\%itemcount, 120126 =>1 )) {
   quest::ding();
   quest::exp(100000);
   quest::say("These are exactly what we needed. Thank you $name");
   quest::givecash(2,6,5,50);
   }
   if (plugin::check_handin(\%itemcount, 52502 =>1, 52502 =>1, 52502 =>1 )) {
   quest::ding();
   quest::exp(100000);
   quest::say("These are exactly what we needed. Thank you $name");
   quest::givecash(2,6,5,50);
   }
   elsif (plugin::check_handin(\%itemcount, 120129 =>1 )) {
   quest::ding();
   quest::exp(100000);
   quest::say("These are exactly what we needed. Thank you $name");
   quest::givecash(2,6,5,50);
   }
       else {
    plugin::return_items(\%itemcount);
    quest::say("I have no use for this.");
   }
 }