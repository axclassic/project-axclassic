sub EVENT_SAY { 
my $Agnostic = quest::saylink("Agnostic", 1);
my $Bertoxxulous = quest::saylink("Bertoxxulous", 1);
my $Erollisi_Marr = quest::saylink("Erollisi_Marr", 1);
my $Innoruuk = quest::saylink("Innoruuk", 1);
my $Karana = quest::saylink("Karana", 1);
my $Mithaniel_Marr = quest::saylink("Mithaniel_Marr", 1);
my $Prexus = quest::saylink("Prexus", 1);
my $Rallos_Zek = quest::saylink("Rallos_Zek", 1);
my $Rodcet_Nife = quest::saylink("Rodcet_Nife", 1);
my $The_Tribunal = quest::saylink("The_Tribunal", 1);
my $Tunare = quest::saylink("Tunare", 1);
my $East_Freeport = quest::saylink("East_Freeport", 1);
my $South_Qeynos = quest::saylink("South_Qeynos", 1);
my $Greater_Faydark = quest::saylink("Greater_Faydark", 1);
if (($text=~/Warrior/i) && ($ulevel == 1) && ($class eq "Warrior")) {
    quest::say("A Fine choice, the Way of the Warrior, but I have a few more questions for you. Which Deity did you choose? $Agnostic, $Bertoxxulous, $Erollisi_Marr, $Innoruuk, $Karana, $Mithaniel_Marr, $Prexus, $Rallos_Zek, $Rodcet_Nife, $The_Tribunal, or $Tunare?");
  }
  if (($text=~/Agnostic/i) && ($ulevel == 1) && ($class eq "Warrior")) {
    quest::say("Following the way of The Agnostic? A Good Choice, So you will not commit to the existence or non-existence of any Deity. This is your choice.");
    quest::say("One more question for you $name, What city would you prefer to be sent to? $East_Freeport, $South_Qeynos or $Greater_Faydark.");
	}
  if (($text=~/Bertoxxulous/i) && ($ulevel == 1) && ($class eq "Warrior")) {
    quest::say("Following the way of Bertoxxulous? A Good Choice, Followers of The The Plaguebringer believe that the only truth on Norrath is that everything dies. They view the decay of flesh as a thing of ultimate beauty.");
    quest::say("On your way then, I will send you to Qeynos Catacombs. Hand this note to Rocthar Bekesna, He is your Warrior Guildmaster."); 
    quest::summonitem(18853);
	quest::movepc(45,-374,315,-38);
  }
    if (($text=~/Erollisi_Marr/i) && ($ulevel == 1) && ($class eq "Warrior")) {
    quest::say("Following the way of The Erollisi Marr? A Good Choice, Followers of The Queen of Love believe that love can conquer all, while not being naive about it.");
    quest::say("On your way then, I will send you to East Freeport. Hand this note to Brutol Rhaksen, He is your Warrior Guildmaster."); 
	quest::summonitem(18747);
	quest::movepc(8,566,-136,17);
  }
  if (($text=~/Innoruuk/i) && ($ulevel == 1) && ($class eq "Warrior")) {
    quest::say("Following the way of The Innoruuk? A Good Choice, Followers of The Duke of below believe that the surface world is a waste of space and prefer to explore caves and caverns.");
    quest::say("On your way then, I will send you to East Freeport. Hand this note to Brutol Rhaksen, He is your Warrior Guildmaster."); 
	quest::summonitem(18747);
	quest::movepc(8,566,-136,17);
  }
  if (($text=~/Karana/i) && ($ulevel == 1) && ($class eq "Warrior")) {
    quest::say("Following the way of The Karana? A Good Choice, Followers of The Rainkeeper believe in the absolute power of storms.");
    quest::say("On your way then, I will send you to South Qeynos. Hand this note to Ebon Strongbear, He is your Warrior Guildmaster."); 
	quest::summonitem(119852);
	quest::movepc(1,-513,48,31);
  }
  if (($text=~/Mithaniel_Marr/i) && ($ulevel == 1) && ($class eq "Warrior")) {
    quest::say("Following the way of The Mithaniel Marr? A Good Choice, Followers of The Lightbearer believe that valor is what separates civilized beings from beasts. You must have a strict moral code that prizes truth, honor and charity.");
    quest::say("On your way then, I will send you to West Freeport. Hand this note to Cain Darkmoore, He is your Warrior Guildmaster."); 
	quest::summonitem(18748);
	quest::movepc(9,-43,-305,-11);
  }
  if (($text=~/Prexus/i) && ($ulevel == 1) && ($class eq "Warrior")) {
    quest::say("Following the way of Prexus? A Good Choice, Followers of The Oceanlord believe in power that lies in the vast depths of Norrath's Oceans.");
    quest::say("One more question for you $name, What city would you prefer to be sent to? $East_Freeport, $South_Qeynos or $Greater_Faydark.");
  }
  if (($text=~/Rallos_Zek/i) && ($ulevel == 1) && ($class eq "Warrior")) {
    quest::say("Following the way of The Rallos Zek? A Good Choice, Followers of The Warlord believe in the survival of the strong and extinction of the weak.");
    quest::say("One more question for you $name, What city would you prefer to be sent to? $East_Freeport, $South_Qeynos or $Greater_Faydark.");
  }
  if (($text=~/Rodcet_Nife/i) && ($ulevel == 1) && ($class eq "Warrior")) {
    quest::say("Following the way of The Rodcet Nife? A Good Choice, Followers of The Prime Healer take oath to fight disease and death until one or the other takes them.");
    quest::say("On your way then, I will send you to South Qeynos. Hand this note to Ebon Strongbear, He is your Warrior Guildmaster."); 
	quest::summonitem(119852);
	quest::movepc(1,-513,48,31);
  }
  if (($text=~/The_Tribunal/i) && ($ulevel == 1) && ($class eq "Warrior")) {
    quest::say("Following the way of The Six Hammers? The Tribunal seelone thing above all else, justice.");
    quest::say("One more question for you $name, What city would you prefer to be sent to? $East_Freeport, $South_Qeynos or $Greater_Faydark.");
  }
  if (($text=~/Tunare/i) && ($ulevel == 1) && ($class eq "Warrior")) {
    quest::say("Following the way of Tunare? A Good Choice, Followers of the Mother of all believe we are all Tunare's children and seek to help Norrath.");
    quest::say("On your way then, I will send you to Kelethin. Hand this note to Regren, He is your Warrior Guildmaster."); 
	quest::summonitem(18782);
	quest::movepc(54,278,339,77);
  }
  if (($text=~/East_Freeport/i) && ($ulevel == 1) && ($class eq "Warrior")) {
    quest::say("On your way then, I will send you to West Freeport. Hand this note to Cain Darkmoore, He is your Warrior Guildmaster."); 
	quest::summonitem(18748);
	quest::movepc(9,-43,-305,-11);
  }
  if (($text=~/South_Qeynos/i) && ($ulevel == 1) && ($class eq "Warrior")) {
    quest::say("On your way then, I will send you to South Qeynos. Hand this note to Ebon Strongbear, He is your Warrior Guildmaster."); 
	quest::summonitem(119852);
	quest::movepc(1,-510,57,31);
  }
  if (($text=~/Greater_Faydark/i) && ($ulevel == 1) && ($class eq "Warrior")) {
    quest::say("On your way then, I will send you to Kelethin. Hand this note to Regren, He is your Warrior Guildmaster."); 
	quest::summonitem(18782);
	quest::movepc(54,278,339,77);
	}
	if($text=~/Hail/i){
	quest::say("Welcome. I am the champion of the Steel Warriors. There are none who can challenge me. I guide this brotherhood of Steel Warriors. From Qeynos to the trade city of Freeport, the ways of the Steel Warriors are taught. I welcome all [young Steel Warriors].");
	}
  if($text=~/I am a young steel warrior/i){
	quest::say("Then listen well to the words of the trainers of this arena. Learn to aid our friends such as the Knights of Thunder, the Priests of Life, the rangers and druids of Surefall Glade, the monks of the Silent Fist Clan and always support the Qeynos Guards for many of our brothers have entered their ranks. Oh yes.. You can also trust the bards of this city, after all, they do perform at all of our major events. If you are a [new recruit] I have some tasks for you to complete.");
	}
  if($text=~/I am a new recruit/i){
	quest::say("I am always pleased to see new blood ready to serve the Steel Warriors. All new recruits are asked to go through training that I personally oversee. These training exercises will test both your mind body and spirit because they are not easily completed. If you are [ready to begin] I will explain to you how the tests work and present you with your Steel Warriors Assembly Kit.");
	}
  if($text=~/I am ready to begin/i){
	quest::summonitem(17268);
	quest::say("Here is your Steel Warriors Assembly Kit. In this kit you will combine numerous [magical items] that can be infused in certain quantities to create an armor material. These armor materials can then be placed in a forge along with the correct mold to fashion a piece of Battlemasters Platemail Armor.");
	}
  if($text=~/What magical items/i){
	quest::say("The items you will need for your armor materials will be collected throughout the Qeynos area. You will find items that you need by hunting and by talking to local merchants. Once you are ready to begin collecting the items for an armor material you must simply tell me what piece you [want] to craft. I can provide you with the recipes and armor molds for Battlemasters Platemail [Helm], [Bracers], [Armguards], [Boots], [Greaves], [Gauntlets] and [Breastplate].");
    }
  if($text=~/I want to craft Helm/i){
	quest::summonitem(38834); # creates Item ID: 27460, final combine produces Item ID 27358
	quest::say("To create your helm material you will need to combine 2 Bricks of Crude Iron, 1 Giant Whiskered Bat Eye, 1 Snake Scales and 1 Brandy in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Helm of the Battlemaster.");
	}
  if($text=~/I want to craft Bracers/i){
	quest::summonitem(38830); # creates item ID: 27461, final combine produces Item ID 27359
	quest::say("To create your bracer material you will need to combine 1 Brick of Crude Iron, 1 King Snake Poison Sac, 1 Gray Wolf Fang and 1 Rat Eye in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Bracer of the Battlemaster.");
	}
  if($text=~/I want to craft Armguards/i){
	quest::summonitem(38831); # creates item ID: 27460, final combine produces Item ID 27360
	quest::say("To create your armguards material you will need to combine 2 Bricks of Crude Iron, 2 Rabid Grizzly Skins, 1 Giant Bat Wing and 1 Mistletoe in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Armguards of the Battlemaster.");
	}
  if($text=~/I want to craft Boots/i){
	quest::summonitem(38833); # creates item ID: 27463, final combine produces Item ID 27361
	quest::say("To create your boot material you will need to combine 3 Bricks of Crude Iron, 1 Gnoll Backbone and 2 Ruined Blackburrow Gnoll Pelt in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Boots of the Battlemaster.");
	}
  if($text=~/I want to craft Greaves/i){
	quest::summonitem(38836); # creates item ID: 27464, final combine produces Item ID 27362
	quest::say("To create your greaves material you will need to combine 4 Bricks of Crude Iron, 1 Giant Fire Beetle Brain, 1 Lion Tail, 1 Bottle and 1 Young Plains Cat Scalp in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Greaves of the Battlemaster.");
	}
  if($text=~/I want to craft Gauntlets/i){
	quest::summonitem(38832); # creates item ID: 27465, final combine produces Item ID 27363
	quest::say("To create your gauntlet material you will need to combine 3 Bricks of Crude Iron, 1 Spider Legs, 1 Brown Bear Paw, and 2 Mist Wolf Pelts in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Gauntlets of the Battlemaster.");
	}
  if($text=~/I want to craft Breastplate/i){
	quest::summonitem(38835); # creates item ID: 27466, final combine produces Item ID 27364
	quest::say("To create your breastplate material you will need to combine 5 Bricks of Crude Iron, 1 Thick Grizzly Bear Skin, 1 Woven Spider Silk, 1 Burned Out Lightstone, 1 Matted Lion Pelt and 1 Golden Bandit Tooth in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Breastplate of the Battlemaster. Once you have completed your breastplate and finished your armor please return to me for I have an [important mission] that I can only trust one of my finest warriors such as yourself with.");
	}
  if($text=~/What important mission/i){
	quest::say("I have heard word that the corrupt guards are up to it again and this time one has gone too far. Guard Beris has stolen my sisters coinpurse by claiming it was due for city tax. This is not true because my family is held in high regard here and we always pay our taxes promptly. This was simply a ploy to steal money and I do not take kindly to that. I must ask that you retrieve my sisters coinpurse from Beris, he can usually be found in the hills fishing on his off-duty time. Bring me whatever you can from him along with 3 perfect gnoll skins and I will reward you with a finely refined blade for your trouble.");
	}
	}
	sub EVENT_ITEM { 
my $Warrior = quest::saylink("Warrior", 1);
if (plugin::check_handin(\%itemcount, 18707 => 1) && $class eq "Warrior") { 
  quest::say("I am the Ebon Strongbear of the Steel Warriors. A few years ago, The Rathe server was created in order to bring back the feel of the orginal EQ zones. Many things have changed over the years and with those changes, some things could not be done anymore.");
    quest::say("You were sent to me because there is a problem with getting you to the correct city with the correct guild summons.");
	quest::say("Since you are talking to me I must assume you are a $Warrior?");
	}
  elsif (plugin::check_handin(\%itemcount, 119852 => 1) && $class eq "Warrior") { 
      quest::say("Welcome young warrior. I am the Ebon Strongbear of the Steel Warriors. I am happy you have decided to join us. Here, Take this Tunic and wear it with pride. May it protect you as you grow $name.");
    quest::summonitem(119851);
     quest::ding();
	quest::faction(311,10); #Steel Warriors
  quest::faction(434,10); #Qeynos residents
  quest::faction(217,10); #Merchants of Qeynos
  quest::faction(105,-10); #Freeport Militia
  quest::exp(1000);
  quest::rebind(1,-510,57,31);
   }
  elsif ($itemcount{27421} == 3 && $itemcount{27422} == 1){
    quest::say("I salute you young warrior! Take this reward with pride.");
    quest::summonitem(27492);
	}
else {
   quest::say("I have no use for this.");
   plugin::return_items(\%itemcount);
   }
}

