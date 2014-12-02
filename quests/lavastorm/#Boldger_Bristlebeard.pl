sub EVENT_SAY {
my $help = quest::saylink("help", 1);
my $Greed = quest::saylink("Greed", 1);
my $Diving = quest::saylink("Diving", 1);
my $Elixier = quest::saylink("Elixier", 1);
my $Grounding = quest::saylink("Grounding", 1);
my $Infested = quest::saylink("Infested", 1);
my $Hunting = quest::saylink("Hunting", 1);
my $Local = quest::saylink("Local", 1);
my $Drake = quest::saylink("Drake", 1);
   if ($ulevel <= 20 && $text=~/Hail/i){
   quest::say("I am sorry but I have nothing that someone of your experiance could possibly handle. Please check with the others in the camp, I am sure they have work that you can do to help the Norrath Keepers.");
   }
   if ($ulevel <= 30 && $ulevel >= 21 && $text=~/Hail/i){
   quest::say("My orders finally came through! I have a few things that you may be able to $help me with.");
   }
   if ($ulevel <= 30 && $ulevel >= 21 && $text=~/help/i){
   quest::say("Let me see. there is A Halflings $Greed,, $Diving for Lava Rocks, Forbin's $Elixier, $Grounding the Drakes, $Infested, Lavaspinner $Hunting, Lavaspinners $Local or The $Drake Menace.");
   }
   if ($ulevel <= 30 && $ulevel >= 21 && $text=~/Greed/i) {
   quest::say("We have a new recruit, a mischievous little Halfling, that seems to have disappeared with some of our documents and a map – a very important map. He was last seen heading into the Lavaspinner's Lair days ago and we haven’t seen or heard from him since. While we don’t want to be suspicious of his intentions, we did notice he was a rather enterprising sort. We need those documents back and we can only hope he still has them. Please find him."); 
   quest::say ("Return to me with the map and I shall reward you.");
   }
   if ($ulevel <= 30 && $ulevel >= 21 && $text=~/Diving/i){
   quest::say("We suspect that the dragon residing in the delve may share some sort of life force with the lava in the volcano and we are very interested in the source of this power. Venture into the dragon's lair and slay his followers. Bring back four calcified lava rocks from the depths of the churning magma and you will be rewarded. Good luck, my friend and may Tunare speed you back!");
   }
   if ($ulevel <= 30 && $ulevel >= 21 && $text=~/Elixier/i){
   quest::say("One of our trusted researchers has come under attack by magma spiders within Lavaspinner's Lair and is in need of help. If you could aid him we would greatly appreciate it.");
   quest::say("Forbin has sent word that he is in need of a poison sac to complete his elixer, Locate him and give him a poison sac, return to me with anything he may give you.");
   }
   if ($ulevel <= 30 && $ulevel >= 21 && $text=~/Grounding/i){
   quest::say("Due to their constant proximity to lava, the fangs of the drakes in the Lavaspinner's Lair have developed special properties to cut through objects. If their fangs could be studied, we could make use of those special properties in a variety of ways. Go to the lair and collect as many of their fangs as you can for study.");
   quest::say("Take this box and fill it with drake fangs,combine them and return the finished item to me for your reward.");
   quest::summonitem(17148); 
   }
   if ($ulevel <= 30 && $ulevel >= 21 && $text=~/Infested/i){
   quest::say("There have been some lavarachnids troubling our agents in the Lavaspinner's Lair. Have caution when moving through the lair. We have found at least two different types of the Lavaspinners. Eliminate all of the ones you can find so we can move through unhindered.");
   quest::say("These are not the normal Lavaspinners, although killing them is not a bad idea, these mobs are aggressive. Bring me two fangs from each of them and you will be rewarded.");
   }
   if ($ulevel <= 30 && $ulevel >= 21 && $text=~/Hunting/i){
   quest::say("We have received word that the Lavaspinner eggs possess magical powers that we can't allow to fall in the hands of the wrong person. We need someone to scout the lair and recover a few samples of their eggs. If you choose to accept this mission you will need to strike the lair fast and deadly. If the Lavaspinner queen is alerted you will certainly die.");
   quest::say("We have an acquaintance deep within the Lair who may have further information for you.");
   quest::say("Return to me with 3 Cracked Lavaspinner Eggs and 1 Pristine Lavaspinner Egg so that we may study these eggs closer.");
   }
   if ($ulevel <= 30 && $ulevel >= 21 && $text=~/Local/i){
   quest::say("Our research shows that the inhabitants of Lavaspiner's Lair developed a natural defense to the heat of the area. We need you to bring back a few specimens so we can experiment with them. Bring back some ionized ore, drake scales, and magma carapaces.");
   }
   if ($ulevel <= 30 && $ulevel >= 21 && $text=~/Drake/i){
   quest::say("There has been news of the drakes of Lavaspinner's Lair growing in ranks. They have already started hunting near our encampment and have injured several of our agents. Please travel deep within their lair and decrease their numbers.");
   quest::say("Bring to me a Drake Eggshell Fragment and the heart of the Matriarch as proof."); 
   }
   if ($ulevel <= 40 && $ulevel >= 31 && $text=~/Hail/i){
   quest::say("Amaro is in dire need of your assistance. He has gone and gotten himself captured by goblins. Our scouts tell us the keys for his shackles are sealed in chests in Tirranun's Delve. Make your way there and bring him the three keys he needs to free himself."); 
   }
   if ($ulevel >= 41 && $text=~/Hail/i){
   quest::say("I am sorry but everything I have would be trivial to someone of your experiance. Please check with the others in the camp, I am sure they have work that you can do to help the Norrath Keepers.");
   }
 }  
