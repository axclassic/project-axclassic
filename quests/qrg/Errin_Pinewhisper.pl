######################################
## NPC: Errin_Pinewhisper           ##
## Zone: Surefall Glade (qrg        ##
## Quest: Ranger Newbie Armor       ##
## Revised by caved for AXClassic   ##
## EQWorld Server     18-12-2010    ##
######################################
sub EVENT_SAY {
my $sturdy = quest::saylink("sturdy", 1); 
my $gloves = quest::saylink("Gloves", 1); 
my $boots = quest::saylink("Boots", 1);
my $bracer = quest::saylink("Bracer", 1);
my $cap = quest::saylink("Cap", 1);
my $pants = quest::saylink("pants", 1);
my $sleeves = quest::saylink("Sleeves", 1);
my $tunic = quest::saylink("Tunic", 1);
my $issue = quest::saylink("issue", 1);
  if ($text=~/hail/i) {
    $client->Message(14,"Welcome to Surefall Glade friend. I am Errin Pinewhisper, Ranger of Karana the Storm Lord. You will find worshipers of both Karana and Tunare residing here in harmony. I train young rangers of both faiths and assist them in getting prepared for work in the often dangerous lands beyond the glade. If you are in need of a $sturdy outfit suitable for work as a young ranger then I will gladly instruct you on the means to obtain one.");
  }
  if ($text=~/sturdy/i) {
    $client->Message(14,"I can craft Pine Scout armor for you. Are you interested in Pine Scout $gloves , Pine Scout $boots , a Pine Scout $bracer , a Pine Scout $cap , Pine Scout $pants , Pine Scout $sleeves , or a Pine Scout $tunic ? Please remmember that all the molds that i have to use to make this armor for you will cost 1 platinum per piece exept for the tunic that will cost 2 platinum pieces. Once you are properly outfitted there is an $issue that you may be of assistance in resolving.");
  }
  if (($text=~/boots/i&&$class eq 'Ranger')) {
    $client->Message(14,"I will craft your Pine Scout Boots if you bring me: 2 Blackburrow Gnoll Skins, 1 ruined gnoll leather boots, 1 large whiskered bat fur and 1 platinum piece.");
  }
  if (($text=~/bracer/i&&$class eq 'Ranger')) {
    $client->Message(14,"I will craft your Pine Scout Bracer if you bring me: 1 Blackburrow Gnoll Skins, 1 ruined gnoll leather wristbands, 1 gnoll fang and 1 platinum piece.");
  }
  if (($text=~/cap/i&&$class eq 'Ranger')) {
    $client->Message(14,"I will craft your Pine Scout Cap if you bring me: 2 Blackburrow Gnoll Skins, 1 ruined gnoll leather cap, 1 Gray Wolf Fang and 1 platinum piece.");
  }
  if (($text=~/gloves/i&&$class eq 'Ranger')) {
    $client->Message(14,"I will craft your Pine Scout Gloves if you bring me: 2 Blackburrow Gnoll Skins, 1 ruined gnoll leather gloves, 1 giant field rat whiskers, and 1 platinum piece.");
  }
  if (($text=~/pants/i&&$class eq 'Ranger')) {
    $client->Message(14,"I will craft your Pine Scout Pants if you bring me: 2 Blackburrow Gnoll Skins, 1 ruined gnoll leather leggings, 1 Wolf Meat and 1 platinum piece.");
  }
  if (($text=~/sleeves/i&&$class eq 'Ranger')) {
    $client->Message(14,"I will craft your Pine Scout Sleeves if you bring me: 2 Blackburrow Gnoll Skins, 1 ruined gnoll leather sleeves, 1 Plague Rat Tail and 1 platinum piece.");
  }
  if (($text=~/tunic/i&&$class eq 'Ranger')) {
    $client->Message(14,"I will craft your Pine Scout Tunic if you bring me: 2 Blackburrow Gnoll Skins, 1 ruined gnoll leather tunic, 1 silver ring and 2 platinum pieces. Don't forget that I have 1 more $issue that needs resolving!");
  }
  if ($text=~/issue/i) {
    $client->Message(14,"A poacher was recently discovered hunting the bears in Surefall Glade and Qeynos Hills. This poacher has been identified as Yollis Jenkin and it appears that he has fled to Western Plains of Karana to escape retribution by the Jaggedpine Treefolk for his murders. Find Yollis Jenkin and tell him the Jaggedpine Treefolk sent you. He is wanted dead or alive so if he resists capture then bring me his head.");
  }
}

