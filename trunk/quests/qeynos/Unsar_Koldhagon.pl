######################################
## NPC: Unsar Koldhagen ##
## Zone: Qeynos - Casters Quests ##
## Revised by caved for AX-CLASSIC ##
## EQWorld Server ##
######################################

sub EVENT_SAY {
my $sorcerous = quest::saylink("sorcerous", 1);
my $outfit = quest::saylink("outfit", 1);
my $dagger = quest::saylink("Dagger", 1);
my $cap = quest::saylink("cap", 1);
my $bracer = quest::saylink("bracer", 1);
my $gloves = quest::saylink("gloves", 1);
my $sandals = quest::saylink("sandals", 1);
my $sleeves = quest::saylink("sleeves", 1);
my $trousers = quest::saylink("trousers", 1);
my $robe = quest::saylink("robe", 1);

if($text=~/Hail/i){
$client->Message(14,"Hello, $name, I am Unsar Koldhagen. I assist not only young enchanters with their training but also aid all those charracters who have chosen to practice the $sorcerous arts. If you are a practitioner of a sorcerous art I can craft an $outfit and $robe for you, that will assist you in your work. Once you have been properly outfitted I will also assist you in acquiring a nice $dagger.");
}
if($text=~/sorcerous/i){
$client->Message(14,"I speak of those who practice the sorcerous arts other than enchantment. The arts of Magery. and Wizardry. In fact this temple alone has members from all walks of life. From tailors, scholars. to sorcerers.");
}

if ($text=~/outfit/i) {
$client->Message(14,"Excellent $name, please tell me what piece you want me to craft for you, I can make a $cap of the arcane order, $bracer of the arcane order, $gloves of the arcane order, $sandals of the arcane order, $sleeves of the arcane order, $trousers of the arcane order or a $robe of the arcane order. When you are ready to gather the items for an armor piece simply tell me what piece you want me to craft. When you are ready just hand me the items needed.");
}

if ($text=~/cap/i) {
$client->Message(14,"If you want me to create a Cap of The Arcane Order for you, you need to bring me: 1 spider silk, 1 klicnik warrior bile, 1 king snake skin and 1 cloth cap. Once you hand me these items I will create your very own Cap of The Arcane Order.");
}

if ($text=~/bracer/i) {
$client->Message(14,"If you want me to create a Bracer Of The Arcane Order for you, you need to bring me: 1 spider silk, 1 gnoll pup scalp, 1 brown bear paw and 1 cloth wristband. Once you hand me these items I will create your very own Bracer of The Arcane Order.");
}

if ($text=~/gloves/i) {
$client->Message(14,"If you want me to create a Gloves of The Arcane Orderfor you, you need to bring me: 1 spider silk, 1 bone chips, 1 giant rat whiskers and 1 cloth gloves. Once you hand me these items I will create your very own Gloves of The Arcane Order");
}

if ($text=~/sandals/i) {
$client->Message(14,"If you want me to create a Sandals of The Arcane Order for you, you need to bring me: 1 spider silk, 1 gnoll fang, 1 snake fang, and 1 cloth sandals. Once you hand me these items I will create your very own Sandals of The Arcane Order");
}

if ($text=~/sleeves/i) {
$client->Message(14,"If you want me to create a Sleeves of The Arcane Order for you, you need to bring me: 1 spider silk, 1 sceleton tibia, 1 giant rat ear and 1 cloth sleeves. Once you hand me these items I will create your very own Sleeves of The Arcane Order");
}

if ($text=~/trousers/i) {
$client->Message(14,"If you want me to create a Trousers of The Arcane Order for you, you need to bring me: 1 spider silk, 1 patch of gnoll fur, 1 snake scales and 1 cloth pants. Once you hand me these items I will create your very own Trousers of The Arcane Order");
}

if ($text=~/robe/i) {
$client->Message(14,"If you want me to create a Robe of The Arcane Order for you, you need to bring me: 1 spider silk, 1 cracked staff, 1 giant rat tail and 1 cloth shirt. Once you hand me these items I will create your very own Robe of The Arcane Order");
}

if($text=~/dagger/i){
$client->Message(14,"A Dagger of the Arcane Order is a useful implement for young sorcerers dedicated to our cause. I will forge such a powerfull dagger for you if you bring me 2 gnoll backbones and the Blackburrow Battle Plans, we have to know what these dreaded gnolls are up to, now GO!");
}
}
sub EVENT_ITEM {
if (plugin::check_handin(\%itemcount, 27405 =>2, 27416 =>1)) { #dagger handin
$client->Message(14,"Well done $name, now we can take our counter measures and position our troups thanks to you. Take this dagger as token of appreciation.");
quest::summonitem(27495);
}

elsif (plugin::check_handin(\%itemcount, 13041 =>1, 20201 =>1, 20267 =>1, 1001 =>1)) { #cap handin
$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take this cap as a reward!");
quest::summonitem(27379);
quest::exp(1000);
quest::ding();
quest::faction(240,2); # Order of Three
quest::faction(135,2); # Guards of Qeynos
quest::faction(21,-3); # Bloodsabers
}

elsif (plugin::check_handin(\%itemcount, 13041 =>1, 13789 =>1, 27497 =>1, 1009 =>1)) { #bracer handin
$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take this bracer as a reward!");
quest::summonitem(27380);
quest::exp(1000);
quest::ding();
quest::faction(240,2); # Order of Three
quest::faction(135,2); # Guards of Qeynos
quest::faction(21,-3); # Bloodsabers
}

elsif (plugin::check_handin(\%itemcount, 13041 =>1, 13073 =>1, 13055 =>1, 1010 =>1)) { #gloves handin
$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take these gloves as a reward!");
quest::summonitem(27384);
quest::exp(1000);
quest::ding();
quest::faction(240,2); # Order of Three
quest::faction(135,2); # Guards of Qeynos
quest::faction(21,-3); # Bloodsabers
}

elsif (plugin::check_handin(\%itemcount, 13041 =>1, 13915 =>1, 13067 =>1, 1012 =>1)) { #sandals handin
$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take these sandals as a reward!");
quest::summonitem(27382);
quest::exp(1000);
quest::ding();
quest::faction(240,2); # Order of Three
quest::faction(135,2); # Guards of Qeynos
quest::faction(21,-3); # Bloodsabers
}

elsif (plugin::check_handin(\%itemcount, 13041 =>1, 27390 =>1, 13050 =>1, 1008 =>1)) { #sleeves handin
$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take these sleeves as a reward!");
quest::summonitem(27381);
quest::exp(1000);
quest::ding();
quest::faction(240,2); # Order of Three
quest::faction(135,2); # Guards of Qeynos
quest::faction(21,-3); # Bloodsabers
}

elsif (plugin::check_handin(\%itemcount, 13041 =>1, 13025 =>1, 13070 =>1, 1011 =>1)) { #trousers handin
$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take these trousers as a reward!");
quest::summonitem(27383);
quest::exp(1000);
quest::ding();
quest::faction(240,2); # Order of Three
quest::faction(135,2); # Guards of Qeynos
quest::faction(21,-3); # Bloodsabers
}

elsif (plugin::check_handin(\%itemcount, 13041 =>1, 6018 =>1, 5039 =>1, 1004 =>1)) { #robe handin
$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take this robe as a reward!");
quest::summonitem(27385);
quest::exp(1000);
quest::ding();
quest::faction(240,2); # Order of Three
quest::faction(135,2); # Guards of Qeynos
quest::faction(21,-3); # Bloodsabers
}
else{
(plugin::return_items(\%itemcount));
$client->Message(14,"I don't need these, please take them back, This is NOT what i asked for...");
}
}
#END of FILE Zone:qeynos ID:1066 -- Unsar_Koldhagon.pl