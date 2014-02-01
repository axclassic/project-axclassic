######################################
## NPC: Salmekia_Threherth          ##
## Zone: Surefall Glade (qrg        ##
## Quest: Druids Newbie Armor       ##
## Revised by caved for AXClassic   ##
## EQWorld Server     15-12-2010    ##
######################################
sub EVENT_SAY {
my $clothing = quest::saylink("clothing", 1);
my $gloves = quest::saylink("Gloves", 1);
my $boots = quest::saylink("Boots", 1);
my $bracer = quest::saylink("Bracer", 1);
my $cap = quest::saylink("Cap", 1);
my $pants = quest::saylink("Pants", 1);
my $sleeves = quest::saylink("Sleeves", 1);
my $tunic = quest::saylink("Tunic", 1);
my $task = quest::saylink("task", 1);
my $bloodsabers = quest::saylink("Bloodsabers", 1);

  if (($text=~/hail/i&&$class eq 'Druid')) {
    $client->Message(14,"Welcome to Surefall Glade, $name, the home of the Jaggedpine Treefolk. I help teach young druids the ways of our people. We have worshipers of both Karana, the Storm Lord, and Tunare, the All Mother, living here in the glade. If you are a new druid I will help you obtain a suit of $clothing that will offer comfort and protection while working in the wilds and help protect you from the weapons of the Gnolls that wish to take these lands. After you re done getting your Armor i have 1 final $task for you");
  }
  if (($text=~/clothing/i&&$class eq 'Druid')) {
    $client->Message(14,"I can craft Pine Druid armor for you. Are you interested in Pine Druid $gloves, Pine Druid $boots, a Pine Druid $bracer, a Pine Druid $cap, Pine Druid $pants, Pine Druid $sleeves or a Pine Druid $tunic? Please remmember that all the molds that i have to use to make this armor for you will cost 1 platinum per piece exept for the tunic that will cost 2 platinum pieces. When you have been outfitted and are ready I will tell you of a final $task that you can assist with.");

  }
  if (($text=~/gloves/i&&$class eq 'Druid')) {
    $client->Message(14,"I will craft your Pine Druid Gloves if you bring me: 2 Blackburrow Gnoll Skins, 1 ruined gnoll leather gloves, 1 giant field rat whiskers, and 1 platinum piece.");

  }
  if (($text=~/boots/i&&$class eq 'Druid')) {
    $client->Message(14,"I will craft your Pine Druid Boots if you bring me: 2 Blackburrow Gnoll Skins, 1 ruined gnoll leather boots, 1 large whiskered bat fur and 1 platinum piece.");

  }
  if (($text=~/bracer/i&&$class eq 'Druid')) {
    $client->Message(14,"I will craft your Pine Druid Bracer if you bring me: 1 Blackburrow Gnoll Skins, 1 ruined gnoll leather wristbands, 1 gnoll fang and 1 platinum piece.");

  }
  if (($text=~/cap/i&&$class eq 'Druid')) {
    $client->Message(14,"I will craft your Pine Druid Cap if you bring me: 2 Blackburrow Gnoll Skins, 1 ruined gnoll leather cap, 1 Gray Wolf Fang and 1 platinum piece.");

  }
  if (($text=~/pants/i&&$class eq 'Druid')) {
    $client->Message(14,"I will craft your Pine Druid Pants if you bring me: 2 Blackburrow Gnoll Skins, 1 ruined gnoll leather leggings, 1 Wolf Meat and 1 platinum piece.");

  }
  if (($text=~/sleeves/i&&$class eq 'Druid')) {
    $client->Message(14,"I will craft your Pine Druid Sleeves if you bring me: 2 Blackburrow Gnoll Skins, 1 ruined gnoll leather sleeves, 1 Plague Rat Tail and 1 platinum piece.");

  }
  if (($text=~/tunic/i&&$class eq 'Druid')) {
    $client->Message(14,"I will craft your Pine Druid Tunic if you bring me: 2 Blackburrow Gnoll Skins, 1 ruined gnoll leather tunic, 1 silver ring and 2 platinum pieces. Don't forget that I have 1 more $task for you!");

  }
  if (($text=~/task/i&&$class eq 'Druid')) {
    $client->Message(14,"We druids seek to live in harmony with nature, taking only what we need from the land and the creatures that inhabit it. Although the City of Qeynos is a noble place, there are people in the city that do not share our reverence for nature and poach the animals of the Karanas needlessly. Even worse than these poachers, whom the rangers of the Jaggedpine Treefolk constantly seek to deter, are the despicable worshipers of Bertoxxulous that hide in the sewers and catacombs of Qeynos. These wicked individuals are known as the $bloodsabers.");
  }
  if (($text=~/bloodsabers/i&&$class eq 'Druid')) {
    $client->Message(14,"The Bloodsabers are responsible for a number of atrocities including the spreading of the diseases which have been inflicting the wolves and bears of the Qeynos Hills and the recent poisoning of the farmers fields in the Plains of Karana. Recently we have discovered that a Bloodsaber defiler has been attempting to poison the waters of Surefall Glade. Find this individual and deal with him accordingly, I doubt that this individual will surrender willingly. If need be eliminate them and bring me their head.");
  }
}

