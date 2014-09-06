#####################################
#Quests: Bard Wind Spirits Armor
#NPC: Sollari Bekines
#Zone: qeynos
#Original Author Unknown
#Modified by RealityIncarnate
#edited farther by Aardil
#####################################

sub EVENT_SAY { 
my $bard = quest::saylink("bard", 1);
my $begin = quest::saylink("begin", 1);
my $Helm = quest::saylink("Helm", 1);
my $Bracers = quest::saylink("Bracers", 1);
my $Armguards = quest::saylink("Armguards", 1);
my $Boots = quest::saylink("Boots", 1);
my $Greaves = quest::saylink("Greaves", 1);
my $Gauntlets = quest::saylink("Gauntlets", 1);
my $Breastplate = quest::saylink("Breastplate", 1);
my $final = quest::saylink("final", 1);
  if($text=~/Hail/i){
    quest::say("Hello, there! I am Sollari Bekines of the League of Antonican Bards. I am at your service to train you as best I can. There have been a number of young bards entering our concert halls lately seeking guidance. If you are a young $bard in search of training. I might have some work for you.");
  }

  if($text=~/bard/i){
    quest::say("You need to look no further then. I can surely provide you with the knowledge you will need to make it in this world as a songweaver. The exercises that you will need to complete will test your gathering and fighting skills. Once you have completed your training you will be outfitted with a suit of your very own armor! When you are ready to $begin I will explain to you how the training will work.");
  }

  if($text=~/begin/i){
    quest::say("Here is your Wind Spirits Assembly Kit. In this kit you will collect a different items that will be combined in certain quantities to create infused armor materials. These armor materials that you create can then be taken to a forge along with the applicable armor mold to fashion together a piece of Wind Spirits Armor. When you would like to craft an armor piece you must simply tell me what piece you want to craft. I will then provide you with the recipe and mold necessary for creating Wind Spirits $Helms, $Bracers, $Armguards, $Boots, $Greaves, $Gauntlets and $Breastplate.");
    quest::summonitem(17269);
  }

  if($text=~/Helm/i){
    quest::say("To create your helm material you will need to combine 2 Bricks of Crude Iron, 1 Coyote Skull, 1 Bat Fur and 1 Honey Mead in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Wind Spirits Helm.");
    quest::summonitem(22610);
  }

  if($text=~/Bracers/i){
    quest::say("To create your bracer material you will need to combine 1 Brick of Crude Iron, 1 Gnoll Backbone, 1 Gnoll Scoutsmans Documents and 1 Throwing Spear in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Wind Spirits Bracer.");
    quest::summonitem(22611);
  }

  if($text=~/Armguards/i){
    quest::say("To create your armguards material you will need to combine 2 Bricks of Crude Iron, 2 Ruined Wolf Pelts, 1 Diseased Wolf Pelt and 1 Arrow in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Wind Spirits Armguards.");
    quest::summonitem(22613);
  }

  if($text=~/Boots/i){
    quest::say("To create your boot material you will need to combine 3 Bricks of Crude Iron, 1 Brown Bear Femur and 2 Blackburrow Gnoll Pelts in your assembly kit, Once you have created the proper material take it to a forge along with this mold to fashion your very own Wind Spirits Boots.");
    quest::summonitem(22612);
  }

  if($text=~/Greaves/i){
    quest::say("To create your greaves material you will need to combine 4 Bricks of Crude Iron, 1 Giant Spider Egg Sack, 1 Black Wolf Tooth, 1 Bottle and 1 Young Puma Skin in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Wind Spirits Greaves.");
    quest::summonitem(22614);
  }

  if($text=~/Gauntlets/i){
    quest::say("To create your gauntlet material you will need to combine 3 Bricks of Crude Iron, 1 Giant Fire Beetle Carapace, 1 Lion Tooth, and 2 Spider Legs in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Wind Spirits Gauntlets.");
    quest::summonitem(22615);
  }

  if($text=~/Breastplate/i){
    quest::say("To create your breastplate material you will need to combine 5 Bricks of Crude Iron, 1 Low Quality Bear Skin, 1 Woven Spider Silk, 1 Lock of Scarecrow Straw, 1 Matted Lion Pelt and 1 Bandit Sash in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Wind Spirits Breastplate. When you are finished with your Breastplate and have completed your armor set please come see me for one $final exercise.");
    quest::summonitem(22616);
  }

  if($text=~/final/i){
    quest::say("I need your help with ridding the hills of some of the most vile creatures, the gnolls of course! My resident alchemist has instructed me that he needs some items from these furballs for a antidote he is working on. I need you to bring me 2 Vials of Gnoll Blood and 2 Gnoll Pelvises. Once you have returned with these items I will reward you with a weapon worthy of the finest Qeynos Songweaver. I look forward to seeing you soon."); }
  }

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 27423 => 2, 27424 => 2)) {
    #text made up
    quest::say("Great work, $name.  You have rid the world of more gnolls and brought me the components I require.  Take this blade and use it well!");
    quest::summonitem(27493);
    #not completely sure about the faction hits
    quest::faction(192, 10); #League of Antonican Bards
    quest::faction(217, 5); #Merchants of Qeynos
    quest::faction(36, 5); #Citizens of Qeynos
     quest::ding(); quest::exp(100);
  }
    
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Bard');
  plugin::return_items(\%itemcount);
   quest::say("I have no use for this.");
}

#END of FILE Zone:qeynos  ID:1050 -- Sollari_Bekines
