#Dark_Scholar_Darkpetal_D'Monic NPC ID 337282#
sub EVENT_SAY {
my $detail = quest::saylink("detail", 1);
my $help = quest::saylink("help", 1);
my $undead = quest::saylink("undead", 1);
my $goblins = quest::saylink("goblins", 1);
my $spiderlings = quest::saylink("spiderlings", 1);
   if ($ulevel <= 40 && $text=~/Hail/i){
   quest::say("I am sorry but I have nothing that someone of your experiance could possibly handle. Please check with the others in the camp, I am sure they have work that you can do to help the Dark Reign.");
   }
   if ($ulevel <= 50 && $ulevel >= 41 && $text=~/Hail/i){
   quest::say("Good they sent out reinforcements to help me finish this $detail.");
   }
   if ($ulevel <= 50 && $ulevel >= 41 && $text=~/detail/i){
   quest::say("You came to help and you don't even know what you are here for? Well I guess you will have to do. I am here helping the city of Neriak by making sure the creatures of the Broodlands do not make any attempt to move into the Nektulos Forest. It has been somewhat of a struggle but we have managed. Would you be willing to $help us?");
   }
   if ($ulevel <= 50 && $ulevel >= 41 && $text=~/help/i){
   quest::say("'There are a few different creatures that I need help with. Would you like to help with the $undead, $goblins or Swamp $spiderlings?"); 
   }
   if ($ulevel <= 50 && $ulevel >= 41 && $text=~/undead/i){
   quest::say("There is a camp of undead creatures close to the entrance, I fear they are planning to invade lavastorm shortly. You must stop them. Bring me four of thier leg bones as proof of thier short commings and I shall reward you. If they cant walk then they cant invade us.");
   }
   if ($ulevel <= 50 && $ulevel >= 41 && $text=~/goblins/i){
   quest::say("Most of the goblins in Broodlands dont seem to mind strangers and have no interest in leaving thier home, but there is a group that is aggressive to anyone who should happen to cross thier path. These are the ones we are worried about. you must seek out and destoy members of Greenfoot clan, hopefully when you have thinned them out some they will think twice before planning another invasion. Bring to me four of thier warbeads as proof that you have done what I asked and you shall be rewarded.");
   }
   if ($ulevel <= 50 && $ulevel >= 41 && $text=~/spiderlings/i){
   quest::say("To the far west in the jungle area there are swamp spiderlings. While small right now, as they grow the poison they carry increases in its ability to cause death. Bring me four poison sacs from these spiderlings. While they seem too be no threat as far as an invasion, The Dark Reign wants the sacs. Why? I do not know.");
   }
   if ($ulevel >= 51 && $text=~/Hail/i){
   quest::say("I am sorry but I have nothing that someone of your experiance could possibly handle. Please check with the others in the camp, I am sure they have work that you can do to help the Dark Reign.");
   }
 }
