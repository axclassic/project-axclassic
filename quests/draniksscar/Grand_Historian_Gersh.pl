sub EVENT_SAY {
my $knowledge = quest::saylink("knowledge", 1);
my $passing = quest::saylink("passing", 1);
my $caves = quest::saylink("caves", 1);
my $others = quest::saylink("others", 1);
my $access = quest::saylink("access", 1);
my $worthy = quest::saylink("worthy", 1);
my $back = quest::saylink("back", 1);
my $Trials = quest::saylink("Trials", 1);
my $Learning = quest::saylink("Learning", 1);
my $Mastery = quest::saylink("Mastery", 1);
if($text=~/Hail/i){
quest::say("Greetings traveler, are you here seeking $knowledge? or just $passing through?");
}
if($text=~/knowledge/i) {
 plugin::check_hasitem($client, 62863); ## Druid Epic 1.5 ##
    plugin::check_hasitem($client, 62880); ## Druid Epic 2.0 ##
    plugin::check_hasitem($client, 119466); ## Druid Epic 2.5 ##
    plugin::check_hasitem($client, 119483); ## Druid Epic 3.0 ##
        plugin::check_hasitem($client, 9955); ## Cleric Epic 1.5 ##
        plugin::check_hasitem($client, 20076); ## Cleric Epic 2.0 ##
        plugin::check_hasitem($client, 119476); ## Cleric Epic 2.5 ##
        plugin::check_hasitem($client, 119484); ## Cleric Epic 3.0 ##
            plugin::check_hasitem($client, 50003); ## Shadowknight Epic 1.5 ##
            plugin::check_hasitem($client, 48136); ## Shadowknight Epic 2.0 ##
            plugin::check_hasitem($client, 119469); ## Shadowknight Epic 2.5 ##
            plugin::check_hasitem($client, 119485); ## Shadowknight Epic 3.0 ##
                plugin::check_hasitem($client, 57400); ## Shaman Epic 1.5 ##
                plugin::check_hasitem($client, 57405); ## Shaman Epic 2.0 ##
                plugin::check_hasitem($client, 119470); ## Shaman Epic 2.5 ##
                plugin::check_hasitem($client, 119486); ## Shaman Epic 3.0 ##
                    plugin::check_hasitem($client, 12665); ## Wizard Epic 1.5 ##
                    plugin::check_hasitem($client, 16576); ## Wizard Epic 2.0 ##
                    plugin::check_hasitem($client, 119471); ## Wizard Epic 2.5 ##
                    plugin::check_hasitem($client, 119487); ## Wizard Epic 3.0 ##
                        plugin::check_hasitem($client, 19092); ## Magician Epic 1.5 ##
                        plugin::check_hasitem($client, 19839); ## Magician Epic 2.0 ##
                        plugin::check_hasitem($client, 119472); ## Magician Epic 2.5 ##
                        plugin::check_hasitem($client, 119488); ## Magician Epic 3.0 ##
                            plugin::check_hasitem($client, 52952); ## Enchanter Epic 1.5 ##
                            plugin::check_hasitem($client, 52962); ## Enchanter Epic 2.0 ##
                            plugin::check_hasitem($client, 119473); ## Enchanter Epic 2.5 ##
                            plugin::check_hasitem($client, 119489); ## Enchanter Epic 3.0 ##
                                plugin::check_hasitem($client, 62581); ## Necromancer Epic 1.5 ##
                                plugin::check_hasitem($client, 64067); ## Necromancer Epic 2.0 ##
                                plugin::check_hasitem($client, 119474); ## Necromancer Epic 2.5 ##
                                plugin::check_hasitem($client, 119490); ## Necromancer Epic 3.0 ##
                                    plugin::check_hasitem($client, 60321); ## Warrior Epic 1.5 ##
                                    plugin::check_hasitem($client, 60332); ## Warrior Epic 2.0 ##
                                    plugin::check_hasitem($client, 119475); ## Warrior Epic 2.5 ##
                                    plugin::check_hasitem($client, 119491); ## Warrior Epic 3.0 ##
                                        plugin::check_hasitem($client, 52347); ## Rogue Epic 1.5 ##
                                        plugin::check_hasitem($client, 52348); ## Rogue Epic 2.0 ##
                                        plugin::check_hasitem($client, 119476); ## Rogue Epic 2.5 ##
                                        plugin::check_hasitem($client, 119492); ## Rogue Epic 3.0 ##
                                            plugin::check_hasitem($client, 61025); ## Monk Epic 1.5 ##
                                            plugin::check_hasitem($client, 67742); ## Monk Epic 2.0 ##
                                            plugin::check_hasitem($client, 119477); ## Monk Epic 2.5 ##
                                            plugin::check_hasitem($client, 119493); ## Monk Epic 3.0 ##
                                                plugin::check_hasitem($client, 52911); ## Neastlord Epic 1.5 ##
                                                plugin::check_hasitem($client, 57054); ## Beastlord Epic 2.0 ##
                                                plugin::check_hasitem($client, 119478); ## Beastlord Epic 2.5 ##
                                                plugin::check_hasitem($client, 119494); ## Beastlord Epic 3.0 ##
                                                    plugin::check_hasitem($client, 77631); ## Bard Epic 1.5 ##
                                                    plugin::check_hasitem($client, 77640); ## Bard Epic 2.0 ##
                                                    plugin::check_hasitem($client, 119479); ## Bard Epic 2.5 ##
                                                    plugin::check_hasitem($client, 119495); ## Batd Epic 3.0 ##
                                                        plugin::check_hasitem($client, 64031); ## Paladin Epic 1.5 ##
                                                        plugin::check_hasitem($client, 48147); ## Paladin Epic 2.0 ##
                                                        plugin::check_hasitem($client, 119480); ## Paladin Epic 2.5 ##
                                                        plugin::check_hasitem($client, 119496); ## Paladin Epic 3.0 ##
                                                            plugin::check_hasitem($client, 18398); ## Berserker Epic 1.5 ##
                                                            plugin::check_hasitem($client, 18609); ## Berserker Epic 2.0 ##
                                                            plugin::check_hasitem($client, 119481); ## Berserker Epic 2.5 ##
                                                            plugin::check_hasitem($client, 119497); ## Berserker Epic 3.0 ##
                                                                plugin::check_hasitem($client, 62627); ## Ranger Epic 1.5 ##
                                                                plugin::check_hasitem($client, 62649); ## Ranger Epic 2.0 ##
                                                                plugin::check_hasitem($client, 119482); ## Ranger Epic 2.5 ##
                                                                plugin::check_hasitem($client, 119498); ## Ranger Epic 3.0 ##
		quest::setglobal("EpicOne", 1, 5, "F");	
quest::say("I am Grand Historian Gersh and I can open your mind to the history of our people if you wish. I can show you the remnants of our $caves where we hid from the raiding Muramite Army.");
 }
if($text=~/passing/i) {
quest::say("Be Gone from this place! You have not reached sufficient skill to even attempt what I could show you.");
 } 
 if ($text=~/Hail/i && defined $qglobals{"DraniksAdead"} == 1){  
  quest::say("Alas the monsters within have proven to be your undoing. I shall send you back to the Cave of Trials and your lessons can continue.");
  quest::delglobal("DraniksAdead");
  quest::setglobal("EpicTwo", 1, 5, "F"); 
  quest::movepc(318,0.0,0.0,-11.1); # dranikhollowsa
 }
 if ($text=~/Hail/i && defined $qglobals{"DraniksBdead"} == 1){  
  quest::say("Alas the monsters within have proven to be your undoing. I shall send you back to the Cave of Learning and your lessons can continue.");
  quest::delglobal("DraniksBdead");
  quest::setglobal("EpicThree", 1, 5, "F"); 
  quest::movepc(319,0.0,-447.0,-36.0); # dranikhollowsb
 }
 if ($text=~/Hail/i && defined $qglobals{"DraniksCdead"} == 1){  
  quest::say("Alas the monsters within have proven to be your undoing. I shall send you back to the Cave of Mastery and your lessons can continue.");
  quest::delglobal("DraniksCdead");
  quest::setglobal("EpicFour", 1, 5, "F"); 
  quest::movepc(320,5.0,-51.0,-44.6); # dranikhollowsc
 }
 if($text=~/caves/i && defined $qglobals{"EpicOne"} == 1 && $ulevel >= 50) {
 quest::say("There are several caves in the area, some we used to hide in, this is true but there are $others also.");
 }
 if($text=~/others/i && defined $qglobals{"EpicOne"} == 1 && $ulevel >= 50) {
 quest::say("Special caves where only the best of the best are given $access.");
 }
 if($text=~/access/i && defined $qglobals{"EpicOne"} == 1 && $ulevel >= 50) {
 quest::say("Only those who have proven themselves $worthy may enter these special caves.");
 quest::delglobal("EpicOne");
quest::setglobal("Passed", 1, 5, "F");	
 }
 if($text=~/worthy/i && defined $qglobals{"Passed"} == 1 && $ulevel >= 50) {
 quest::say("You $name have passed the worthiness test. You shall be granted access to the special caves.");
 quest::say("Depending on how many seasons you have under your belt, I can send you to the Cave of $Trials, the Cave of $Learning or the Cave of $Mastery.");
 quest::delglobal("Passed");
quest::setglobal("EpicChoice", 1, 5, "F");	
 }
 if($text=~/Trials/i && defined $qglobals{"EpicChoice"} == 1 && $ulevel <= 55  && $ulevel >= 50) {  
quest::say("As you wish my friend you may enter the Cave of Trials."); 
quest::say("If you should happen to meet with an untimely death, I can assist you and return you to the cave where your body is.");
quest::delglobal("EpicChoice");
quest::setglobal("EpicTwo", 1, 5, "F");	
quest::movepc(318,0.0,0.0,-11.1); # dranikhollowsa
} 
if($text=~/Learning/i && defined $qglobals{"EpicChoice"} == 1 && $ulevel <= 59  && $ulevel >= 56){ 
quest::say("As you wish my friend you may enter the Cave of Learning.");  
quest::say("If you should happen to meet with an untimely death, I can assist you and return you to the cave where your body is.");
quest::delglobal("EpicChoice");
quest::setglobal("EpicThree", 1, 5, "F");	
quest::movepc(319,0.0,-447.0,-36.0);  #dranikhollowsb
}
if($text=~/Mastery/i && defined $qglobals{"EpicChoice"} == 1 && $ulevel >= 60){
quest::say("Well done my friend you may enter the Cave of Mastery.");
quest::say("If you should happen to meet with an untimely death, I can assist you and return you to the cave where your body is.");
quest::delglobal("EpicChoice");
quest::setglobal("EpicFour", 1, 5, "F");	  
quest::movepc(320,5.0,-51.0,-44.6); #dranikhollowsc 
}
}