sub EVENT_ITEM {
   if (plugin::check_handin(\%itemcount, 120152 => 1)) {  
    quest::say("So, Greed got the better of him eh? Lets hope he has learned his lesson.");
    quest::ding();
	quest::exp(5000000);
    quest::givecash(0,0,0,30);	
   }
   elsif (plugin::check_handin(\%itemcount, 56023 => 4)) {
   quest::say("Not as easy as I made it sound eh? Oh well if everyone could do it there would not be any challenge.");
   quest::ding();
   quest::exp(5000000);
   quest::givecash(0,0,0,30);
   }   
   elsif (plugin::check_handin(\%itemcount, 120179 => 1)) { 
   quest::say("Back already? These fangs will do nicely,  the Norrath Keepers use them to make thier blades even more deadly. Here is your cut.");
   quest::ding();
   quest::exp(5000000);
   quest::givecash(0,0,0,30);
   }
   elsif (plugin::check_handin(\%itemcount, 120184 => 1)) {
   quest::say("");
   quest::ding();
   quest::exp(5000000);
   quest::givecash(0,0,0,30);
   }
   elsif (plugin::check_handin(\%itemcount, 120180 => 2, 120181 => 2)) {   
   quest::say("With the pests dead we can resume our activities in Lavaspinner's lair. We shall call upon you again should any further infestations be found.");
   quest::ding();
   quest::exp(5000000);
   quest::givecash(0,0,0,30);
   }
   elsif (plugin::check_handin(\%itemcount, 85012 => 3, 85013 => 1)) {   
   quest::say("The egg sacks have been collected! Thank you for your efforts to further our research, you may have saved the lives of many people.");
   quest::ding();
   quest::exp(5000000);
   quest::givecash(0,0,0,30);
   }
   elsif (plugin::check_handin(\%itemcount, 48141 => 1, 48140 => 1, 48142 => 1)) {  
   quest::say("Good work $name. I will deliver these to the alchemist myself. Here is your part of the reward.");
   quest::ding();
   quest::exp(5000000);
   quest::givecash(0,0,0,30);
   }
   elsif (plugin::check_handin(\%itemcount, 120182 => 1, 120183 => 1)) {  
   quest::say("Well done $name. That should slow down the invaision. Here is you half of the reward.");
   quest::ding();
   quest::exp(5000000);
   quest::givecash(0,0,0,30);
   }
       else {
    plugin::return_items(\%itemcount);
    quest::say("I have no use for this.");
   }
 }	