sub EVENT_ITEM {
if ($ulevel == 41 && plugin::check_handin(\%itemcount, 120175 => 4)) { 
   quest::say("Good work $name. Hopefully that will slow the invasion.");
   quest::exp(639370);
   quest::ding();
   quest::givecash(0,0,0,40);
   }
   elsif ($ulevel == 42 && plugin::check_handin(\%itemcount, 120175 => 4)) { 
   quest::say("Good work $name. Hopefully that will slow the invasion.");
   quest::exp(671710);
   quest::ding();
   quest::givecash(0,0,0,40);
   }
   elsif ($ulevel == 43 && plugin::check_handin(\%itemcount, 120175 => 4)) { 
   quest::say("Good work $name. Hopefully that will slow the invasion.");
   quest::exp(704470);
   quest::ding();
   quest::givecash(0,0,0,40);
   }
   elsif ($ulevel == 44 && plugin::check_handin(\%itemcount, 120175 => 4)) { 
   quest::say("Good work $name. Hopefully that will slow the invasion.");
   quest::exp(738010);
   quest::ding();
   quest::givecash(0,0,0,40);
   }
   elsif ($ulevel == 45 && plugin::check_handin(\%itemcount, 120175 => 4)) { 
   quest::say("Good work $name. Hopefully that will slow the invasion.");
   quest::exp(1629580);
   quest::ding();
   quest::givecash(0,0,0,40);
   }
   elsif ($ulevel == 46 && plugin::check_handin(\%itemcount, 120175 => 4)) { 
   quest::say("Good work $name. Hopefully that will slow the invasion.");
   quest::exp(869540);
   quest::ding();
   quest::givecash(0,0,0,40);
   }
   elsif ($ulevel == 47 && plugin::check_handin(\%itemcount, 120175 => 4)) { 
   quest::say("Good work $name. Hopefully that will slow the invasion.");
   quest::exp(908180);
   quest::ding();
   quest::givecash(0,0,0,40);
   }
   elsif ($ulevel == 48 && plugin::check_handin(\%itemcount, 120175 => 4)) { 
   quest::say("Good work $name. Hopefully that will slow the invasion.");
   quest::exp(947660);
   quest::ding();
   quest::givecash(0,0,0,40);
   }
   elsif ($ulevel == 49 && plugin::check_handin(\%itemcount, 120175 => 4)) { 
   quest::say("Good work $name. Hopefully that will slow the invasion.");
   quest::exp(987980);
   quest::ding();
   quest::givecash(0,0,0,40);
   }
   elsif ($ulevel == 50 && plugin::check_handin(\%itemcount, 120175 => 4)) { 
   quest::say("Good work $name. Hopefully that will slow the invasion.");
   quest::exp(1029140);
   quest::ding();
   quest::givecash(0,0,0,40);
   }
elsif ($ulevel == 41 && plugin::check_handin(\%itemcount, 120174 => 4)) { 
   quest::say("Good work $name. Hopefully that will slow the invasion.");
   quest::exp(639370);
   quest::ding();
   quest::givecash(0,0,0,40);
   }
   elsif ($ulevel == 42 && plugin::check_handin(\%itemcount, 120174 => 4)) { 
   quest::say("Good work $name. Hopefully that will slow the invasion.");
   quest::exp(671710);
   quest::ding();
   quest::givecash(0,0,0,40);
   }
   elsif ($ulevel == 43 && plugin::check_handin(\%itemcount, 120174 => 4)) { 
   quest::say("Good work $name. Hopefully that will slow the invasion.");
   quest::exp(704740);
   quest::ding();
   quest::givecash(0,0,0,40);
   }
   elsif ($ulevel == 44 && plugin::check_handin(\%itemcount, 120174 => 4)) { 
   quest::say("Good work $name. Hopefully that will slow the invasion.");
   quest::exp(738010);
   quest::ding();
   quest::givecash(0,0,0,40);
   }
   elsif ($ulevel == 45 && plugin::check_handin(\%itemcount, 120174 => 4)) { 
   quest::say("Good work $name. Hopefully that will slow the invasion.");
   quest::exp(1629580);
   quest::ding();
   quest::givecash(0,0,0,40);
   }
   elsif ($ulevel == 46 && plugin::check_handin(\%itemcount, 120174 => 4)) { 
   quest::say("Good work $name. Hopefully that will slow the invasion.");
   quest::exp(869540);
   quest::ding();
   quest::givecash(0,0,0,40);
   }
   elsif ($ulevel == 47 && plugin::check_handin(\%itemcount, 120174 => 4)) { 
   quest::say("Good work $name. Hopefully that will slow the invasion.");
   quest::exp(908180);
   quest::ding();
   quest::givecash(0,0,0,40);
   }
   elsif ($ulevel == 48 && plugin::check_handin(\%itemcount, 120174 => 4)) { 
   quest::say("Good work $name. Hopefully that will slow the invasion.");
   quest::exp(947660);
   quest::ding();
   quest::givecash(0,0,0,40);
   }
   elsif ($ulevel == 49 && plugin::check_handin(\%itemcount, 120174 => 4)) { 
   quest::say("Good work $name. Hopefully that will slow the invasion.");
   quest::exp(987980);
   quest::ding();
   quest::givecash(0,0,0,40);
   }
   elsif ($ulevel == 50 && plugin::check_handin(\%itemcount, 120174 => 4)) { 
   quest::say("Good work $name. Hopefully that will slow the invasion.");
   quest::exp(1029140);
   quest::ding();
   quest::givecash(0,0,0,40);
   }   
elsif ($ulevel == 41 && plugin::check_handin(\%itemcount, 55210 => 4)) { 
   quest::say("I will deliver these to the Dark Reign for you, Here is your cut.");
   quest::exp(639370);
   quest::ding();
   quest::givecash(0,0,0,40);
   }
   elsif ($ulevel == 42 && plugin::check_handin(\%itemcount, 55210 => 4)) { 
   quest::say("I will deliver these to the Dark Reign for you, Here is your cut.");
   quest::exp(671710);
   quest::ding();
   quest::givecash(0,0,0,40);
   }
   elsif ($ulevel == 43 && plugin::check_handin(\%itemcount, 55210 => 4)) { 
   quest::say("I will deliver these to the Dark Reign for you, Here is your cut.");
   quest::exp(704470);
   quest::ding();
   quest::givecash(0,0,0,40);
   }
   elsif ($ulevel == 44 && plugin::check_handin(\%itemcount, 55210 => 4)) { 
   quest::say("I will deliver these to the Dark Reign for you, Here is your cut.");
   quest::exp(738010);
   quest::ding();
   quest::givecash(0,0,0,40);
   }
   elsif ($ulevel == 45 && plugin::check_handin(\%itemcount, 55210 => 4)) { 
   quest::say("I will deliver these to the Dark Reign for you, Here is your cut.");
   quest::exp(1629580);
   quest::ding();
   quest::givecash(0,0,0,40);
   }
   elsif ($ulevel == 46 && plugin::check_handin(\%itemcount, 55210 => 4)) { 
   quest::say("I will deliver these to the Dark Reign for you, Here is your cut.");
   quest::exp(969540);
   quest::ding();
   quest::givecash(0,0,0,40);
   }
   elsif ($ulevel == 47 && plugin::check_handin(\%itemcount, 55210 => 4)) { 
   quest::say("I will deliver these to the Dark Reign for you, Here is your cut.");
   quest::exp(908180);
   quest::ding();
   quest::givecash(0,0,0,40);
   }
   elsif ($ulevel == 48 && plugin::check_handin(\%itemcount, 55210 => 4)) { 
   quest::say("I will deliver these to the Dark Reign for you, Here is your cut.");
   quest::exp(947660);
   quest::ding();
   quest::givecash(0,0,0,40);
   }
   elsif ($ulevel == 49 && plugin::check_handin(\%itemcount, 55210 => 4)) { 
   quest::say("I will deliver these to the Dark Reign for you, Here is your cut.");
   quest::exp(987980);
   quest::ding();
   quest::givecash(0,0,0,40);
   }
   elsif ($ulevel == 50 && plugin::check_handin(\%itemcount, 55210 => 4)) { 
   quest::say("I will deliver these to the Dark Reign for you, Here is your cut.");
   quest::exp(1029140);
   quest::ding();
   quest::givecash(0,0,0,40);
   }
       else {
    plugin::return_items(\%itemcount);
    quest::say("I have no use for this.");
   }
 }