sub EVENT_ITEM {
my $task = quest::saylink("task", 1);
  if (plugin::check_handin(\%itemcount, 20268 => 1)) {
    $client->Message(14,"It is a shame that some people decide to throw away their humanity with the worship of evil deities. Your actions have saved the lives of many creatures that rely on the waters of this glade. Take this Rusty Pine Druid Scimitar and give it back to me together with a Gnoll Fang, and a Large King Snake Skin.");
    quest::ding(); quest::exp(5000);
    quest::faction(159,30); # Jaggedpine Treefolk
    quest::faction(265,30); # Protectors of Pine
    quest::faction(267,30); # QRG Protected Animals
    quest::faction(135,30); # Guards of Qeynos
    quest::faction(347,-30); # Unkempt Druids
    quest::summonitem(20258); # Druid Newbie Scimitar stage 1
    }
    elsif (plugin::check_handin(\%itemcount, 20258 => 1, 13915 => 1, 19945 => 1)) {
    quest::ding(); quest::exp(10000);
    quest::faction(159,30); # Jaggedpine Treefolk
    quest::faction(265,30); # Protectors of Pine
    quest::faction(267,30); # QRG Protected Animals
    quest::faction(135,30); # Guards of Qeynos
    quest::faction(347,-30); # Unkempt Druids
    quest::summonitem(20265); # Druid Newbie Scimitar stage 2
    }
    elsif(($platinum == 1) && plugin::check_handin(\%itemcount, 13028  => 2, 20119 => 1, 27400 => 1)) {
    $client->Message(14,"Very good, $name!  Here is your very own Pine Druid Cap"); #cap turnin
    quest::ding(); quest::exp(1000);
    quest::summonitem(20250);
    quest::faction(159,30); # Jaggedpine Treefolk
    quest::faction(265,30); # Protectors of Pine
    quest::faction(267,30); # QRG Protected Animals
    quest::faction(135,30); # Guards of Qeynos
    quest::faction(347,-30); # Unkempt Druids
    }
    elsif(($platinum == 1) && plugin::check_handin(\%itemcount, 13028  => 1, 20171 => 1, 13915 => 1)) {
    $client->Message(14,"Very good, $name! Here is your very own Pine Druid Bracer"); #bracer turnin
    quest::ding(); quest::exp(1000);
    quest::summonitem(20251);
    quest::faction(159,30); # Jaggedpine Treefolk
    quest::faction(265,30); # Protectors of Pine
    quest::faction(267,30); # QRG Protected Animals
    quest::faction(135,30); # Guards of Qeynos
    quest::faction(347,-30); # Unkempt Druids
	}
    elsif(($platinum == 1) && plugin::check_handin(\%itemcount, 13028  => 2, 20174 => 1, 20105 => 1)) {
    $client->Message(14,"Very good, $name! Here are your very own Pine Druid Boots"); #boots turnin
    quest::ding(); quest::exp(1000);
    quest::summonitem(20253);
    quest::faction(159,30); # Jaggedpine Treefolk
    quest::faction(265,30); # Protectors of Pine
    quest::faction(267,30); # QRG Protected Animals
    quest::faction(135,30); # Guards of Qeynos
    quest::faction(347,-30); # Unkempt Druids
	}
   elsif(($platinum == 1) && plugin::check_handin(\%itemcount, 13028  => 2, 20170 => 1, 9131 => 1)) {
    $client->Message(14,"Very good, $name! Here are your very own Pine Druid Sleeves"); #sleeves turnin
    quest::ding(); quest::exp(1000);
    quest::summonitem(20252);
    quest::faction(159,30); # Jaggedpine Treefolk
    quest::faction(265,30); # Protectors of Pine
    quest::faction(267,30); # QRG Protected Animals
    quest::faction(135,30); # Guards of Qeynos
    quest::faction(347,-30); # Unkempt Druids
   }
  elsif(($platinum == 1) && plugin::check_handin(\%itemcount, 13028  => 2, 20173 => 1, 13403 => 1)) {
    $client->Message(14,"Very good, $name! Here are your very own Pine Druid Pants"); #pants turnin
    quest::ding(); quest::exp(1000);
    quest::summonitem(20255);
    quest::faction(159,30); # Jaggedpine Treefolk
    quest::faction(265,30); # Protectors of Pine
    quest::faction(267,30); # QRG Protected Animals
    quest::faction(135,30); # Guards of Qeynos
    quest::faction(347,-30); # Unkempt Druids
	}
   elsif(($platinum == 1) && plugin::check_handin(\%itemcount, 13028  => 2, 20172 => 1, 19947 => 1)) {
    $client->Message(14,"Very good, $name! Here are your very own Pine Druid Gloves"); #gloves turnin
    quest::ding(); quest::exp(1000);
    quest::summonitem(20256);
    quest::faction(159,30); # Jaggedpine Treefolk
    quest::faction(265,30); # Protectors of Pine
    quest::faction(267,30); # QRG Protected Animals
    quest::faction(135,30); # Guards of Qeynos
    quest::faction(347,-30); # Unkempt Druids
	}
  elsif(($platinum == 2) && plugin::check_handin(\%itemcount, 13028  => 2, 20169 => 1, 10038 => 1)) {
    $client->Message(14,"Very good, $name! Here is your very own Pine Druid Tunic. Don't forget i have 1 final $task for you!"); #tunic turnin
    quest::ding(); quest::exp(1000);
    quest::summonitem(20257);
    quest::faction(159,30); # Jaggedpine Treefolk
    quest::faction(265,30); # Protectors of Pine
    quest::faction(267,30); # QRG Protected Animals
    quest::faction(135,30); # Guards of Qeynos
    quest::faction(347,-30); # Unkempt Druids
  }
  else {
    $client->Message(14,"$name, I don't need this. Take it back."); #return bogus items
    plugin::return_items(\%itemcount);
    return 1;
  }
}


