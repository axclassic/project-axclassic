######################################
## NPC: Jimji_Bottletoe ##
## Zone: Rivervale ##
## Halfling Paladin Quests ##
## Revised by caved for AX-CLASSIC ##
## Revision NR: 1 ##
## EQWorld Server ##
######################################

sub EVENT_SAY {
my $kaya = quest::saylink("Kaya", 1);
my $helm = quest::saylink("Helm", 1);
my $bracer = quest::saylink("Bracer", 1);
my $vambraces = quest::saylink("Vambraces", 1);
my $boots = quest::saylink("Boots", 1);
my $greaves = quest::saylink("Greaves", 1);
my $gauntlets = quest::saylink("Gauntlets", 1);
my $breastplate = quest::saylink("Breastplate", 1);
if($text=~/hail/i){
$client->Message(14,"Hi $name, what brings you here? Or are you one of $kaya 's new trainees?");
}
if($text=~/kaya/i){
$client->Message(14,"Pleased to meet you $name! You must be one of Kaya's new trainees. Kaya has asked me to help get you outfitted in a suit of armor to protect you from the vile weapons of Rivervales foes. I have assembled a kit that will allow me to construct the armor pieces once you have gathered the necessary components for me. The required components vary according to which piece of Bravefoot Mail you want me to craft. Do you want me to craft a Bravefoot Mail $helm, a Bravefoot Mail $bracer, Bravefoot Mail $gauntlets, Bravefoot Mail $boots, Bravefoot Mail $vambraces, Bravefoot Mail $greaves or a Bravefoot Mail $breastplate?");
}

if($text=~/helm/i){
$client->Message(14,"If you want me to create a Bravefoot Mail Helm for you, you need to bring me: 2 bricks of crude iron ore, 1 Ruined Wolf Pelt and a Large Yellowjacket Tergite. Once you hand me these items I will create your very own Bravefoot Mail Helm.");
}

if($text=~/bracer/i){
$client->Message(14,"If you want me to create a Bravefoot Mail Bracer for you, you need to bring me: 2 bricks of crude iron ore, 1 Shadow Wolf Tibia and a Large Yellowjacket Sternite. Once you hand me these items I will create your very own Bravefoot Mail Bracer.");
}

if($text=~/gauntlets/i){
$client->Message(14,"If you want me to create a Bravefoot Mail Gauntlets for you, you need to bring me: 2 bricks of crude iron ore, 1 Giant Wood Spider Femur and 1 Snake Scales. Once you hand me these items I will create your very own Bravefoot Mail Gauntlets.");
}

if($text=~/vambraces/i){
$client->Message(14,"TIf you want me to create a Bravefoot Mail Vambraces for you, you need to bring me: 2 bricks of crude iron ore, 1 Dark Elf Skin and 1 Ruined Thorn Drakeling Scales . Once you hand me these items I will create your very own Bravefoot Mail Vambraces.");
}

if($text=~/greaves/i){
$client->Message(14,"If you want me to create a Bravefoot Mail Greaves for you, you need to bring me: 2 bricks of crude iron ore, 1 Young Kodiak Paw and 1 Spiderling Eye. Once you hand me these items I will create your very own Bravefoot Mail Greaves.");
}

if($text=~/boots/i){
$client->Message(14,"If you want me to create a Bravefoot Mail Boots for you, you need to bring me: 2 bricks of crude iron ore, 1 Snake Fang and 1 Ruined Bear Pelt. Once you hand me these items I will create your very own Bravefoot Mail Boots.");
}

if($text=~/breastplate/i){
$client->Message(14,"If you want me to create a Bravefoot Mail Breastplate for you, you need to bring me: 2 bricks of crude iron ore, 1 Medium Quality Wolf Pelt and 1 Giant Yellowjacket Thorax. Once you hand me these items I will create your very own Bravefoot Mail Breastplate.");
}
}

