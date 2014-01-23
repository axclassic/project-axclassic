sub EVENT_SAY {
my $caves = quest::saylink("caves", 1);
my $others = quest::saylink("others", 1);
my $access = quest::saylink("access", 1);
my $worthy = quest::saylink("worthy", 1);
my $return = quest::saylink("return", 1);
my $back = quest::saylink("back", 1);
my $trials = quest::saylink("trials", 1);
my $learning = quest::saylink("learning", 1);
my $mastery = quest::saylink("mastery", 1);

if($text=~/Hail/i) {
quest::say("Greetings, traveler. I am Grand Historian Gersh and I can open your mind to the history of our people if you wish. I can show you the remnants of our $caves where we hid from the raiding Muramite Army.");
 }
 if($text=~/caves/i) {
 quest::say("There are several caves in the area, some we used to hide, this is true but there are $others also.");
 }
 if($text=~/others/i) {
 quest::say("Special caves where only the best of the best are given $access.");
 }
 if($text=~/access/i) {
 quest::say("Only those who have proven themselves $worthy may enter these special caves.");
 }
 if($text=~/worthy/i) {
 quest::say("If you allow me to examine the item that makes you think you are worthy to enter these holy places, I can send you to them.");
 quest::say("If you  should happen to meet with an untimely death, I can assist you and $return you to the cave where your body is.");
}
if ($text=~/return/i) {
quest::say("Would you like to go $back?");
}
if ($text=~/back/i && $faction < 5 && $ulevel <= 54 && $ulevel >= 50){
quest::say("Well done my friend you may enter the first Cave of Trials."); 
quest::movepc(318,0.0,0.0,-11.1); # dranikhollowsa
}
if ($text=~/back/i && $faction < 5 && $ulevel == 49){  
quest::say("Alas the monsters within have proven to be your undoing. I shall send you back to the Cave of Trials and your lessons can continue."); 
quest::movepc(318,0.0,0.0,-11.1); # dranikhollowsa
}
if ($text=~/back/i && $faction < 5 && $ulevel <= 59 && $ulevel >= 56){  
quest::say("Well done my friend you may enter the Cave of Learning."); 
quest::movepc(319,0.0,-447.0,-36.0);  #dranikhollowsb
}
if ($text=~/back/i && $faction < 5 && $ulevel == 55){  
quest::say("Your demise seems to have placed you within two areas would you like to go to $trials or $learning"); 
} 
if ($text=~/back/i && $faction < 5 && $ulevel >= 61){  
quest::say("Well done my friend you may enter the Cave of Mastery."); 
quest::movepc(320,5.0,-51.0,-44.6); #dranikhollowsc 
}
if ($text=~/back/i && $faction < 5 && $ulevel == 60){  
quest::say("Your demise seems to have placed you within two areas would you like to go to $learning or $mastery"); 
}
if ($text=~/trials/i && $faction < 5) {  
quest::say("As you wish my friend you may enter the Cave of Trials."); 
quest::movepc(318,0.0,0.0,-11.1); # dranikhollowsa
} 
if($text=~/learning/i && $faction < 5){ 
quest::say("As you wish my friend you may enter the Cave of Learning.");  
quest::movepc(319,0.0,-447.0,-36.0);  #dranikhollowsb
}
if($text=~/mastery/i && $faction < 5){
quest::say("Well done my friend you may enter the Cave of Mastery.");  
quest::movepc(320,5.0,-51.0,-44.6); #dranikhollowsc 
}
}
sub EVENT_ITEM {
if($ulevel >= 50 && $ulevel <= 55 && plugin::check_handin(\%itemcount, 52347 => 1)) { ##Fatestealer 1.5 Epic
quest::say("Well done my friend you may enter the first Cave of Trials."); 
quest::faction(2769,120);
quest::summonitem(52347);  #returns Epic
quest::movepc(318,0.0,0.0,-11.1); # dranikhollowsa
} 
elsif($ulevel >= 56 && $ulevel <= 60 && plugin::check_handin(\%itemcount, 52347 => 1)){ ##Fatestealer 1.5 Epic
quest::say("Well done my friend you may enter the second Cave of Learning."); 
quest::faction(2769,120);
quest::summonitem(52347); #returns Epic 
quest::movepc(319,0.0,-447.0,-36.0);  #dranikhollowsb
} 
elsif($ulevel >= 61 && plugin::check_handin(\%itemcount, 52347 => 1)){ ##Fatestealer 1.5 Epic
quest::say("Well done my friend you may enter the final Cave of Mastery."); 
quest::faction(2769,120);
quest::summonitem(52347); #returns Epic 
quest::movepc(320,5.0,-51.0,-44.6); #dranikhollowsc 
}
elsif($ulevel >= 50 && $ulevel <= 55 && plugin::check_handin(\%itemcount, 52348 => 1)) { #Nightshade, Blade of entropy 2.0 Epic
quest::say("Well done my friend you may enter the first Cave of Trials."); 
quest::faction(2769,120);
quest::summonitem(52348);  #returns Epic
quest::movepc(318,0.0,0.0,-11.1); # dranikhollowsa
} 
elsif($ulevel >= 56 && $ulevel <= 60 && plugin::check_handin(\%itemcount, 52348 => 1)){ #Nightshade, Blade of entropy 2.0 Epic
quest::say("Well done my friend you may enter the second Cave of Learning."); 
quest::faction(2769,120);
quest::summonitem(52348); #returns Epic 
quest::movepc(319,0.0,-447.0,-36.0);  #dranikhollowsb
} 
elsif($ulevel >= 61 && plugin::check_handin(\%itemcount, 52348 => 1)){ #Nightshade, Blade of entropy 2.0 Epic
quest::say("Well done my friend you may enter the final Cave of Mastery."); 
quest::faction(2769,120);
quest::summonitem(52348); #returns Epic 
quest::movepc(320,5.0,-51.0,-44.6); #dranikhollowsc 
}
elsif($ulevel >= 50 && $ulevel <= 55 && plugin::check_handin(\%itemcount, 119476 => 1)) { #Nightshade, Blade of entropy 2.5 Epic
quest::say("Well done my friend you may enter the first Cave of Trials."); 
quest::faction(2769,120);
quest::summonitem(119476);  #returns Epic
quest::movepc(318,0.0,0.0,-11.1); # dranikhollowsa
} 
elsif($ulevel >= 56 && $ulevel <= 60 && plugin::check_handin(\%itemcount, 119476 => 1)){ #Nightshade, Blade of entropy 2.5 Epic
quest::say("Well done my friend you may enter the second Cave of Learning."); 
quest::faction(2769,120);
quest::summonitem(119476); #returns Epic 
quest::movepc(319,0.0,-447.0,-36.0);  #dranikhollowsb
} 
elsif($ulevel >= 61 && plugin::check_handin(\%itemcount, 119476 => 1)){ #Nightshade, Blade of entropy 2.5 Epic
quest::say("Well done my friend you may enter the final Cave of Mastery."); 
quest::faction(2769,120);
quest::summonitem(119476); #returns Epic 
quest::movepc(320,5.0,-51.0,-44.6); #dranikhollowsc 
}
elsif($ulevel >= 50 && $ulevel <= 55 && plugin::check_handin(\%itemcount, 62627 => 1)) { #Heartwood Blade 1.5 Epic
quest::say("Well done my friend you may enter the first Cave of Trials."); 
quest::faction(2769,120);
quest::summonitem(62627);  #returns Epic
quest::movepc(318,0.0,0.0,-11.1); # dranikhollowsa
} 
elsif($ulevel >= 56 && $ulevel <= 60 && plugin::check_handin(\%itemcount, 62627 => 1)){ #Heartwood Blade 1.5 Epic
quest::say("Well done my friend you may enter the second Cave of Learning."); 
quest::faction(2769,120);
quest::summonitem(62627); #returns Epic 
quest::movepc(319,0.0,-447.0,-36.0);  #dranikhollowsb
} 
elsif($ulevel >= 61 && plugin::check_handin(\%itemcount, 62627 => 1)){ #Heartwood Blade 1.5 Epic
quest::say("Well done my friend you may enter the final Cave of Mastery."); 
quest::faction(2769,120);
quest::summonitem(62627); #returns Epic 
quest::movepc(320,5.0,-51.0,-44.6); #dranikhollowsc 
}
elsif($ulevel >= 50 && $ulevel <= 55 && plugin::check_handin(\%itemcount, 62649 => 1)) { #Aurora The Heartwood Blade 2.0 Epic
quest::say("Well done my friend you may enter the first Cave of Trials."); 
quest::faction(2769,120);
quest::summonitem(62649);  #returns Epic
quest::movepc(318,0.0,0.0,-11.1); # dranikhollowsa
} 
elsif($ulevel >= 56 && $ulevel <= 60 && plugin::check_handin(\%itemcount, 62649 => 1)){ #Aurora The Heartwood Blade 2.0 Epic
quest::say("Well done my friend you may enter the second Cave of Learning."); 
quest::faction(2769,120);
quest::summonitem(62649); #returns Epic 
quest::movepc(319,0.0,-447.0,-36.0);  #dranikhollowsb
} 
elsif($ulevel >= 61 && plugin::check_handin(\%itemcount, 62649 => 1)){ #Aurora The Heartwood Blade 2.0 Epic
quest::say("Well done my friend you may enter the final Cave of Mastery."); 
quest::faction(2769,120);
quest::summonitem(62649); #returns Epic 
quest::movepc(320,5.0,-51.0,-44.6); #dranikhollowsc 
}
elsif($ulevel >= 50 && $ulevel <= 55 && plugin::check_handin(\%itemcount, 119482 => 1)) { #Aurora The Heartwood Blade 2.5 Epic
quest::say("Well done my friend you may enter the first Cave of Trials."); 
quest::faction(2769,120);
quest::summonitem(119482);  #returns Epic
quest::movepc(318,0.0,0.0,-11.1); # dranikhollowsa
} 
elsif($ulevel >= 56 && $ulevel <= 60 && plugin::check_handin(\%itemcount, 119482 => 1)){ #Aurora The Heartwood Blade 2.5 Epic
quest::say("Well done my friend you may enter the second Cave of Learning."); 
quest::faction(2769,120);
quest::summonitem(119482); #returns Epic 
quest::movepc(319,0.0,-447.0,-36.0);  #dranikhollowsb
} 
elsif($ulevel >= 61 && plugin::check_handin(\%itemcount, 119482 => 1)){ #Aurora The Heartwood Blade 2.5 Epic
quest::say("Well done my friend you may enter the final Cave of Mastery."); 
quest::faction(2769,120);
quest::summonitem(119482); #returns Epic 
quest::movepc(320,5.0,-51.0,-44.6); #dranikhollowsc 
}
elsif($ulevel >= 50 && $ulevel <= 55 && plugin::check_handin(\%itemcount, 77631 => 1)) { #Prismatic Dragon Blade 1.5 Epic
quest::say("Well done my friend you may enter the first Cave of Trials."); 
quest::faction(2769,120);
quest::summonitem(77631);  #returns Epic
quest::movepc(318,0.0,0.0,-11.1); # dranikhollowsa
} 
elsif($ulevel >= 56 && $ulevel <= 60 && plugin::check_handin(\%itemcount, 77631 => 1)){ #Prismatic Dragon Blade 1.5 Epic
quest::say("Well done my friend you may enter the second Cave of Learning."); 
quest::faction(2769,120);
quest::summonitem(77631); #returns Epic 
quest::movepc(319,0.0,-447.0,-36.0);  #dranikhollowsb
} 
elsif($ulevel >= 61 && plugin::check_handin(\%itemcount, 77631 => 1)){ #Prismatic Dragon Blade 1.5 Epic
quest::say("Well done my friend you may enter the final Cave of Mastery."); 
quest::faction(2769,120);
quest::summonitem(77631); #returns Epic 
quest::movepc(320,5.0,-51.0,-44.6); #dranikhollowsc 
}
elsif($ulevel >= 50 && $ulevel <= 55 && plugin::check_handin(\%itemcount, 77640 => 1)) { #Blade of Vesagran 2.0 Epic
quest::say("Well done my friend you may enter the first Cave of Trials."); 
quest::faction(2769,120);
quest::summonitem(77640);  #returns Epic
quest::movepc(318,0.0,0.0,-11.1); # dranikhollowsa
} 
elsif($ulevel >= 56 && $ulevel <= 60 && plugin::check_handin(\%itemcount, 77640 => 1)){ #Blade of Vesagran 2.0 Epic
quest::say("Well done my friend you may enter the second Cave of Learning."); 
quest::faction(2769,120);
quest::summonitem(77640); #returns Epic 
quest::movepc(319,0.0,-447.0,-36.0);  #dranikhollowsb
} 
elsif($ulevel >= 61 && plugin::check_handin(\%itemcount, 77640 => 1)){ #Blade of Vesagran 2.0 Epic
quest::say("Well done my friend you may enter the final Cave of Mastery."); 
quest::faction(2769,120);
quest::summonitem(77640); #returns Epic 
quest::movepc(320,5.0,-51.0,-44.6); #dranikhollowsc 
}
elsif($ulevel >= 50 && $ulevel <= 55 && plugin::check_handin(\%itemcount, 119479 => 1)) { #Blade of Vesagran 2.5 Epic
quest::say("Well done my friend you may enter the first Cave of Trials."); 
quest::faction(2769,120);
quest::summonitem(119479);  #returns Epic
quest::movepc(318,0.0,0.0,-11.1); # dranikhollowsa
} 
elsif($ulevel >= 56 && $ulevel <= 60 && plugin::check_handin(\%itemcount, 119479 => 1)){ #Blade of Vesagran 2.5 Epic
quest::say("Well done my friend you may enter the second Cave of Learning."); 
quest::faction(2769,120);
quest::summonitem(119479); #returns Epic 
quest::movepc(319,0.0,-447.0,-36.0);  #dranikhollowsb
} 
elsif($ulevel >= 61 && plugin::check_handin(\%itemcount, 119479 => 1)){ #Blade of Vesagran 2.5 Epic
quest::say("Well done my friend you may enter the final Cave of Mastery."); 
quest::faction(2769,120);
quest::summonitem(119479); #returns Epic 
quest::movepc(320,5.0,-51.0,-44.6); #dranikhollowsc 
}
elsif($ulevel >= 50 && $ulevel <= 55 && plugin::check_handin(\%itemcount, 57400 => 1)) { #Crafted talisman of the Fates 1.5 Epic
quest::say("Well done my friend you may enter the first Cave of Trials."); 
quest::faction(2769,120);
quest::summonitem(57400);  #returns Epic
quest::movepc(318,0.0,0.0,-11.1); # dranikhollowsa
} 
elsif($ulevel >= 56 && $ulevel <= 60 && plugin::check_handin(\%itemcount, 57400 => 1)){ #Crafted Talisman of the Fates 1.5 Epic
quest::say("Well done my friend you may enter the second Cave of Learning."); 
quest::faction(2769,120);
quest::summonitem(57400); #returns Epic 
quest::movepc(319,0.0,-447.0,-36.0);  #dranikhollowsb
} 
elsif($ulevel >= 61 && plugin::check_handin(\%itemcount, 57400 => 1)){ #Crafted Talisman of the Fates 1.5 Epic
quest::say("Well done my friend you may enter the final Cave of Mastery."); 
quest::faction(2769,120);
quest::summonitem(57400); #returns Epic 
quest::movepc(320,5.0,-51.0,-44.6); #dranikhollowsc 
}
elsif($ulevel >= 50 && $ulevel <= 55 && plugin::check_handin(\%itemcount, 57405 => 1)) { #Blessed Spiritstaff of the Heyokah 2.0 Epic
quest::say("Well done my friend you may enter the first Cave of Trials."); 
quest::faction(2769,120);
quest::summonitem(57405);  #returns Epic
quest::movepc(318,0.0,0.0,-11.1); # dranikhollowsa
} 
elsif($ulevel >= 56 && $ulevel <= 60 && plugin::check_handin(\%itemcount, 57405 => 1)){ #Blessed Spiritstaff of the Heyokah 2.0 Epic
quest::say("Well done my friend you may enter the second Cave of Learning."); 
quest::faction(2769,120);
quest::summonitem(57405); #returns Epic 
quest::movepc(319,0.0,-447.0,-36.0);  #dranikhollowsb
} 
elsif($ulevel >= 61 && plugin::check_handin(\%itemcount, 57405 => 1)){ #Blessed Spiritstaff of the heyokah 2.0 Epic
quest::say("Well done my friend you may enter the final Cave of Mastery."); 
quest::faction(2769,120);
quest::summonitem(57405); #returns Epic 
quest::movepc(320,5.0,-51.0,-44.6); #dranikhollowsc 
}
elsif($ulevel >= 50 && $ulevel <= 55 && plugin::check_handin(\%itemcount, 119470 => 1)) { #Blessed Spiritstaff of the Heyokah 2.5 Epic
quest::say("Well done my friend you may enter the first Cave of Trials."); 
quest::faction(2769,120);
quest::summonitem(119470);  #returns Epic
quest::movepc(318,0.0,0.0,-11.1); # dranikhollowsa
} 
elsif($ulevel >= 56 && $ulevel <= 60 && plugin::check_handin(\%itemcount, 119470 => 1)){ #Blessed Spiritstaff of the Heyokah 2.5 Epic
quest::say("Well done my friend you may enter the second Cave of Learning."); 
quest::faction(2769,120);
quest::summonitem(119470); #returns Epic 
quest::movepc(319,0.0,-447.0,-36.0);  #dranikhollowsb
} 
elsif($ulevel >= 61 && plugin::check_handin(\%itemcount, 119470 => 1)){ #Blessed Spiritstaff of the Heyokah 2.5 Epic
quest::say("Well done my friend you may enter the final Cave of Mastery."); 
quest::faction(2769,120);
quest::summonitem(119470); #returns Epic 
quest::movepc(320,5.0,-51.0,-44.6); #dranikhollowsc 
}
elsif($ulevel >= 50 && $ulevel <= 55 && plugin::check_handin(\%itemcount, 62581 => 1)) { #Soulwhisper 1.5 Epic
quest::say("Well done my friend you may enter the first Cave of Trials."); 
quest::faction(2769,120);
quest::summonitem(62581);  #returns Epic
quest::movepc(318,0.0,0.0,-11.1); # dranikhollowsa
} 
elsif($ulevel >= 56 && $ulevel <= 60 && plugin::check_handin(\%itemcount, 62581 => 1)){ #Soulwhisper 1.5 Epic
quest::say("Well done my friend you may enter the second Cave of Learning."); 
quest::faction(2769,120);
quest::summonitem(62581); #returns Epic 
quest::movepc(319,0.0,-447.0,-36.0);  #dranikhollowsb
} 
elsif($ulevel >= 61 && plugin::check_handin(\%itemcount, 62581 => 1)){ #Soulwhisper 1.5 Epic
quest::say("Well done my friend you may enter the final Cave of Mastery."); 
quest::faction(2769,120);
quest::summonitem(62581); #returns Epic 
quest::movepc(320,5.0,-51.0,-44.6); #dranikhollowsc 
}
elsif($ulevel >= 50 && $ulevel <= 55 && plugin::check_handin(\%itemcount, 64067 => 1)) { #Deathwhisper 2.0 Epic
quest::say("Well done my friend you may enter the first Cave of Trials."); 
quest::faction(2769,120);
quest::summonitem(64067);  #returns Epic
quest::movepc(318,0.0,0.0,-11.1); # dranikhollowsa
} 
elsif($ulevel >= 56 && $ulevel <= 60 && plugin::check_handin(\%itemcount, 64067 => 1)){ #Deathwhisper 2.0 Epic
quest::say("Well done my friend you may enter the second Cave of Learning."); 
quest::faction(2769,120);
quest::summonitem(64067); #returns Epic 
quest::movepc(319,0.0,-447.0,-36.0);  #dranikhollowsb
} 
elsif($ulevel >= 61 && plugin::check_handin(\%itemcount, 64067 => 1)){ #Deathwhisper 2.0 Epic
quest::say("Well done my friend you may enter the final Cave of Mastery."); 
quest::faction(2769,120);
quest::summonitem(64067); #returns Epic 
quest::movepc(320,5.0,-51.0,-44.6); #dranikhollowsc 
}
elsif($ulevel >= 50 && $ulevel <= 55 && plugin::check_handin(\%itemcount, 119474 => 1)) { #Deathwhisper 2.5 Epic
quest::say("Well done my friend you may enter the first Cave of Trials."); 
quest::faction(2769,120);
quest::summonitem(119474);  #returns Epic
quest::movepc(318,0.0,0.0,-11.1); # dranikhollowsa
} 
elsif($ulevel >= 56 && $ulevel <= 60 && plugin::check_handin(\%itemcount, 119474 => 1)){ #Deathwhisper 2.5 Epic
quest::say("Well done my friend you may enter the second Cave of Learning."); 
quest::faction(2769,120);
quest::summonitem(119474); #returns Epic 
quest::movepc(319,0.0,-447.0,-36.0);  #dranikhollowsb
} 
elsif($ulevel >= 61 && plugin::check_handin(\%itemcount, 119474 => 1)){ #Deathwhisper 2.5 Epic
quest::say("Well done my friend you may enter the final Cave of Mastery."); 
quest::faction(2769,120);
quest::summonitem(119474); #returns Epic 
quest::movepc(320,5.0,-51.0,-44.6); #dranikhollowsc 
}
elsif($ulevel >= 50 && $ulevel <= 55 && plugin::check_handin(\%itemcount, 19092 => 1)) { #Staff of Elemental Essence 1.5 Epic
quest::say("Well done my friend you may enter the first Cave of Trials."); 
quest::faction(2769,120);
quest::summonitem(19092);  #returns Epic
quest::movepc(318,0.0,0.0,-11.1); # dranikhollowsa
} 
elsif($ulevel >= 56 && $ulevel <= 60 && plugin::check_handin(\%itemcount, 19092 => 1)){ #Staff of Elemental Essence 1.5 Epic
quest::say("Well done my friend you may enter the second Cave of Learning."); 
quest::faction(2769,120);
quest::summonitem(19092); #returns Epic 
quest::movepc(319,0.0,-447.0,-36.0);  #dranikhollowsb
} 
elsif($ulevel >= 61 && plugin::check_handin(\%itemcount, 19092 => 1)){ #Staff of Elemental Essence 1.5 Epic
quest::say("Well done my friend you may enter the final Cave of Mastery."); 
quest::faction(2769,120);
quest::summonitem(19092); #returns Epic 
quest::movepc(320,5.0,-51.0,-44.6); #dranikhollowsc 
}
elsif($ulevel >= 50 && $ulevel <= 55 && plugin::check_handin(\%itemcount, 19839 => 1)) { #Focus of Primal Elements 2.0 Epic
quest::say("Well done my friend you may enter the first Cave of Trials."); 
quest::faction(2769,120);
quest::summonitem(19839);  #returns Epic
quest::movepc(318,0.0,0.0,-11.1); # dranikhollowsa
} 
elsif($ulevel >= 56 && $ulevel <= 60 && plugin::check_handin(\%itemcount, 19839 => 1)){ #Focus of Primal Elements 2.0 Epic
quest::say("Well done my friend you may enter the second Cave of Learning."); 
quest::faction(2769,120);
quest::summonitem(19839); #returns Epic 
quest::movepc(319,0.0,-447.0,-36.0);  #dranikhollowsb
} 
elsif($ulevel >= 61 && plugin::check_handin(\%itemcount, 19839 => 1)){ #Focus of Primal Elements 2.0 Epic
quest::say("Well done my friend you may enter the final Cave of Mastery."); 
quest::faction(2769,120);
quest::summonitem(19839); #returns Epic 
quest::movepc(320,5.0,-51.0,-44.6); #dranikhollowsc 
}
elsif($ulevel >= 50 && $ulevel <= 55 && plugin::check_handin(\%itemcount, 119472 => 1)) { #Focus of Primal Elements 2.5 Epic
quest::say("Well done my friend you may enter the first Cave of Trials."); 
quest::faction(2769,120);
quest::summonitem(119472);  #returns Epic
quest::movepc(318,0.0,0.0,-11.1); # dranikhollowsa
} 
elsif($ulevel >= 56 && $ulevel <= 60 && plugin::check_handin(\%itemcount, 119472 => 1)){ #Focus of Primal Elements 2.5 Epic
quest::say("Well done my friend you may enter the second Cave of Learning."); 
quest::faction(2769,120);
quest::summonitem(119472); #returns Epic 
quest::movepc(319,0.0,-447.0,-36.0);  #dranikhollowsb
} 
elsif($ulevel >= 61 && plugin::check_handin(\%itemcount, 119472 => 1)){ #Focus of Primal Elements 2.5 Epic
quest::say("Well done my friend you may enter the final Cave of Mastery."); 
quest::faction(2769,120);
quest::summonitem(119472); #returns Epic 
quest::movepc(320,5.0,-51.0,-44.6); #dranikhollowsc 
}
elsif($ulevel >= 50 && $ulevel <= 55 && plugin::check_handin(\%itemcount, 119482 => 1)) { #Aurora The Heartwood Blade 2.5 Epic
quest::say("Well done my friend you may enter the first Cave of Trials."); 
quest::faction(2769,120);
quest::summonitem(119482);  #returns Epic
quest::movepc(318,0.0,0.0,-11.1); # dranikhollowsa
} 
elsif($ulevel >= 56 && $ulevel <= 60 && plugin::check_handin(\%itemcount, 119482 => 1)){ #Aurora The Heartwood Blade 2.5 Epic
quest::say("Well done my friend you may enter the second Cave of Learning."); 
quest::faction(2769,120);
quest::summonitem(119482); #returns Epic 
quest::movepc(319,0.0,-447.0,-36.0);  #dranikhollowsb
} 
elsif($ulevel >= 61 && plugin::check_handin(\%itemcount, 119482 => 1)){ #Aurora The Heartwood Blade 2.5 Epic
quest::say("Well done my friend you may enter the final Cave of Mastery."); 
quest::faction(2769,120);
quest::summonitem(119482); #returns Epic 
quest::movepc(320,5.0,-51.0,-44.6); #dranikhollowsc 
}
elsif($ulevel >= 50 && $ulevel <= 55 && plugin::check_handin(\%itemcount, 50003 => 1)) { #Innoruuk's Voice 1.5 Epic
quest::say("Well done my friend you may enter the first Cave of Trials."); 
quest::faction(2769,120);
quest::summonitem(50003);  #returns Epic
quest::movepc(318,0.0,0.0,-11.1); # dranikhollowsa
} 
elsif($ulevel >= 56 && $ulevel <= 60 && plugin::check_handin(\%itemcount, 50003 => 1)){ #Innoruuk's Voice 1.5 Epic
quest::say("Well done my friend you may enter the second Cave of Learning."); 
quest::faction(2769,120);
quest::summonitem(50003); #returns Epic 
quest::movepc(319,0.0,-447.0,-36.0);  #dranikhollowsb
} 
elsif($ulevel >= 61 && plugin::check_handin(\%itemcount, 50003 => 1)){ #Innoruuk's Voice 1.5 Epic
quest::say("Well done my friend you may enter the final Cave of Mastery."); 
quest::faction(2769,120);
quest::summonitem(50003); #returns Epic 
quest::movepc(320,5.0,-51.0,-44.6); #dranikhollowsc 
}
elsif($ulevel >= 50 && $ulevel <= 55 && plugin::check_handin(\%itemcount, 48136 => 1)) { #Innoruuk's Dark Blessing 2.0 Epic
quest::say("Well done my friend you may enter the first Cave of Trials."); 
quest::faction(2769,120);
quest::summonitem(48136);  #returns Epic
quest::movepc(318,0.0,0.0,-11.1); # dranikhollowsa
} 
elsif($ulevel >= 56 && $ulevel <= 60 && plugin::check_handin(\%itemcount, 48136 => 1)){ #Innoruuk's Dark Blessing 2.0 Epic
quest::say("Well done my friend you may enter the second Cave of Learning."); 
quest::faction(2769,120);
quest::summonitem(48136); #returns Epic 
quest::movepc(319,0.0,-447.0,-36.0);  #dranikhollowsb
} 
elsif($ulevel >= 61 && plugin::check_handin(\%itemcount, 48136 => 1)){ #Innoruuk's Dark Blessing 2.0 Epic
quest::say("Well done my friend you may enter the final Cave of Mastery."); 
quest::faction(2769,120);
quest::summonitem(48136); #returns Epic 
quest::movepc(320,5.0,-51.0,-44.6); #dranikhollowsc 
}
elsif($ulevel >= 50 && $ulevel <= 55 && plugin::check_handin(\%itemcount, 119469 => 1)) { #Innoruuk's Dark blessing 2.5 Epic
quest::say("Well done my friend you may enter the first Cave of Trials."); 
quest::faction(2769,120);
quest::summonitem(119469);  #returns Epic
quest::movepc(318,0.0,0.0,-11.1); # dranikhollowsa
} 
elsif($ulevel >= 56 && $ulevel <= 60 && plugin::check_handin(\%itemcount, 119469 => 1)){ #Innoruuk's Dark Blessing 2.5 Epic
quest::say("Well done my friend you may enter the second Cave of Learning."); 
quest::faction(2769,120);
quest::summonitem(119469); #returns Epic 
quest::movepc(319,0.0,-447.0,-36.0);  #dranikhollowsb
} 
elsif($ulevel >= 61 && plugin::check_handin(\%itemcount, 119469 => 1)){ #Innoruuk's Dark Blessing 2.5 Epic
quest::say("Well done my friend you may enter the final Cave of Mastery."); 
quest::faction(2769,120);
quest::summonitem(119469); #returns Epic 
quest::movepc(320,5.0,-51.0,-44.6); #dranikhollowsc 
}
elsif($ulevel >= 50 && $ulevel <= 55 && plugin::check_handin(\%itemcount, 60321 => 1)) { #Champion's Sword of Eternal Power 1.5 Epic
quest::say("Well done my friend you may enter the first Cave of Trials."); 
quest::faction(2769,120);
quest::summonitem(60321);  #returns Epic
quest::movepc(318,0.0,0.0,-11.1); # dranikhollowsa
} 
elsif($ulevel >= 56 && $ulevel <= 60 && plugin::check_handin(\%itemcount, 60321 => 1)){ #Champion's Sword of Eternal Power 1.5 Epic
quest::say("Well done my friend you may enter the second Cave of Learning."); 
quest::faction(2769,120);
quest::summonitem(60321); #returns Epic 
quest::movepc(319,0.0,-447.0,-36.0);  #dranikhollowsb
} 
elsif($ulevel >= 61 && plugin::check_handin(\%itemcount, 60321 => 1)){ #Champion's Sword of Eternal Power 1.5 Epic
quest::say("Well done my friend you may enter the final Cave of Mastery."); 
quest::faction(2769,120);
quest::summonitem(60321); #returns Epic 
quest::movepc(320,5.0,-51.0,-44.6); #dranikhollowsc 
}
elsif($ulevel >= 50 && $ulevel <= 55 && plugin::check_handin(\%itemcount, 60332 => 1)) { #Kreljnok's Sword of Eternal Power 2.0 Epic
quest::say("Well done my friend you may enter the first Cave of Trials."); 
quest::faction(2769,120);
quest::summonitem(60332);  #returns Epic
quest::movepc(318,0.0,0.0,-11.1); # dranikhollowsa
} 
elsif($ulevel >= 56 && $ulevel <= 60 && plugin::check_handin(\%itemcount, 60332 => 1)){ #Kreljnok's Sword of Eternal Power 2.0 Epic
quest::say("Well done my friend you may enter the second Cave of Learning."); 
quest::faction(2769,120);
quest::summonitem(60332); #returns Epic 
quest::movepc(319,0.0,-447.0,-36.0);  #dranikhollowsb
} 
elsif($ulevel >= 61 && plugin::check_handin(\%itemcount, 60332 => 1)){ #Kreljnok's Sword of Eternal Power 2.0 Epic
quest::say("Well done my friend you may enter the final Cave of Mastery."); 
quest::faction(2769,120);
quest::summonitem(60332); #returns Epic 
quest::movepc(320,5.0,-51.0,-44.6); #dranikhollowsc 
}
elsif($ulevel >= 50 && $ulevel <= 55 && plugin::check_handin(\%itemcount, 119475 => 1)) { #Kreljnok's Sword of Eternal Power 2.5 Epic
quest::say("Well done my friend you may enter the first Cave of Trials."); 
quest::faction(2769,120);
quest::summonitem(119475);  #returns Epic
quest::movepc(318,0.0,0.0,-11.1); # dranikhollowsa
} 
elsif($ulevel >= 56 && $ulevel <= 60 && plugin::check_handin(\%itemcount, 119475 => 1)){ #Kreljnok's Sword of Eternal Power 2.5 Epic
quest::say("Well done my friend you may enter the second Cave of Learning."); 
quest::faction(2769,120);
quest::summonitem(119475); #returns Epic 
quest::movepc(319,0.0,-447.0,-36.0);  #dranikhollowsb
} 
elsif($ulevel >= 61 && plugin::check_handin(\%itemcount, 119475 => 1)){ #Kreljnok's Sword of Eternal Power 2.5 Epic
quest::say("Well done my friend you may enter the final Cave of Mastery."); 
quest::faction(2769,120);
quest::summonitem(119475); #returns Epic 
quest::movepc(320,5.0,-51.0,-44.6); #dranikhollowsc 
}
elsif($ulevel >= 50 && $ulevel <= 55 && plugin::check_handin(\%itemcount, 64031 => 1)) { #Redemption 1.5 Epic
quest::say("Well done my friend you may enter the first Cave of Trials."); 
quest::faction(2769,120);
quest::summonitem(64031);  #returns Epic
quest::movepc(318,0.0,0.0,-11.1); # dranikhollowsa
} 
elsif($ulevel >= 56 && $ulevel <= 60 && plugin::check_handin(\%itemcount, 64031 => 1)){ #Redemption 1.5 Epic
quest::say("Well done my friend you may enter the second Cave of Learning."); 
quest::faction(2769,120);
quest::summonitem(64031); #returns Epic 
quest::movepc(319,0.0,-447.0,-36.0);  #dranikhollowsb
} 
elsif($ulevel >= 61 && plugin::check_handin(\%itemcount, 64031 => 1)){ #Redemption 1.5 Epic
quest::say("Well done my friend you may enter the final Cave of Mastery."); 
quest::faction(2769,120);
quest::summonitem(64031); #returns Epic 
quest::movepc(320,5.0,-51.0,-44.6); #dranikhollowsc 
}
elsif($ulevel >= 50 && $ulevel <= 55 && plugin::check_handin(\%itemcount, 48147 => 1)) { #Nightbane, Sword of the valiant 2.0 Epic
quest::say("Well done my friend you may enter the first Cave of Trials."); 
quest::faction(2769,120);
quest::summonitem(48147);  #returns Epic
quest::movepc(318,0.0,0.0,-11.1); # dranikhollowsa
} 
elsif($ulevel >= 56 && $ulevel <= 60 && plugin::check_handin(\%itemcount, 48147 => 1)){ #Nightbane, Sword of the Valiant 2.0 Epic
quest::say("Well done my friend you may enter the second Cave of Learning."); 
quest::faction(2769,120);
quest::summonitem(48147); #returns Epic 
quest::movepc(319,0.0,-447.0,-36.0);  #dranikhollowsb
} 
elsif($ulevel >= 61 && plugin::check_handin(\%itemcount, 48147 => 1)){ #Nightbane, Sword of the Valiant 2.0 Epic
quest::say("Well done my friend you may enter the final Cave of Mastery."); 
quest::faction(2769,120);
quest::summonitem(48147); #returns Epic 
quest::movepc(320,5.0,-51.0,-44.6); #dranikhollowsc 
}
elsif($ulevel >= 50 && $ulevel <= 55 && plugin::check_handin(\%itemcount, 119480 => 1)) { #Nightbane, Sword of the Valiant 2.5 Epic
quest::say("Well done my friend you may enter the first Cave of Trials."); 
quest::faction(2769,120);
quest::summonitem(119480);  #returns Epic
quest::movepc(318,0.0,0.0,-11.1); # dranikhollowsa
} 
elsif($ulevel >= 56 && $ulevel <= 60 && plugin::check_handin(\%itemcount, 119480 => 1)){ #Nightbane, Sword of the Valiant 2.5 Epic
quest::say("Well done my friend you may enter the second Cave of Learning."); 
quest::faction(2769,120);
quest::summonitem(119480); #returns Epic 
quest::movepc(319,0.0,-447.0,-36.0);  #dranikhollowsb
} 
elsif($ulevel >= 61 && plugin::check_handin(\%itemcount, 119480 => 1)){ #Nightbane, Sword of the Valiant 2.5 Epic
quest::say("Well done my friend you may enter the final Cave of Mastery."); 
quest::faction(2769,120);
quest::summonitem(119480); #returns Epic 
quest::movepc(320,5.0,-51.0,-44.6); #dranikhollowsc 
}
elsif($ulevel >= 50 && $ulevel <= 55 && plugin::check_handin(\%itemcount, 52911 => 1)) { #Savage Lord's Totem 1.5 Epic
quest::say("Well done my friend you may enter the first Cave of Trials."); 
quest::faction(2769,120);
quest::summonitem(52911);  #returns Epic
quest::movepc(318,0.0,0.0,-11.1); # dranikhollowsa
} 
elsif($ulevel >= 56 && $ulevel <= 60 && plugin::check_handin(\%itemcount, 52911 => 1)){ #Savage lord's totem 1.5 Epic
quest::say("Well done my friend you may enter the second Cave of Learning."); 
quest::faction(2769,120);
quest::summonitem(52911); #returns Epic 
quest::movepc(319,0.0,-447.0,-36.0);  #dranikhollowsb
} 
elsif($ulevel >= 61 && plugin::check_handin(\%itemcount, 52911 => 1)){ #Savage lord's totem 1.5 Epic
quest::say("Well done my friend you may enter the final Cave of Mastery."); 
quest::faction(2769,120);
quest::summonitem(52911); #returns Epic 
quest::movepc(320,5.0,-51.0,-44.6); #dranikhollowsc 
}
elsif($ulevel >= 50 && $ulevel <= 55 && plugin::check_handin(\%itemcount, 57054 => 1)) { #Spiritcaller Totem of the Feral 2.0 Epic
quest::say("Well done my friend you may enter the first Cave of Trials."); 
quest::faction(2769,120);
quest::summonitem(57054);  #returns Epic
quest::movepc(318,0.0,0.0,-11.1); # dranikhollowsa
} 
elsif($ulevel >= 56 && $ulevel <= 60 && plugin::check_handin(\%itemcount, 57054 => 1)){ #Spiritcaller Totem of the Feral 2.0 Epic
quest::say("Well done my friend you may enter the second Cave of Learning."); 
quest::faction(2769,120);
quest::summonitem(57054); #returns Epic 
quest::movepc(319,0.0,-447.0,-36.0);  #dranikhollowsb
} 
elsif($ulevel >= 61 && plugin::check_handin(\%itemcount, 57054 => 1)){ #Spiritcaller Totem of the Feral 2.0 Epic
quest::say("Well done my friend you may enter the final Cave of Mastery."); 
quest::faction(2769,120);
quest::summonitem(57054); #returns Epic 
quest::movepc(320,5.0,-51.0,-44.6); #dranikhollowsc 
}
elsif($ulevel >= 50 && $ulevel <= 55 && plugin::check_handin(\%itemcount, 119478 => 1)) { #spiritcaller Totem of the Feral 2.5 Epic
quest::say("Well done my friend you may enter the first Cave of Trials."); 
quest::faction(2769,120);
quest::summonitem(119478);  #returns Epic
quest::movepc(318,0.0,0.0,-11.1); # dranikhollowsa
} 
elsif($ulevel >= 56 && $ulevel <= 60 && plugin::check_handin(\%itemcount, 119478 => 1)){ #Spiritcaller Totem of the Feral 2.5 Epic
quest::say("Well done my friend you may enter the second Cave of Learning."); 
quest::faction(2769,120);
quest::summonitem(119478); #returns Epic 
quest::movepc(319,0.0,-447.0,-36.0);  #dranikhollowsb
} 
elsif($ulevel >= 61 && plugin::check_handin(\%itemcount, 119478 => 1)){ #Spiritcaller Totem of the Feral 2.5 Epic
quest::say("Well done my friend you may enter the final Cave of Mastery."); 
quest::faction(2769,120);
quest::summonitem(119478); #returns Epic 
quest::movepc(320,5.0,-51.0,-44.6); #dranikhollowsc 
}
elsif($ulevel >= 50 && $ulevel <= 55 && plugin::check_handin(\%itemcount, 52952 => 1)) { #Oculus of persuasion 1.5 Epic
quest::say("Well done my friend you may enter the first Cave of Trials."); 
quest::faction(2769,120);
quest::summonitem(52952);  #returns Epic
quest::movepc(318,0.0,0.0,-11.1); # dranikhollowsa
} 
elsif($ulevel >= 56 && $ulevel <= 60 && plugin::check_handin(\%itemcount, 52952 => 1)){ #Oculus of persuasion 1.5 Epic
quest::say("Well done my friend you may enter the second Cave of Learning."); 
quest::faction(2769,120);
quest::summonitem(52952); #returns Epic 
quest::movepc(319,0.0,-447.0,-36.0);  #dranikhollowsb
} 
elsif($ulevel >= 61 && plugin::check_handin(\%itemcount, 52952 => 1)){ #Oculus of persuasion 1.5 Epic
quest::say("Well done my friend you may enter the final Cave of Mastery."); 
quest::faction(2769,120);
quest::summonitem(52952); #returns Epic 
quest::movepc(320,5.0,-51.0,-44.6); #dranikhollowsc 
}
elsif($ulevel >= 50 && $ulevel <= 55 && plugin::check_handin(\%itemcount, 52962 => 1)) { #Staff of Eternal Eloquence 2.0 Epic
quest::say("Well done my friend you may enter the first Cave of Trials."); 
quest::faction(2769,120);
quest::summonitem(52962);  #returns Epic
quest::movepc(318,0.0,0.0,-11.1); # dranikhollowsa
} 
elsif($ulevel >= 56 && $ulevel <= 60 && plugin::check_handin(\%itemcount, 52962 => 1)){ #Staff of Eternal Eloquence 2.0 Epic
quest::say("Well done my friend you may enter the second Cave of Learning."); 
quest::faction(2769,120);
quest::summonitem(52962); #returns Epic 
quest::movepc(319,0.0,-447.0,-36.0);  #dranikhollowsb
} 
elsif($ulevel >= 61 && plugin::check_handin(\%itemcount, 52962 => 1)){ #Staff of Eternal Eloquence 2.0 Epic
quest::say("Well done my friend you may enter the final Cave of Mastery."); 
quest::faction(2769,120);
quest::summonitem(52962); #returns Epic 
quest::movepc(320,5.0,-51.0,-44.6); #dranikhollowsc 
}
elsif($ulevel >= 50 && $ulevel <= 55 && plugin::check_handin(\%itemcount, 119473 => 1)) { #Staff of Eternal Eloquence 2.5 Epic
quest::say("Well done my friend you may enter the first Cave of Trials."); 
quest::faction(2769,120);
quest::summonitem(119473);  #returns Epic
quest::movepc(318,0.0,0.0,-11.1); # dranikhollowsa
} 
elsif($ulevel >= 56 && $ulevel <= 60 && plugin::check_handin(\%itemcount, 119473 => 1)){ #Staff of Eternal Eloquence 2.5 Epic
quest::say("Well done my friend you may enter the second Cave of Learning."); 
quest::faction(2769,120);
quest::summonitem(119473); #returns Epic 
quest::movepc(319,0.0,-447.0,-36.0);  #dranikhollowsb
} 
elsif($ulevel >= 61 && plugin::check_handin(\%itemcount, 119473 => 1)){ #Staff of Eternal Eloquence 2.5 Epic
quest::say("Well done my friend you may enter the final Cave of Mastery."); 
quest::faction(2769,120);
quest::summonitem(119473); #returns Epic 
quest::movepc(320,5.0,-51.0,-44.6); #dranikhollowsc 
}
elsif($ulevel >= 50 && $ulevel <= 55 && plugin::check_handin(\%itemcount, 62863 => 1)) { #Staff of living Brambles 1.5 Epic
quest::say("Well done my friend you may enter the first Cave of Trials."); 
quest::faction(2769,120);
quest::summonitem(62863);  #returns Epic
quest::movepc(318,0.0,0.0,-11.1); # dranikhollowsa
} 
elsif($ulevel >= 56 && $ulevel <= 60 && plugin::check_handin(\%itemcount, 62863 => 1)){ #Staff of Living Brambles 1.5 Epic
quest::say("Well done my friend you may enter the second Cave of Learning."); 
quest::faction(2769,120);
quest::summonitem(62863); #returns Epic 
quest::movepc(319,0.0,-447.0,-36.0);  #dranikhollowsb
} 
elsif($ulevel >= 61 && plugin::check_handin(\%itemcount, 62863 => 1)){ #Staff of Living Brambles 1.5 Epic
quest::say("Well done my friend you may enter the final Cave of Mastery."); 
quest::faction(2769,120);
quest::summonitem(62863); #returns Epic 
quest::movepc(320,5.0,-51.0,-44.6); #dranikhollowsc 
}
elsif($ulevel >= 50 && $ulevel <= 55 && plugin::check_handin(\%itemcount, 62880 => 1)) { #Staff of Everliving Brambles 2.0 Epic
quest::say("Well done my friend you may enter the first Cave of Trials."); 
quest::faction(2769,120);
quest::summonitem(62880);  #returns Epic
quest::movepc(318,0.0,0.0,-11.1); # dranikhollowsa
} 
elsif($ulevel >= 56 && $ulevel <= 60 && plugin::check_handin(\%itemcount, 62880 => 1)){ #Staff of Everliving Brambles 2.0 Epic
quest::say("Well done my friend you may enter the second Cave of Learning."); 
quest::faction(2769,120);
quest::summonitem(62880); #returns Epic 
quest::movepc(319,0.0,-447.0,-36.0);  #dranikhollowsb
} 
elsif($ulevel >= 61 && plugin::check_handin(\%itemcount, 62880 => 1)){ #Staff of Everliving Brambles 2.0 Epic
quest::say("Well done my friend you may enter the final Cave of Mastery."); 
quest::faction(2769,120);
quest::summonitem(62880); #returns Epic 
quest::movepc(320,5.0,-51.0,-44.6); #dranikhollowsc 
}
elsif($ulevel >= 50 && $ulevel <= 55 && plugin::check_handin(\%itemcount, 119466 => 1)) { #Staff of living Brambles 2.5 Epic
quest::say("Well done my friend you may enter the first Cave of Trials."); 
quest::faction(2769,120);
quest::summonitem(119466);  #returns Epic
quest::movepc(318,0.0,0.0,-11.1); # dranikhollowsa
} 
elsif($ulevel >= 56 && $ulevel <= 60 && plugin::check_handin(\%itemcount, 119466 => 1)){ #Staff of Living Brambles 2.5 Epic
quest::say("Well done my friend you may enter the second Cave of Learning."); 
quest::faction(2769,120);
quest::summonitem(119466); #returns Epic 
quest::movepc(319,0.0,-447.0,-36.0);  #dranikhollowsb
} 
elsif($ulevel >= 61 && plugin::check_handin(\%itemcount, 119466 => 1)){ #Staff of Living Brambles 2.5 Epic
quest::say("Well done my friend you may enter the final Cave of Mastery."); 
quest::faction(2769,120);
quest::summonitem(119466); #returns Epic 
quest::movepc(320,5.0,-51.0,-44.6); #dranikhollowsc 
}
elsif($ulevel >= 50 && $ulevel <= 55 && plugin::check_handin(\%itemcount, 12665 => 1)) { #Staff of Prismatic Power 1.5 Epic
quest::say("Well done my friend you may enter the first Cave of Trials."); 
quest::faction(2769,120);
quest::summonitem(12665);  #returns Epic
quest::movepc(318,0.0,0.0,-11.1); # dranikhollowsa
} 
elsif($ulevel >= 56 && $ulevel <= 60 && plugin::check_handin(\%itemcount, 12665 => 1)){ #Staff of Prismatic power 1.5 Epic
quest::say("Well done my friend you may enter the second Cave of Learning."); 
quest::faction(2769,120);
quest::summonitem(12665); #returns Epic 
quest::movepc(319,0.0,-447.0,-36.0);  #dranikhollowsb
} 
elsif($ulevel >= 61 && plugin::check_handin(\%itemcount, 12665 => 1)){ #Staff of Prismatic Power 1.5 Epic
quest::say("Well done my friend you may enter the final Cave of Mastery."); 
quest::faction(2769,120);
quest::summonitem(12665); #returns Epic 
quest::movepc(320,5.0,-51.0,-44.6); #dranikhollowsc 
}
elsif($ulevel >= 50 && $ulevel <= 55 && plugin::check_handin(\%itemcount, 16576 => 1)) { #Staff of Phenomenal Power 2.0 Epic
quest::say("Well done my friend you may enter the first Cave of Trials."); 
quest::faction(2769,120);
quest::summonitem(16576);  #returns Epic
quest::movepc(318,0.0,0.0,-11.1); # dranikhollowsa
} 
elsif($ulevel >= 56 && $ulevel <= 60 && plugin::check_handin(\%itemcount, 16576 => 1)){ #Staff of Phenomenal Power 2.0 Epic
quest::say("Well done my friend you may enter the second Cave of Learning."); 
quest::faction(2769,120);
quest::summonitem(16576); #returns Epic 
quest::movepc(319,0.0,-447.0,-36.0);  #dranikhollowsb
} 
elsif($ulevel >= 61 && plugin::check_handin(\%itemcount, 16576 => 1)){ #Staff of Phenomenal Power 2.0 Epic
quest::say("Well done my friend you may enter the final Cave of Mastery."); 
quest::faction(2769,120);
quest::summonitem(16576); #returns Epic 
quest::movepc(320,5.0,-51.0,-44.6); #dranikhollowsc 
}
elsif($ulevel >= 50 && $ulevel <= 55 && plugin::check_handin(\%itemcount, 119471 => 1)) { #Staff of Phenomenal Power 2.5 Epic
quest::say("Well done my friend you may enter the first Cave of Trials."); 
quest::faction(2769,120);
quest::summonitem(119471);  #returns Epic
quest::movepc(318,0.0,0.0,-11.1); # dranikhollowsa
} 
elsif($ulevel >= 56 && $ulevel <= 60 && plugin::check_handin(\%itemcount, 119471 => 1)){ #Staff of Phenomenal power 2.5 Epic
quest::say("Well done my friend you may enter the second Cave of Learning."); 
quest::faction(2769,120);
quest::summonitem(119471); #returns Epic 
quest::movepc(319,0.0,-447.0,-36.0);  #dranikhollowsb
} 
elsif($ulevel >= 61 && plugin::check_handin(\%itemcount, 119471 => 1)){ #Staff of Phenomenal Power 2.5 Epic
quest::say("Well done my friend you may enter the final Cave of Mastery."); 
quest::faction(2769,120);
quest::summonitem(119471); #returns Epic 
quest::movepc(320,5.0,-51.0,-44.6); #dranikhollowsc 
}
elsif($ulevel >= 50 && $ulevel <= 55 && plugin::check_handin(\%itemcount, 61025 => 1)) { #Fistwraps of Celestial Discipline 1.5 Epic
quest::say("Well done my friend you may enter the first Cave of Trials."); 
quest::faction(2769,120);
quest::summonitem(61025);  #returns Epic
quest::movepc(318,0.0,0.0,-11.1); # dranikhollowsa
} 
elsif($ulevel >= 56 && $ulevel <= 60 && plugin::check_handin(\%itemcount, 61025 => 1)){ #Fistwraps of Celestial Discipline 1.5 Epic
quest::say("Well done my friend you may enter the second Cave of Learning."); 
quest::faction(2769,120);
quest::summonitem(61025); #returns Epic 
quest::movepc(319,0.0,-447.0,-36.0);  #dranikhollowsb
} 
elsif($ulevel >= 61 && plugin::check_handin(\%itemcount, 61025 => 1)){ #Fistwraps of Celestial Discipline 1.5 Epic
quest::say("Well done my friend you may enter the final Cave of Mastery."); 
quest::faction(2769,120);
quest::summonitem(61025); #returns Epic 
quest::movepc(320,5.0,-51.0,-44.6); #dranikhollowsc 
}
elsif($ulevel >= 50 && $ulevel <= 55 && plugin::check_handin(\%itemcount, 67742 => 1)) { #Transcended Fistwraps of Immortality 2.0 Epic
quest::say("Well done my friend you may enter the first Cave of Trials."); 
quest::faction(2769,120);
quest::summonitem(67742);  #returns Epic
quest::movepc(318,0.0,0.0,-11.1); # dranikhollowsa
} 
elsif($ulevel >= 56 && $ulevel <= 60 && plugin::check_handin(\%itemcount, 67742 => 1)){ #Transcended Fistwraps of Immortality 2.0 Epic
quest::say("Well done my friend you may enter the second Cave of Learning."); 
quest::faction(2769,120);
quest::summonitem(67742); #returns Epic 
quest::movepc(319,0.0,-447.0,-36.0);  #dranikhollowsb
} 
elsif($ulevel >= 61 && plugin::check_handin(\%itemcount, 67742 => 1)){ #Transcended Fistwraps of Immortality 2.0 Epic
quest::say("Well done my friend you may enter the final Cave of Mastery."); 
quest::faction(2769,120);
quest::summonitem(67742); #returns Epic 
quest::movepc(320,5.0,-51.0,-44.6); #dranikhollowsc 
}elsif($ulevel >= 50 && $ulevel <= 55 && plugin::check_handin(\%itemcount, 119477 => 1)) { #Transcended Fistwraps of Immortality 2.5 Epic
quest::say("Well done my friend you may enter the first Cave of Trials."); 
quest::faction(2769,120);
quest::summonitem(119477);  #returns Epic
quest::movepc(318,0.0,0.0,-11.1); # dranikhollowsa
} 
elsif($ulevel >= 56 && $ulevel <= 60 && plugin::check_handin(\%itemcount, 119477 => 1)){ #Transcended Fistwraps of Immorality 2.5 Epic
quest::say("Well done my friend you may enter the second Cave of Learning."); 
quest::faction(2769,120);
quest::summonitem(119477); #returns Epic 
quest::movepc(319,0.0,-447.0,-36.0);  #dranikhollowsb
} 
elsif($ulevel >= 61 && plugin::check_handin(\%itemcount, 119477 => 1)){ #Transcended Fistwraps of Immorality 2.5 Epic
quest::say("Well done my friend you may enter the final Cave of Mastery."); 
quest::faction(2769,120);
quest::summonitem(119477); #returns Epic 
quest::movepc(320,5.0,-51.0,-44.6); #dranikhollowsc 
}
elsif($ulevel >= 50 && $ulevel <= 55 && plugin::check_handin(\%itemcount, 9955 => 1)) { #Harmony of the Soul 1.5 Epic
quest::say("Well done my friend you may enter the first Cave of Trials."); 
quest::faction(2769,120);
quest::summonitem(9955);  #returns Epic
quest::movepc(318,0.0,0.0,-11.1); # dranikhollowsa
} 
elsif($ulevel >= 56 && $ulevel <= 60 && plugin::check_handin(\%itemcount, 9955 => 1)){ #Harmony of the Soul 1.5 Epic
quest::say("Well done my friend you may enter the second Cave of Learning."); 
quest::faction(2769,120);
quest::summonitem(9955); #returns Epic 
quest::movepc(319,0.0,-447.0,-36.0);  #dranikhollowsb
} 
elsif($ulevel >= 61 && plugin::check_handin(\%itemcount, 9955 => 1)){ #Harmony of the Soul 1.5 Epic
quest::say("Well done my friend you may enter the final Cave of Mastery."); 
quest::faction(2769,120);
quest::summonitem(9955); #returns Epic 
quest::movepc(320,5.0,-51.0,-44.6); #dranikhollowsc 
}
elsif($ulevel >= 50 && $ulevel <= 55 && plugin::check_handin(\%itemcount, 20076 => 1)) { #Aegis of Superior Divinity 2.0 Epic
quest::say("Well done my friend you may enter the first Cave of Trials."); 
quest::faction(2769,120);
quest::summonitem(20076);  #returns Epic
quest::movepc(318,0.0,0.0,-11.1); # dranikhollowsa
} 
elsif($ulevel >= 56 && $ulevel <= 60 && plugin::check_handin(\%itemcount, 20076 => 1)){ #Aegis of Superior Divinity 2.0 Epic
quest::say("Well done my friend you may enter the second Cave of Learning."); 
quest::faction(2769,120);
quest::summonitem(20076); #returns Epic 
quest::movepc(319,0.0,-447.0,-36.0);  #dranikhollowsb
} 
elsif($ulevel >= 61 && plugin::check_handin(\%itemcount, 20076 => 1)){ #Aegis of Superior Divinity 2.0 Epic
quest::say("Well done my friend you may enter the final Cave of Mastery."); 
quest::faction(2769,120);
quest::summonitem(20076); #returns Epic 
quest::movepc(320,5.0,-51.0,-44.6); #dranikhollowsc 
}
elsif($ulevel >= 50 && $ulevel <= 55 && plugin::check_handin(\%itemcount, 119467 => 1)) { #Aegis of Superior Divinity 2.5 Epic
quest::say("Well done my friend you may enter the first Cave of Trials."); 
quest::faction(2769,120);
quest::summonitem(119467);  #returns Epic
quest::movepc(318,0.0,0.0,-11.1); # dranikhollowsa
} 
elsif($ulevel >= 56 && $ulevel <= 60 && plugin::check_handin(\%itemcount, 119467 => 1)){ #Aegis of Superior Divinity 2.5 Epic
quest::say("Well done my friend you may enter the second Cave of Learning."); 
quest::faction(2769,120);
quest::summonitem(119467); #returns Epic 
quest::movepc(319,0.0,-447.0,-36.0);  #dranikhollowsb
} 
elsif($ulevel >= 61 && plugin::check_handin(\%itemcount, 119467 => 1)){ #Aegis of Superior Divinity 2.5 Epic
quest::say("Well done my friend you may enter the final Cave of Mastery."); 
quest::faction(2769,120);
quest::summonitem(119467); #returns Epic 
quest::movepc(320,5.0,-51.0,-44.6); #dranikhollowsc 
}
elsif($ulevel >= 50 && $ulevel <= 55 && plugin::check_handin(\%itemcount, 18398 => 1)) { #Raging Taelosian Alloy Axe 1.5 Epic
quest::say("Well done my friend you may enter the first Cave of Trials."); 
quest::faction(2769,120);
quest::summonitem(18398);  #returns Epic
quest::movepc(318,0.0,0.0,-11.1); # dranikhollowsa
} 
elsif($ulevel >= 56 && $ulevel <= 60 && plugin::check_handin(\%itemcount, 18398 => 1)){ #Raging Taelosian Alloy Axe 1.5 Epic
quest::say("Well done my friend you may enter the second Cave of Learning."); 
quest::faction(2769,120);
quest::summonitem(18398); #returns Epic 
quest::movepc(319,0.0,-447.0,-36.0);  #dranikhollowsb
} 
elsif($ulevel >= 61 && plugin::check_handin(\%itemcount, 18398 => 1)){ #Raging Taelosian Alloy Axe 1.5 Epic
quest::say("Well done my friend you may enter the final Cave of Mastery."); 
quest::faction(2769,120);
quest::summonitem(18398); #returns Epic 
quest::movepc(320,5.0,-51.0,-44.6); #dranikhollowsc 
}
elsif($ulevel >= 50 && $ulevel <= 55 && plugin::check_handin(\%itemcount, 18309 => 1)) { #Vengeful Taelosian Blood Axe 2.0 Epic
quest::say("Well done my friend you may enter the first Cave of Trials."); 
quest::faction(2769,120);
quest::summonitem(18609);  #returns Epic
quest::movepc(318,0.0,0.0,-11.1); # dranikhollowsa
} 
elsif($ulevel >= 56 && $ulevel <= 60 && plugin::check_handin(\%itemcount, 18609 => 1)){ #Vengeful Taelosian Blood Axe 2.0 Epic
quest::say("Well done my friend you may enter the second Cave of Learning."); 
quest::faction(2769,120);
quest::summonitem(18609); #returns Epic 
quest::movepc(319,0.0,-447.0,-36.0);  #dranikhollowsb
} 
elsif($ulevel >= 61 && plugin::check_handin(\%itemcount, 18609 => 1)){ #Vengeful Taelosian Blood Axe 2.0 Epic
quest::say("Well done my friend you may enter the final Cave of Mastery."); 
quest::faction(2769,120);
quest::summonitem(18609); #returns Epic 
quest::movepc(320,5.0,-51.0,-44.6); #dranikhollowsc 
}
elsif($ulevel >= 50 && $ulevel <= 55 && plugin::check_handin(\%itemcount, 119481 => 1)) { #Vengeful Taelosian Blood Axe 2.5 Epic
quest::say("Well done my friend you may enter the first Cave of Trials."); 
quest::faction(2769,120);
quest::summonitem(119481);  #returns Epic
quest::movepc(318,0.0,0.0,-11.1); # dranikhollowsa
} 
elsif($ulevel >= 56 && $ulevel <= 60 && plugin::check_handin(\%itemcount, 119481 => 1)){ #Vengeful Taelosian Blood Axe 2.5 Epic
quest::say("Well done my friend you may enter the second Cave of Learning."); 
quest::faction(2769,120);
quest::summonitem(119481); #returns Epic 
quest::movepc(319,0.0,-447.0,-36.0);  #dranikhollowsb
} 
elsif($ulevel >= 61 && plugin::check_handin(\%itemcount, 119481 => 1)){ #Vengeful Taelosian Blood Axe 2.5 Epic
quest::say("Well done my friend you may enter the final Cave of Mastery."); 
quest::faction(2769,120);
quest::summonitem(119481); #returns Epic 
quest::movepc(320,5.0,-51.0,-44.6); #dranikhollowsc 
}
else {
    $client->Message(14,"$name, This proves nothing! Take it back!");
    plugin::return_items(\%itemcount);
    return 1;
 }
}