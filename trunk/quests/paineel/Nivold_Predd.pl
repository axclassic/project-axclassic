sub EVENT_SAY { 
my $summoning = quest::saylink("summoning", 1);
my $eye = quest::saylink("eye", 1);
my $powder = quest::saylink("powder", 1);
my $brain = quest::saylink("brain", 1);
my $toes = quest::saylink("toes", 1);
if($text=~/Hail/i){
quest::say("What do you want? Do not disturb me lest you plan to assist in my $summoning of Dread.");
}
if($text=~/summoning/i){
quest::say("There are some components essential to the summoning of the avatar of Dread. I require the $eye of a griffon. some $powder of reanimation. the $brain of the Ishva Mal. and the $toes of an ice giant. Fetch me these reagents so that we may summon the avatar to forge a shield worn only by the mightiest apostles of Cazic-Thule.");
}
if($text=~/eye/i){
quest::say("Not just any eye will do, the eye I need is from a Timber Griffon and its kind in the Jaggedpine Forest."); 
}
if($text=~/powder/i){
quest::say("There is a gnome necromancer who has been experimenting with a powder used in reanimating long dead organic tissue. He is known to frequent places populated by undead in order to pursue his research. Seek him out and bring with you a Greater Lightstone, he may be willing to trade you for the powder. Procure a bit of his powder and return it to me with the other items."); 
}
if($text=~/brain/i){
quest::say("Deep within the area known as Infected Paw is where Ishva Mal can be found, he is well guarded and will prove to be quite a challenge for you."); 
}
if($text=~/toes/i){
quest::say("Frost Giants are in the frozen tundra, they guard the entrance to the lair of Lady Vox."); 
}
}
sub EVENT_ITEM {
if(($itemcount{8103} == 1) && ($itemcount{14112} == 1) && ($itemcount{14111} == 1) && ($itemcount{16540} == 1)){
quest::summonitem(14105);
quest::ding();
quest::say("Commendable work, you have proven yourself a valuable member of our order. Our chanters have summoned the avatar of Dread. Hurry and take him this mundane shield so that he may forge it into a truly valuable symbol of your devotion to the lord of Fear!"); 
quest::faction(143,10);  
quest::faction(79,-10);   
quest::faction(112,-10);  
quest::faction(56,-10);  
quest::faction(60,-10);   
quest::exp(10000);
quest::givecash(0,0,0,6);
quest::spawn2(75169,0,0,459,1228,-38.2,95);
quest::signalwith(75169,1,0); #Tell Avatar of Dread to shout
 }
else { 
    #do all other handins first with plugin, then let it do disciplines
    plugin::try_tome_handins(\%itemcount, $class, 'Cleric');
    plugin::return_items(\%itemcount);
    quest::say("I have no need of this, take it back.");
 }
 }
#END of FILE Zone:paineel  ID:75071 -- Nivold_Predd 