sub EVENT_ITEM {
my $helm = quest::saylink("Helm", 1);
my $bracer = quest::saylink("Bracer", 1);
my $vambraces = quest::saylink("Vambraces", 1);
my $boots = quest::saylink("Boots", 1);
my $greaves = quest::saylink("Greaves", 1);
my $gauntlets = quest::saylink("Gauntlets", 1);
my $breastplate = quest::saylink("Breastplate", 1);
if(plugin::check_handin(\%itemcount, 19628 => 1)) { #Kaya's note handin
$client->Message(14,"Pleased to meet you $name! You must be one of Kaya's new trainees. Kaya has asked me to help get you outfitted in a suit of armor to protect you from the vile weapons of Rivervales foes. I have assembled a kit that will allow me to construct the armor pieces once you have gathered the necessary components for me. The required components vary according to which piece of Bravefoot Mail you want me to craft. Do you want me to craft a Bravefoot Mail $helm, a Bravefoot Mail $bracer, Bravefoot Mail $gauntlets, Bravefoot Mail $boots, Bravefoot Mail $vambraces, Bravefoot Mail $greaves or a Bravefoot Mail $breastplate?");
}
elsif(plugin::check_handin(\%itemcount, 19630 => 2, 13782 => 1, 19645 => 1)) {
$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take this helm as a reward!"); #Helm handin
quest::ding(); quest::exp(1000);
quest::summonitem(19671);
quest::faction(208,10);
quest::faction(218,10);
quest::faction(316,10);
quest::faction(347,-30);
}
elsif(plugin::check_handin(\%itemcount, 19630 => 2, 9903 => 1, 19646 => 1)) {
$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take this bracer as a reward!"); #Bracer handin
quest::ding(); quest::exp(1000);
quest::summonitem(19674);
quest::faction(208,10);
quest::faction(218,10);
quest::faction(316,10);
quest::faction(347,-30);
}
elsif(plugin::check_handin(\%itemcount, 19630 => 2, 22669 => 1, 19612 => 1)) {
$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take these vambraces as a reward!"); #Vambraces handin
quest::ding(); quest::exp(1000);
quest::summonitem(19673);
quest::faction(208,10);
quest::faction(218,10);
quest::faction(316,10);
quest::faction(347,-30);
}
elsif(plugin::check_handin(\%itemcount, 19630 => 2, 13067 => 1, 13781 => 1)) {
$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take these boots as a reward!"); #Boots handin
quest::ding(); quest::exp(1000);
quest::summonitem(19677);
quest::faction(208,10);
quest::faction(218,10);
quest::faction(316,10);
quest::faction(347,-30);
}
elsif(plugin::check_handin(\%itemcount, 19630 => 2, 9899 => 1, 13253 => 1)) {
$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take these greaves as a reward!"); #Greaves handin
quest::ding(); quest::exp(1000);
quest::summonitem(19676);
quest::faction(208,10);
quest::faction(218,10);
quest::faction(316,10);
quest::faction(347,-30);
}
elsif(plugin::check_handin(\%itemcount, 19630 => 2, 19659 => 1, 13070 => 1)) {
$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take these gauntlets as a reward!"); #Gauntlets handin
quest::ding(); quest::exp(1000);
quest::summonitem(19675);
quest::faction(208,10);
quest::faction(218,10);
quest::faction(316,10);
quest::faction(347,-30);
}
elsif(plugin::check_handin(\%itemcount, 19630 => 2, 13754 => 1, 19651 => 1)) {
$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take this breastplate as a reward! You are now ready for your final challenge, go back to Kaya and give her back the note so she can give it to the new trainees, then she will give you your final task. Be safe my friend ... "); #Breastplate handin
quest::ding(); quest::exp(1000);
quest::summonitem(19672);
quest::summonitem(19628);
quest::faction(208,10);
quest::faction(218,10);
quest::faction(316,10);
quest::faction(347,-30);
}

else {
plugin::return_items(\%itemcount);
$client->Message(14,"I don't need this $name. Take this back.");
return 1;
}
}