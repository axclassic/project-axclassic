sub EVENT_SAY {
my $new = quest::saylink("new", 1);
my $before = quest::saylink("before", 1);
my $Paladin = quest::saylink("Paladin", 1);
my $armor = quest::saylink("armor", 1);
my $ready = quest::saylink("ready", 1);
my $Helm = quest::saylink("Helm", 1);
my $Armguards = quest::saylink("Armguards", 1);
my $Breastplate = quest::saylink("Breastplate", 1);
my $Bracers = quest::saylink("Bracers", 1);
my $Gauntlets = quest::saylink("Gauntlets", 1);
my $Legplates = quest::saylink("Legplates", 1);
my $Boots = quest::saylink("Boots", 1);
my $test = quest::saylink("test", 1);
  if($text=~/Hail/i) {
    quest::say("Hail $name, I am Shin Master Grubbus, Paladin Guildmaster of the Guktan Army.");
    quest::say("Are you $new to the area? Or have I seen you $before?");
  }
  if($text=~/new/i) {
	quest::say("Well then I welcome you to our new home $name. I feel we can make this place our own while we plan the invaison and recapturing of our dear old Gutka.");
	quset::say("Do you have something for me?");
  }
  if($text=~/before/i) {
    quest::say("Welcome back, young Shin. I hope your training is going well. I have made note of your progress as best I can, and you are truly following in the footsteps of Marr with every day that passes. As a paladin of Marr we must uphold His name and destroy those that wish to bring evil upon our people. Under Marr, I am able to offer you an additional path for training, should you truly desire to follow the path of a $Paladin.");
  }
  if ($text=~/Paladin/i) {
    quest::say("Very good. Initiates of the Knighthood of Marr must pass a series of tests. If you are devout and loyal to our cause you will be rewarded with our ceremonial $armor.");
  }
  if ($text=~/armor/i) {
    quest::say("We, the Shin Initiates, play an important role as mentors, healers, and warriors against evil in the Guktan Army. As a Shin Initiate all your battles should be fought in Marr's name. To show your homage to both Mithaniel Marr and our fellow brethren in the Guktan Army, young initiates are encouraged to complete a series of tasks that, when completed, will grant a set of Shin Initiate Armor. This armor shows your dedication and commitment to our cause. If you truly wish to walk in the path of The Truthbringer, I strongly suggest you complete your set of armor before venturing too far outside of the swamp. Are you $ready to begin?");
  }     
  if ($text=~/ready/i) {
    quest::say("Take this assembly kit. When you combine various items together in the assembly kit, you can create the different pieces of armor that you will need, such as $Helm, $Armguards, $Breastplate, $Bracers, $Gauntlets, $Legplates, and $Boots. If you would like to start crafting your armor, just tell me what piece you would like to craft and I will give you further instructions.");
    quest::summonitem(17834);
  }
  if ($text=~/Helm/i) {
    quest::say("The Helm of the Shin Initiate is one of the more difficult parts of your armor that you will craft. Make sure you are prepared before you venture out to locate the needed items. To make your helm you will need to gather a Giant Snake Rattle, one Fungus Clump, one Spider Legs, and two Small Bricks of Ore. You might be able to find some ore for sale by visiting the local merchants. Once you have found these items, combine them in your assembly kit and take the newly created material to a forge, along with this mold to create your Shin Initiate Armor.");
    quest::summonitem(38932);
  }
  if ($text=~/Armguards/i) {
    quest::say("To create armguards, find a Giant Snake Rattle, two Snake Fangs, one Spiderling Legs, and one Small Brick of Ore. You might be able to find some ore for sale by visiting the local merchants. Once you have found these items, combine them in your assembly kit and take the newly created material to a forge, such as the one in the Gukta Exchange, along with this mold to create your Shin Initiate Armor.");
    quest::summonitem(38929);
  }
  if ($text=~/Breastplate/i) {
    quest::say("This is the most difficult item that you will make. Please meditate on this and make sure you are ready before you begin. Through great perseverance and piety we are able to overcome almost any obstacle. To make a Breastplate of the Shin Initiate you will need to travel to the Common Lands, the Deserts of Ro, and Innothule Swamp and gather a Lightstone, one Pristine Giant Scarab Carapace, a Desert Tarantula Chitin, a Deathfist Slashed Belt, and two Small Bricks of Ore. If you cannot locate any ore in your travels, you might be able to find some ore for sale by visiting the local merchants. Once you have found these items, combine them in your assembly kit and take the newly created material to a forge, along with this mold to create your Shin Initiate Armor. After you have completed your Chestplate, come back to talk to me if you wish to perform your final $test.");
    quest::summonitem(38933);
  }
  if ($text=~/Bracers/i) {
    quest::say("Creating bracers is a fairly easy task. However even the most basic of tasks are important when done in Marr's name. Gather one Snake Fang, one Zombie Skin, one Turquoise, and one Small Brick of Ore. You might be able to find some ore for sale by visiting the local merchants. Once you have found these items, combine them in your assembly kit and take the newly created material to a forge along with this mold to create your Shin Initiate Armor.");
    quest::summonitem(38928);
  }
  if ($text=~/Guantlets/i) {
    quest::say("Gauntlets are a good choice. Gauntlets of the Shin Initiate are fairly simple to craft. You will need to gather one Small Mosquito Wing, one Large Snake Skin, two Zombie Skins, and one Small Brick of Ore. You might be able to find some ore for sale by visiting the local merchants. Once you have found these items, combine them in your assembly kit and take the newly created material to a forge along with this mold to create your Shin Initiate Armor.");
    quest::summonitem(38930);
  }
  if ($text=~/Legplates/i) {
    quest::say("In the battle for Grobb, many of our brethren fell. Their lives lost so that we may carry on Marr's Blessing. To aid in your forthcoming battles you may want to begin constructing Legplates of the Shin Initiate. Be forewarned however that they are somewhat difficult to construct. You will need to venture to the Deserts of Ro and gather a Desert Tarantula Chitin, a Giant Snake Fang, a Pristine Giant Scarab Carapace, and three Small Bricks of Ore. You might be able to find some ore for sale by visiting the local merchants. Once you have found these items, combine them in your assembly kit and take the newly created material to a forgealong with this mold to create your Shin Armor.");
    quest::summonitem(38934);
  }
  if ($text=~/Boots/i) {
    quest::say("Very good. We, as paladins of Marr, have a duty to uphold Marr's teachings and be his voice to all who will listen. Though the crafting of Boots of the Shin Initiate are relatively easy to create, do not be idle in either thought or action. To craft your boots you will need to gather a few items. You will need to gather one Snake Fang, one Small Mosquito Wing, one Zombie Skin, and two Small Bricks of Ore. You might be able to find some ore for sale by visiting the local merchants. Once you have found these items, combine them in your assembly kit and take the newly created material to a forge along with this mold to create your Shin Armor.");
    quest::summonitem(38931);
  }
  if ($text=~/test/i) {
    quest::say("Not all of our brethren follow the ways of The Truthbringer. In fact, a once noble paladin of our cause has decided to betray us and side with the trolls. For what reason, I do not know. His name is Fipok Glubble. There have been numerous sightings of him in the swamp. He must be stopped before he can cause any harm to our people. If you can find him, bring me his head and I will reward you.");
  }      
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 18365 => 1) && $class eq "Paladin") { 
    quest::say("I welcome you $name to the order of Shin, followers of Mithaniel Marr");
    quest::say("Take this Tunic and wear it with pride! May it protect you as you grow young Jin.");  
    quest::summonitem(119881);
    quest::ding();
    quest::exp(1000);
  }
  elsif (plugin::check_handin(\%itemcount, 55017 =>)) {
    quest::say("In the name of The Truthbringer! You have done it! Excellent work! Take this Blade of the Shin Initiate. May it aid you in your future battles!' ");
    quest::summonitem(55016);
    quest::ding(); quest::exp(1000);
    quest::faction( 245,5 );
    quest::faction( 264,5 );
    quest::faction( 146,5 );
    quest::faction( 202,5 );
    quest::faction( 136,5 );
    }
  else {
	quest::say("I cant use this.");
    plugin::return_items(\%itemcount); 
 }
}