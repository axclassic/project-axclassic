sub EVENT_SAY {
my $rumors = quest::saylink("rumors", 1);
my $Animated = quest::saylink("Animated", 1);
my $Best = quest::saylink("Best", 1);
my $Diseased = quest::saylink("Diseased", 1);
my $Scales = quest::saylink("Scales", 1);
my $Signal = quest::saylink("Signal", 1);
my $Sudden = quest::saylink("Sudden", 1);
my $cause = quest::saylink("cause", 1);
my $plans = quest::saylink("plans", 1);
  if ($text=~/Hail/i){
   quest::say("Welcome traveler, Have you heard the news? New areas of exploration have been found. Already there are many reports that there is trouble.");
   quest::say("I am looking for adventurers that are willing to face the unknown and see if these $rumors are true.");
   }
  if ($text=~/rumors/i){ 
   quest::say("There are so many reports, I will allow you to choose which one or more you think you can handle.");
   quest::say("Let's see, there is $Animated Statue Plans, $Best Laid Plans, $Diseased Pumas, $Scales of Justice, $Signal Fires or $Sudden Tremors. Thats the ones I know about but there may be more.");
   }
  if ($text=~/Animated/i){ 
   quest::say("It's said that great treasures are held safely within the hallowed halls of Stillmoon Temple, guarded by powerful statues that animate when trespassers are near. Recently, one of our agents tracked down some goblin architects that seem to have the knowledge of building a new, stronger version of these juggernauts. Having some of these statues under our control would be most beneficial to our $cause.");
   }
  if ($text=~/cause/i){
   quest::say("Your mission is twofold. You are to go to the temple and retrieve the creation $plans. Then destroy any of the gargantuan prototype statue that has been created with the plans. We can not have any remnant of these statues falling into the hands of Dark Reign.");
   }
  if ($text=~/plans/i){
   quest::say("Aye, once you have the creation plans and have destroyed any of the protypes, return the plans to me. Good luck my friends!");
   }
  if ($text=~/Best/i){ 
   quest::say("We just discovered that someone from Lanys T'Vyl's camp is about to procure a detailed document about the temple from one of its workers. If Lanys wants this document, it must have some value and we ought to prevent her from acquiring it. It is up to you to infiltrate the temple, find this goblin worker, and get the document. Once you have it, deliver it to our contact who will be waiting for you in the temple. She will instruct you further.");
   }
  if ($text=~/Diseased/i){  
   quest::say("The pumas of Stillmoon Temple are said to be revered and blessed protectors. Unfortunately with the recent turmoil, some of the pumas have become infected with a mysterious virus and have passed it along to several of our members that have grown sick while traveling through the Temple. We ask you to please venture to the Temple and obtain four samples of infected puma blood so that we may perhaps find a cure for the infection. Once you find the blood samples, return them to me.");
   }   
  if ($text=~/Scales/i){ 
   quest::say("To establish better relations with some of the temple's inhabitants we've decided to try and give them a peace offering. Within the temple is an aqua goblin who is the keeper of the pond. Approach him slowly and carefully so he understands that you do not mean him harm. Bring him this magical food which will help to enhance the color of his koi, which should make him very pleased. There are those within the temple that do not wish for better relations and they may try to stop you so you must be careful.");
   quest::summonitem(36215);
   }   
  if ($text=~/Signal/i){ 
   quest::say("We have tried to send raiding expeditions to weaken Dark Reign here in the Lavastorm Mountains. So far, our attacks have failed due to their extensive communication network. They always seem to know when we're coming! Our spies even report that Dark Reign has secured a temporary alliance with the Snowfoot goblin clan. In exchange for resources, the goblins tend to Dark Reign's signal fires which burn on the icy peaks of the Ascent.");
   quest::say("Perhaps we can use this to our advantage? Journey up the Ascent and ambush the goblins stationed there. Slay the signal wardens and gather their fuel to start the signal fire. In the ensuring confusion, we can attack Dark Reign here in Lavastorm while they are busy responding to your false signal!");
   quest::say("Collect three of the Ascent Signal Fire Fuels and return them to me. Good luck $name!");
   }   
  if ($text=~/Sudden/i){ 
   quest::say("Scouts in the northern most region of The Ascent are reporting Tremors all around them. If you are brave enough, venture to The Ascent and try to discover the cause of these tremors. bring back to me anything you should find that will help us solve this riddle.");
   }
 }
sub EVENT_ITEM { 
  if (plugin::check_handin(\%itemcount, 49017 => 1)) { 
   quest::say("Very nice work. We hope the reward was worth the effort. Thank you for helping us.");
   quest::exp(100000);
   quest::ding();
   quest::givecash(2,6,5,50);
   }
   elsif (plugin::check_handin(\%itemcount, 36214 => 1)) { 
   quest::say("Very nice work. We hope the reward was worth the effort. Thank you for helping us.");
   quest::exp(100000);
   quest::ding();
   quest::givecash(2,6,5,50);
   }
   elsif (plugin::check_handin(\%itemcount, 49019 =>1, 49019 =>1, 49019 =>1, 49019 =>1 )) {
   quest::ding();
   quest::exp(100000);
   quest::say("These are exactly what we needed. Thank you $name");
   quest::givecash(2,6,5,50);
   }
    elsif (plugin::check_handin(\%itemcount, 120130 => 1)) { 
   quest::say("Nice work adventurer. We are sure the Goblin Koi Master will appreciate the fine magical food you brought him this day. This should help us to establish friendlier relations with the temple from now on. ");
   quest::ding();
   quest::exp(100000);
   quest::givecash(2,6,5,50);
   }
   elsif (plugin::check_handin(\%itemcount, 86007 =>1, 86007 =>1, 86007 =>1 )) {
   quest::ding();
   quest::exp(100000);
   quest::say("Well done $name, that should set the Dark Reign on thier heels!");
   quest::givecash(2,6,5,50);
   }
   elsif (plugin::check_handin(\%itemcount, 48146 => 1)) { 
   quest::say("An Acient Golem you say? My word, well at least destroying him should put an end to the tremors.");
   quest::ding();
   quest::exp(100000);
   quest::say("Well done $name, that should set the Dark Reign on thier heels!");
   quest::givecash(2,6,5,50);
   }
       else {
    plugin::return_items(\%itemcount);
    quest::say("I have no use for this.");
   }
 }