sub EVENT_ITEM {
my $issue = quest::saylink("issue", 1);
  if (plugin::check_handin(\%itemcount, 19949 => 1)) {
    $client->Message(14,"It is a shame when human blood must be shed in the defense of our brother wolves and bears. I thank you for your dedication to the Jaggedpine Treefolk. Take this rusty pine scout sword and give it back to me together with a Gnoll Fang, and a Large King Snake Skin and I will put the finishing touches on the weapon.");
    quest::faction(159,30); #jaggedpine treefolk
    quest::faction(265,30); #protectors of pine
    quest::faction(267,30); #qrg protected animals
    quest::faction(347,-30); #unkempt druids
    quest::faction(135,30); #guards of qeynos
     quest::ding(); quest::exp(5000);
    quest::summonitem(19950); #pine scout sword stage 1
  }
  elsif (plugin::check_handin(\%itemcount, 19950 => 1, 13915 => 1, 19945 => 1)) {
    quest::emote("fashions a grip from the large king snake skin, attaches the gnoll fang to the heel of the swords hilt, and polishes the blade of the sword with a luminescent green polish.");
    $client->Message(14,"Here is your new weapon young ranger. May it serve you well.");
    quest::faction(159,30); #jaggedpine treefolk
    quest::faction(265,30); #protectors of pine
    quest::faction(267,30); #qrg protected animals
    quest::faction(347,-30); #unkempt druids
    quest::faction(135,30); #guards of qeynos
     quest::ding(); quest::exp(10000);
    quest::summonitem(20263); #pine scout sword stage 2
}
    elsif(($platinum == 1) && plugin::check_handin(\%itemcount, 13028 => 2, 20119 => 1, 27400 => 1)) {
    $client->Message(14,"Very good, $name!  Here is your very own Pine Scout Cap"); #cap turnin
    quest::ding(); quest::exp(1000);
    quest::summonitem(20243);
    quest::faction(159,30); # Jaggedpine Treefolk
    quest::faction(265,30); # Protectors of Pine
    quest::faction(267,30); # QRG Protected Animals
    quest::faction(135,30); # Guards of Qeynos
    quest::faction(347,-30); # Unkempt Druids
    }
    elsif(($platinum == 1) && plugin::check_handin(\%itemcount, 13028 => 1, 20171 => 1, 13915 => 1)) {
    $client->Message(14,"Very good, $name! Here is your very own Pine Scout Bracer"); #bracer turnin
    quest::ding(); quest::exp(1000);
    quest::summonitem(20244);
    quest::faction(159,30); # Jaggedpine Treefolk
    quest::faction(265,30); # Protectors of Pine
    quest::faction(267,30); # QRG Protected Animals
    quest::faction(135,30); # Guards of Qeynos
    quest::faction(347,-30); # Unkempt Druids
	}
    elsif(($platinum == 1) && plugin::check_handin(\%itemcount, 13028 => 2, 20174 => 1, 20105 => 1)) {
    $client->Message(14,"Very good, $name! Here are your very own Pine Scout Boots"); #boots turnin
    quest::ding(); quest::exp(1000);
    quest::summonitem(20246);
    quest::faction(159,30); # Jaggedpine Treefolk
    quest::faction(265,30); # Protectors of Pine
    quest::faction(267,30); # QRG Protected Animals
    quest::faction(135,30); # Guards of Qeynos
    quest::faction(347,-30); # Unkempt Druids
	}
   elsif(($platinum == 1) && plugin::check_handin(\%itemcount, 13028 => 2, 20170 => 1, 9131 => 1)) {
    $client->Message(14,"Very good, $name! Here are your very own Pine Scout Sleeves"); #sleeves turnin
    quest::ding(); quest::exp(1000);
    quest::summonitem(20245);
    quest::faction(159,30); # Jaggedpine Treefolk
    quest::faction(265,30); # Protectors of Pine
    quest::faction(267,30); # QRG Protected Animals
    quest::faction(135,30); # Guards of Qeynos
    quest::faction(347,-30); # Unkempt Druids
   }
  elsif(($platinum == 1) && plugin::check_handin(\%itemcount, 13028 => 2, 20173 => 1, 13403 => 1)) {
    $client->Message(14,"Very good, $name! Here are your very own Pine Scout Pants"); #pants turnin
    quest::ding(); quest::exp(1000);
    quest::summonitem(20247);
    quest::faction(159,30); # Jaggedpine Treefolk
    quest::faction(265,30); # Protectors of Pine
    quest::faction(267,30); # QRG Protected Animals
    quest::faction(135,30); # Guards of Qeynos
    quest::faction(347,-30); # Unkempt Druids
	}
   elsif(($platinum == 1) && plugin::check_handin(\%itemcount, 13028 => 2, 20172 => 1, 19947 => 1)) {
    $client->Message(14,"Very good, $name! Here are your very own Pine Scout Gloves"); #gloves turnin
    quest::ding(); quest::exp(1000);
    quest::summonitem(20248);
    quest::faction(159,30); # Jaggedpine Treefolk
    quest::faction(265,30); # Protectors of Pine
    quest::faction(267,30); # QRG Protected Animals
    quest::faction(135,30); # Guards of Qeynos
    quest::faction(347,-30); # Unkempt Druids
	}
  elsif(($platinum == 2) && plugin::check_handin(\%itemcount, 13028 => 2, 20169 => 1, 10038 => 1)) {
    $client->Message(14,"Very good, $name! Here is your very own Pine Scout Tunic. Don't forget that I have 1 more $issue that needs resolving!"); #tunic turnin
    quest::ding(); quest::exp(1000);
    quest::summonitem(20249);
    quest::faction(159,30); # Jaggedpine Treefolk
    quest::faction(265,30); # Protectors of Pine
    quest::faction(267,30); # QRG Protected Animals
    quest::faction(135,30); # Guards of Qeynos
    quest::faction(347,-30); # Unkempt Druids
   }
   else {
    $client->Message(14,"$name, I don't need this. Take it back."); #return bogus items
    plugin::return_items(\%itemcount);
    plugin::try_tome_handins(\%itemcount, $class, 'Ranger');
    return 1;
  }
}

