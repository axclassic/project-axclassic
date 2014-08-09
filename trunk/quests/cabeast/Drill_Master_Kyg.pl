sub EVENT_SAY { 
my $pike = quest::saylink("pike", 1);
my $slay = quest::saylink("slay", 1);
my $weapons = quest::saylink("weapons", 1);
my $assist = quest::saylink("assist", 1);
my $Warlord = quest::saylink("Warlord", 1);
if($text=~/Hail/i){
quest::say("Welcome. Welcome!!  Time to train.  Time to fight.  Time to serve the Iksar Empire.  You will need weapons.  I have the footman $pike for all new recruits to earn.");
}
if($text=~/pike/i){
quest::say("A footman pike is what you need.  A footman pike is what you get. but earn it you will.  You must $slay many beasts to prove to us that you are a true warrior.  Fail and you will be exiled to live with the Forsaken.");
}
if($text=~/slay/i){
quest::say("Yes.  You will slay or you will be slain.  Take this footman's pack and fill it you will.  Fill it with $weapons of our foes.  When all are combined. the full footman's pack shall be returned to me along with your militia pike.  Do this and earn your footman pike and then we may have a true mission for you.");
   quest::summonitem(17027);
}
if($text=~/weapons/i){
quest::say("Yes.  You need to know the weapons required.  Fill the pack with javelins.  Froglok bounder and goblin hunter javelins.  Two of each.");
 }
 if ($text=~/Moglok/i) {
   quest::say("My dear friend, Warlord Hikyg of the Swamp Gate has encountered some difficulty with a Trooper Moglok. He requested that I find a brave soldier to take charge of the situation. Are you willing to $assist Warlord Hikyg?");
 }
 if ($text=~/assist/i) {
   quest::say("Good. Take this note to Footman Moglok of the swamp garrison. He shall instruct you on your mission.");
   quest::summonitem(18234);
 }
 if ($text=~/other/i) {
   quest::say("It seems as though a $Warlord recently brought back news of Xyzith's fate. The War Baron could not understand how Xyzith could turn on his fellow brother so. The War Baron now seeks to find one that can solve this mystery.");
 }
 if ($text=~/Warlord/i) {
   quest::say("The Warlord's name? I believe it was. . .wait a minute! Why does this concern you? All you need know is that the Warlord is very brave and serves this Legion proudly unlike you! If you wish to prove yourself you'll speak to War Baron Eator regarding his findings and give him this to show your worth.");
 }
}


sub EVENT_ITEM {
my $Memory = quest::saylink("Memory", 1);
my $other = quest::saylink("other", 1);
   if (plugin::check_handin(\%itemcount, 12430 =>1, 5131 =>1 )) {
   quest::say("Kyg knew you could do it. You will make a fine legionnaire some day but, for now, you shall be a footman. Take the footman pike head plans. Forge the footman's pike. Do so, and then you may have an audience with the War Baron on the subject of his $Memory of Sebilis.");
   quest::summonitem(12475);
   quest::ding();
   quest::exp(500);
   quest::faction( 30,2);
   quest::faction( 193,2);
   quest::faction( 282,2);
   quest::faction( 317,2);
   quest::faction( 62,2);
   }
      if (plugin::check_handin(\%itemcount, 48025 =>1 )) {
   quest::say("What's this you have? Hmmm. . .I knew there were issues brewing by not of this magnitude. The War Baron has seemed preoccupied with $other issues. These issues may be one in the same.");
   quest::summonitem(48026);
   quest::ding();
   quest::exp(500);
   quest::faction( 30,2);
   quest::faction( 193,2);
   quest::faction( 282,2);
   quest::faction( 317,2);
   quest::faction( 62,2);
   }
   
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:cabeast  ID:1113 -- Drill_Master_Kyg 

