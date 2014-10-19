#Celrak_Blightblood NPC ID 27124#
sub EVENT_SAY {
my $rumors = quest::saylink("rumors", 1);
my $Storm = quest::saylink("Storm", 1);
my $Best = quest::saylink("Best", 1);
my $Diseased = quest::saylink("Diseased", 1);
  if ($text=~/Hail/i){
   quest::say("Welcome traveler, Have you heard the news? New areas of exploration have been found. Already there are many reports that there is trouble.");
   quest::say("I am looking for adventurers that are willing to face the unknown and see if these $rumors are true.");
   }
  if ($text=~/rumors/i){ 
   quest::say("There are so many reports, I will allow you to choose which one or more you think you can handle.");
   quest::say("Let's see, there is $Storm Dragon Scale, $Best Laid Plans, $Diseased Puma. Thats the ones I know about but there may be more.");
   }
   if ($text=~/Storm/i){
   quest::say("Our spies report that a handful of storm dragon scales were recently given to one of Yar'Lir's most powerful advisors, a goblin warlock know as the Storm Caller. We need you to organize an expedition to recover these scales before the goblins use their newfound power against us. Be careful, for the Storm Caller lair is high on the peaks about Stillmoon, and it is rumoured he has rudimentary control of the weather itself.");
   quest::say("Bring me the Storm Dagon Scales and I shall reward you.");
   } 
   if ($text=~/Best/i){ 
   quest::say("We just discovered that someone from the Norrath Keepers camp is about to procure a detailed document about the temple from one of its workers. If Chieftain Relae Aderi wants this document, it must have some value and we ought to prevent her from acquiring it. It is up to you to infiltrate the temple, find this goblin worker, and get the document. Once you have it, deliver it to our contact who will be waiting for you in the temple. He will instruct you further.");
   }
   if ($text=~/Diseased/i){  
   quest::say("The pumas of Stillmoon Temple are said to be revered and blessed protectors. Unfortunately with the recent turmoil, some of the pumas have become infected with a mysterious virus and have passed it along to several of our members that have grown sick while traveling through the Temple. We ask you to please venture to the Temple and obtain four samples of infected puma blood so that we may perhaps find a cure for the infection. Once you find the blood samples, return them to me.");
   }   
}
sub EVENT_ITEM {
   if (plugin::check_handin(\%itemcount, 49035 => 1)) { 
   quest::ding();
   quest::exp(100000);
   quest::say("Well done $name, You have turned the favor of power back into our hands at least for now.");
   quest::givecash(2,6,5,50);
   }
   elsif (plugin::check_handin(\%itemcount, 36214 => 1)) { 
   quest::say("Good job $name. We hope the reward was worth the effort. Thank you for helping us.");
   quest::exp(100000);
   quest::ding();
   quest::givecash(2,6,5,50);
   }
   elsif (plugin::check_handin(\%itemcount, 49019 =>4 )) {
   quest::ding();
   quest::exp(100000);
   quest::say("These are exactly what we needed. Thank you $name");
   quest::givecash(2,6,5,50);
   }
   elsif (plugin::check_handin(\%itemcount, 49022 =>1 )) {
   quest::ding();
   quest::exp(6000000);
   quest::say("This ashame that we lost an agent but now we have the egg for study. Good work $name.");
   quest::givecash(2,6,5,100);
   }
       else {
    plugin::return_items(\%itemcount);
    quest::say("I have no use for this.");
   }
 }