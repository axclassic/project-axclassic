sub EVENT_SAY {
my $rumors = quest::saylink("rumors", 1);
my $Animated = quest::saylink("Animated", 1);
my $Best = quest::saylink("Best", 1);
my $Diseased = quest::saylink("Diseased", 1);
my $Tracking = quest::saylink("Tracking", 1);
my $Death = quest::saylink("Death", 1);
my $Storm = quest::saylink("Storm", 1);
   if ($ulevel <= 50 && $text=~/Hail/i){
   quest::say("I am sorry but I have nothing that someone of your experiance could possibly handle. Please check with the others in the camp, I am sure they have work that you can do to help the Dark Reign.");
   }
   if ($ulevel >= 51 && $text=~/Hail/i){
   quest::say("Welcome traveler, Have you heard the news? New areas of exploration have been found. Already there are many reports that there is trouble.");
   quest::say("I am looking for adventurers that are willing to face the unknown and see if these $rumors are true.");
   }
   if ($ulevel <= 60 && $ulevel >= 51 && $text=~/rumors/i){ 
   quest::say("There are so many reports, I will allow you to choose which one or more you think you can handle.");
   quest::say("Let's see, there is $Animated Statue Plans, $Best Laid Plans, $Diseased Pumas or $Tracking the kirin. Thats the ones I know about but there may be more.");
   }
   if ($ulevel >= 61 && $text=~/rumors/i){ 
   quest::say("There are so many reports, I will allow you to choose which one or more you think you can handle.");
   quest::say("Let's see, there is $Death Comes Swiftly or $Storm Dragon Scale. Thats the ones I know about but there may be more.");
   }
   if ($ulevel >= 51 && $text=~/Animated/i){ 
   quest::say("It's said that great treasures are held safely within the hallowed halls of Stillmoon Temple, guarded by powerful statues that animate when trespassers are near. Recently, one of our agents tracked down some goblin architects that seem to have the knowledge of building a new, stronger version of these juggernauts. Having some of these statues under our control would be most beneficial to our $cause.");
   quest::say("Aquire these plans and return them to me, you shall be rewarded.");
   }   
   if ($ulevel <= 60 && $ulevel >= 51 && $text=~/Best/i){ 
   quest::say("We just discovered that someone from the Norrath Keepers camp is about to procure a detailed document about the temple from one of its workers. If Chieftain Relae Aderi wants this document, it must have some value and we ought to prevent her from acquiring it. It is up to you to infiltrate the temple, find this goblin worker, and get the document. Once you have it, deliver it to our contact who will be waiting for you in the temple. He will instruct you further.");
   } 
   if ($ulevel <= 60 && $ulevel >= 51 && $text=~/Diseased/i){  
   quest::say("The pumas of Stillmoon Temple are said to be revered and blessed protectors. Bah! they are nothing but flea bitten animals. Fortunately with the recent turmoil, some of the pumas have become infected with a mysterious virus and have passed it along to several of our members that have grown sick while traveling through the Temple. We need you to go to the Temple and obtain four samples of infected puma blood. With any luck our alchemists will be able to make us immune to its effect and the infection can rage agasinst the Norrath Keppers. Once you find the blood samples, return them to me.");
   }
   if ($ulevel <= 60 && $ulevel >= 51 && $text=~/Tracking/i){ 
   quest::say("There is but one kirin who knows the full history of Stillmoon Temple. Finding the elusive creature has proved difficult however. We would like you to try your hand at finding him and return any knowledge of the Stillmoon Temple that you may be able to use it against the Norrath Keepers. To accomplish this you will have to cause a commotion of some sort that may bring him out of hiding. Once you've killed enough of the guards, the kirin is likely to be wandering about unseen. Dispose him and bring back the tome back to me."); 
   }
   if ($ulevel >= 61 && $text=~/Death/i){ 
   quest::say("We think that with the recent discovery of this area, the natural balance has been upset as the local spiders have begun to terrorize the entire area. We need you to find their lair and reduce their numbers back down to acceptable levels.");
   quest::say("Destroy all the spiders in the Ascent and return to me with anything you deem if value.");
   }      
   if ($ulevel >= 61 && $text=~/Storm/i){
   quest::say("Our spies report that a handful of storm dragon scales were recently given to one of Yar'Lir's most powerful advisors, a goblin warlock know as the Storm Caller. We need you to organize an expedition to recover these scales before the goblins use their newfound power against us. Be careful, for the Storm Caller lair is high on the peaks about Stillmoon, and it is rumoured he has rudimentary control of the weather itself.");
   quest::say("Bring me the Storm Dagon Scales and I shall reward you.");
   }
 }
sub EVENT_ITEM {
   if (plugin::check_handin(\%itemcount, 49017 => 1)) { ##Animated Statue Plans##
   quest::say("Very nice work. We hope the reward was worth the effort. The Dark Reign thanks you Now go away.");
   quest::exp(10000000);
   quest::ding();
   quest::givecash(0,0,0,50);
   }
   elsif (plugin::check_handin(\%itemcount, 36214 => 1)) { ##Temple Plans##
   quest::say("Good job worm. We hope the reward was worth the effort. The Dark Reign thanks you Now go away.");
   quest::exp(10000000);
   quest::ding();
   quest::givecash(0,0,0,50);
   }
   elsif (plugin::check_handin(\%itemcount, 49019 =>4)) { ##Vial of Infected Puma Blood##
   quest::say("These are exactly what we needed. Thank you worm now go away I am busy!");
   quest::ding();
   quest::exp(10000000);
   quest::givecash(0,0,0,50);
   }
   elsif (plugin::check_handin(\%itemcount, 49018 => 1)) { ##Book of Knowledge##
   quest::say("Ah! The book we want! Now to decipher it and be able to use it against our enemies!");
   quest::ding();
   quest::exp(10000000);
   quest::givecash(0,0,0,50);
   }
   elsif (plugin::check_handin(\%itemcount, 120151 => 1)) { ##Lair Mistress Venom Sack##
   quest::ding();
   quest::exp(25000000);
   quest::say("Ashame something so beautiful and full of Evil as the Lair Mistress had to die, no matter with this we can make a new poison. Good job $name.");
   quest::givecash(0,0,0,60);
   }
   elsif (plugin::check_handin(\%itemcount, 49035 => 1)) { ##Storm Dragon Scales##
   quest::ding();
   quest::exp(25000000);
   quest::say("Well done $name, You have turned the favor of power back into our hands at least for now.");
   quest::givecash(0,0,0,60);
   }
       else {
    plugin::return_items(\%itemcount);
    quest::say("I have no use for this.");
   }
 }