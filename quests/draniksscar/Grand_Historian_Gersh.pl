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
if($text=~/knowledge/i && defined $qglobals{"EpicBox"} == 1) {
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


