######################################
## NPC: Torin_Krentar ##
## Zone: Qcat - Cleric Quest ##
## Revised by caved for AX-CLASSIC ##
## EQWorld Server ##
######################################

sub EVENT_SAY {
if ($text=~/hail/i) {
$client->Message(14,"The dead are watching you young one, yet you are safe under their otherworldly gaze. Is there something I can do for you?");
}
if ($text=~/gauntlets/i) {
$client->Message(14,"If you want me to create a pestilence priest gauntlets for you, you need to bring me: 2 Bricks of Crude Iron ore, 1 Puma Skin and 1 Bandit Sash. Once you hand me these items I will create your very own Pestilence Priest Gauntlets.");
}
if ($text=~/boots/i) {
$client->Message(14,"If you want me to create a pestilence priest boots for you, you need to bring me: 2 Bricks of Crude Iron ore, 1 Ruined Blackburrow Gnoll Pelt, 1 Gnoll Fangs. Once you hand me these items I will create your very own pestilence priest boots.");
}
if ($text=~/bracer/i) {
$client->Message(14,"If you want me to create a pestilence priest bracer for you, you need to bring me: 2 Bricks of Crude Iron ore, 1 Field Rat Skull, 1 Coyote Skull. Once you hand me these items I will create your very own Pestilence Priest Bracer.");
}
if ($text=~/helm/i) {
$client->Message(14,"If you want me to create a pestilence priest helm for you, you need to bring me: 2 Bricks of Crude Iron ore, 1 Field Rat Ribcage, 1 Rat Tooth. Once you hand me these items I will create your very own Pestilence Priest Helm.");
}
if ($text=~/greaves/i) {
$client->Message(14,"If you want me to create a pestilence priest greaves for you, you need to bring me: 2 Bricks of Crude Iron ore, 1 Giant Fire Beetle Brain and 1 Shadow Wolf Paw. Once you hand me these items I will create your very own Pestilence Priest Greaves.");
}
if ($text=~/armguards/i) {
$client->Message(14,"If you want me to create a pestilence priest armguards for you, you need to bring me: 2 Bricks of Crude Iron ore, 1 Whiskered Bat Fangs, and 1 Torch. Once you hand me these items I will create your very own Pestilence Priest Armguards.");
}
if ($text=~/breastplate/i) {
$client->Message(14,"If you want me to create a pestilence priest breastplate for you, you need to bring me: 2 Bricks of Crude Iron ore, 1 Young Plains Cat Scalp and 1 Lock of Scarecrow Straw. Once you hand me these items I will create your very own Pestilence Priest Breastplate.");
}
}

sub EVENT_ITEM {
if(plugin::check_handin(\%itemcount, 20207 => 1 )) {
my $gauntlets = quest::saylink("Gauntlets", 1);
my $boots = quest::saylink("Boots", 1);
my $bracer = quest::saylink("Bracer", 1);
my $helm = quest::saylink("Helm", 1);
my $greaves = quest::saylink("Greaves", 1);
my $armguards = quest::saylink("Armguards", 1);
my $breastplate = quest::saylink("Breastplate", 1);
$client->Message(14,"Well met young disciple of Bertoxxulous. Perhaps one day you shall serve the Plague Lord in his realm, but for now you will serve the Bloodsabers, his mortal agents on Norrath. The armor you seek must be assembled using a Mail Assembly Kit. If you would like me to begin forging armor pieces, please tell me. Do you want me to craft $gauntlets of the Pestilence Priests, $boots of the Pestilence Priests, a $bracer of the Pestilence Priests, a $helm of the Pestilence Priests, $greaves of the Pestilence Priests, $armguards of the Pestilence Priests, or a $breastplate of the Pestilence Priests for you?");
}
elsif (plugin::check_handin(\%itemcount, 20199 => 1, 19946 => 1 )) {
$client->Message(14,"Well done, $name. Now go, spread the gifts of the Plague Lord upon the world.");
quest::ding(); quest::exp(15000);
quest::summonitem(20261);
}
elsif(plugin::check_handin(\%itemcount, 19630 =>2, 13757 =>1, 12100 =>1 )) {
$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take these gauntlets as a reward!"); #Gauntlets handin
quest::ding(); quest::exp(1000);
quest::summonitem(20220);
quest::faction(21,1);
quest::faction(135,-1);
quest::faction(235,-1);
quest::faction(257,-1);
quest::faction(53,1);
}
elsif(plugin::check_handin(\%itemcount, 19630 =>2, 13026 =>1, 13915 =>1 )) {
$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take these boots as a reward!"); #Boots handin
quest::ding(); quest::exp(1000);
quest::summonitem(20218);
quest::faction(21,1);
quest::faction(135,-1);
quest::faction(235,-1);
quest::faction(257,-1);
quest::faction(53,1);
}
elsif(plugin::check_handin(\%itemcount, 19630 =>2, 27387 =>1, 9130 =>1 )) {
$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take this bracer as a reward!"); #Bracer handin
quest::ding(); quest::exp(1000);
quest::summonitem(20216);
quest::faction(21,1);
quest::faction(135,-1);
quest::faction(235,-1);
quest::faction(257,-1);
quest::faction(53,1);
}
elsif(plugin::check_handin(\%itemcount, 19630 =>2, 27386 =>1, 13264 =>1 )) {
$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take this helm as a reward!"); #Helm handin
quest::ding(); quest::exp(1000);
quest::summonitem(20215);
quest::faction(21,1);
quest::faction(135,-1);
quest::faction(235,-1);
quest::faction(257,-1);
quest::faction(53,1);
}
elsif(plugin::check_handin(\%itemcount, 19630 =>2, 9910 =>1, 27412 =>1 )) {
$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take these greaves as a reward!"); #Greaves handin
quest::ding(); quest::exp(1000);
quest::summonitem(20219);
quest::faction(21,1);
quest::faction(135,-1);
quest::faction(235,-1);
quest::faction(257,-1);
quest::faction(53,1);
}
elsif(plugin::check_handin(\%itemcount, 19630 =>2, 27388 =>1, 13002 =>1 )) {
$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take these armguards as a reward!"); #Armguards handin
quest::ding(); quest::exp(1000);
quest::summonitem(20217);
quest::faction(21,1);
quest::faction(135,-1);
quest::faction(235,-1);
quest::faction(257,-1);
quest::faction(53,1);
}
elsif(plugin::check_handin(\%itemcount, 19630 =>2, 9905 =>1, 27411 =>1 )) {
$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take this breastplate as a reward!"); #Breastplate handin
quest::ding(); quest::exp(1000);
quest::summonitem(20221);
quest::faction(21,1);
quest::faction(135,-1);
quest::faction(235,-1);
quest::faction(257,-1);
quest::faction(53,1);
}
else {
plugin::return_items(\%itemcount);
$client->Message(14,"I don't need these, it is NOT what i asked for. Take them back and move along please!");
}
}

# EOF zone: qcat ID: 45074 NAME: Torin_Krentar