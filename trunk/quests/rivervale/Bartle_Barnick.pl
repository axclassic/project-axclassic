######################################
## NPC: Bartle_Barnick ##
## Zone: Rivervale ##
## Halfling Druid Armour Quests ##
## Revised by caved for AX-CLASSIC ##
## EQWorld Server ##
######################################

sub EVENT_SAY {
if($text=~/Hail/i){
$client->Message(14,"Hello $name, what brings you to me? Or did Hibbs send you with a note?");
}
if($text=~/cap/i){
$client->Message(14,"If you want me to create a Moss Toe Cap you will require 2 Spiderling Silks, 1 Orc Scalp, and 1 giant thicket rat skull. Once you hand me these items I will create your very own Moss Toe Cap.");
}

elsif($text=~/bracer/i){
$client->Message(14,"If you want me to create a Moss Toe Bracer you will require 2 Spiderling Silks, 1 Bat Fur, and 1 large wood spider tibia. Once you hand me these items I will create your very own Moss Toe Bracer.");
}

elsif($text=~/gloves/i){
$client->Message(14,"If you want me to create a Moss Toe Gloves you will require 2 Spiderling Silks, 1 Twilight Bloom, and 1 large wood spider tarsus.Once you hand me these items I will create your very own Moss Toe Gloves.");
}

elsif($text=~/boots/i){
$client->Message(14,"If you want me to create a Moss Toe Boots you will require 2 Spiderling Silks, 1 Low Quality Wolf Skin , and 1 Medium Quality Bear Skin. Once you hand me these items I will create your very own Moss Toe Boots.");
}

elsif($text=~/sleeves/i){
$client->Message(14,"If you want me to create a Moss Toe Sleeves you will require 2 Spiderling Silks, 1 Giant Bat Fur, and 1 Giant Fruit Bat Fur. Once you hand me these items I will create your very own Moss Toe Sleeves.");
}
elsif($text=~/leggings/i){
$client->Message(14,"If you want me to create a Moss Toe Leggings you will require 2 Spiderling Silks, 1 Giant Wasp Stinger, and 1 Halfling Finger Bones. Once you hand me these items I will create your very own Moss Toe Leggings.");
}

elsif($text=~/tunic/i){
$client->Message(14,"If you want me to create a Moss Toe Tunic you will require 2 Spiderling Silks, 1 Shadow Wolf Pelt, and 1 Thick Grizzly Bear Skin. Once you hand me these items I will create your very own Moss Toe Tunic.");
}
}

sub EVENT_ITEM {
my $cap = quest::saylink("Cap", 1);
my $bracer = quest::saylink("Bracer", 1);
my $gloves = quest::saylink("Gloves", 1);
my $boots = quest::saylink("Boots", 1);
my $sleeves = quest::saylink("Sleeves", 1);
my $leggings = quest::saylink("Leggings", 1);
my $tunic = quest::saylink("Tunic", 1);
if(plugin::check_handin(\%itemcount, 19629 => 1)){ #Handin: Letter from Hibbs to Bartle Barnick
$client->Message(14,"It is good to see another of our young people choose the humble life of a druid of Karana. I have assembled patterns that will allow me to construct some protective leather garments to keep you comfortable in the wilds and help turn aside the weapons of the Storm Reapers enemies. The required components for the leather vary according to which piece of Moss Toe Leather you want me to craft for you. Do you want me to craft a Moss Toe $cap, a Moss Toe $bracer, Moss Toe $gloves, Moss Toe $boots, Moss Toe $sleeves, Moss Toe $leggings, or a Moss Toe $tunic?");
}
elsif(plugin::check_handin(\%itemcount, 13099 =>2, 13791 =>1, 19615 =>1 )) {
$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take this cap as a reward!"); #Cap handin
quest::ding(); quest::exp(1000);
quest::summonitem(19678);
quest::faction(316,5); # +Storm Reapers
quest::faction(208,5); # +Mayor Gubbin
quest::faction(218,5); # +Merchants of Rivervale
quest::faction(347,-5); # -Unkempt Druids
}
elsif(plugin::check_handin(\%itemcount, 13099 =>2, 13069 =>1, 19655 =>1 )) {
$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take this bracer as a reward!"); #Bracer handin
quest::ding(); quest::exp(1000);
quest::summonitem(19681);
quest::faction(316,5); # +Storm Reapers
quest::faction(208,5); # +Mayor Gubbin
quest::faction(218,5); # +Merchants of Rivervale
quest::faction(347,-5); # -Unkempt Druids
}
elsif(plugin::check_handin(\%itemcount, 13099 =>2, 13061 =>1, 19619 =>1 )) {
$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take these sleeves as a reward!"); #Sleeves handin
quest::ding(); quest::exp(1000);
quest::summonitem(19680);
quest::faction(316,5); # +Storm Reapers
quest::faction(208,5); # +Mayor Gubbin
quest::faction(218,5); # +Merchants of Rivervale
quest::faction(347,-5); # -Unkempt Druids
}
elsif(plugin::check_handin(\%itemcount, 13099 =>2, 13753 =>1, 13751 =>1 )) {
$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take these boots as a reward!"); #Boots handin
quest::ding(); quest::exp(1000);
quest::summonitem(19684);
quest::faction(316,5); # +Storm Reapers
quest::faction(208,5); # +Mayor Gubbin
quest::faction(218,5); # +Merchants of Rivervale
quest::faction(347,-5); # -Unkempt Druids
}
elsif(plugin::check_handin(\%itemcount, 13099 =>2, 13261 =>1, 16182 =>1 )) {
$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take these leggings as a reward!"); #Leggings handin
quest::ding(); quest::exp(1000);
quest::summonitem(19683);
quest::faction(316,5); # +Storm Reapers
quest::faction(208,5); # +Mayor Gubbin
quest::faction(218,5); # +Merchants of Rivervale
quest::faction(347,-5); # -Unkempt Druids
}
elsif(plugin::check_handin(\%itemcount, 13099 =>2, 63125 =>1, 19656 =>1 )) {
$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take these gloves as a reward!"); #Gloves handin
quest::ding(); quest::exp(1000);
quest::summonitem(19682);
quest::faction(316,5); # +Storm Reapers
quest::faction(208,5); # +Mayor Gubbin
quest::faction(218,5); # +Merchants of Rivervale
quest::faction(347,-5); # -Unkempt Druids
}
elsif(plugin::check_handin(\%itemcount, 13099 =>2, 13779 =>1, 13756 =>1 )) {
$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take this tunic as a reward! May I remind you that Hibbs has another task for you? Be safe my friend ..."); #Tunic handin
quest::ding(); quest::exp(1000);
quest::summonitem(19679);
quest::faction(316,5); # +Storm Reapers
quest::faction(208,5); # +Mayor Gubbin
quest::faction(218,5); # +Merchants of Rivervale
quest::faction(347,-5); # -Unkempt Druids
}
else {
quest::say("I have no need for this item $name, you can have it back.");
plugin::return_items(\%itemcount);
}
}
