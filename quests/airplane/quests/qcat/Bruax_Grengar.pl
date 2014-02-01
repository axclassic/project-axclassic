######################################
## NPC: Bruax_Grengar ##
## Zone: Qcat - Evil Casters Quests ##
## Revised by caved for AX-CLASSIC ##
## EQWorld Server ##
######################################

sub EVENT_SAY {
my $sorcerous = quest::saylink("sorcerous", 1);
my $outfit = quest::saylink("outfit", 1);
my $staff = quest::saylink("Staff", 1);
my $cap = quest::saylink("cap", 1);
my $bracer = quest::saylink("bracer", 1);
my $gloves = quest::saylink("gloves", 1);
my $sandals = quest::saylink("sandals", 1);
my $sleeves = quest::saylink("sleeves", 1);
my $trousers = quest::saylink("trousers", 1);
my $robe = quest::saylink("robe", 1);

if($text=~/Hail/i){
$client->Message(14,"Hail $name. I am Bruax Grengar. master necromancer of the Bloodsabers. I assist not only young necromancers with their training but also aid all those Bloodsabers who have chosen to practice the $sorcerous arts. If you a practitioner of a sorcerous art I can craft an $outfit and $robe for you, that will assist you in your work. Once you have been properly outfitted I will also assist you in acquiring a $staff of the Bloodsabers.");
}
if($text=~/sorcerous/i){
$client->Message(14,"I speak of those who practice the sorcerous arts other than necromancy. the arts of Enchantment. Magery. and Wizardry. It is a common misnomer proclaimed by those uneducated to the ways of the Plague Bringer that only Shadowknights and Necromancers serve Bertoxxulous. In fact this temple alone has members from all walks of life. from tailors. scholars. and blacksmiths to warriors and sorcerers.");
}

if ($text=~/outfit/i) {
$client->Message(14,"Excellent $name, please tell me what piece you want me to craft for you, I can make a scourge sorcerer $cap, scourge sorcerer $bracer, scourge sorcerer $gloves, scourge sorcerer $sandals, scourge sorcerer $sleeves, scourge sorcerer $trousers or scourge sorcerer $robe. When you are ready to gather the items for an armor piece simply tell me what piece you want me to craft. When you are ready just hand me the items needed.");
}

if ($text=~/cap/i) {
$client->Message(14,"If you want me to create a Scourge Sorcerer Cap for you, you need to bring me: 1 spider silk, 1 klicnik warrior bile, 1 king snake skin and 1 cloth cap. Once you hand me these items I will create your very own Scourge Sorcerer Cap.");
}

if ($text=~/bracer/i) {
$client->Message(14,"If you want me to create a Scourge Sorcerer Bracer for you, you need to bring me: 1 spider silk, 1 gnoll pup scalp, 1 brown bear paw and 1 cloth wristband. Once you hand me these items I will create your very own Scourge Sorcerer Bracer.");
}

if ($text=~/gloves/i) {
$client->Message(14,"If you want me to create a Scourge Sorcerer Gloves for you, you need to bring me: 1 spider silk, 1 bone chips, 1 giant rat whiskers and 1 cloth gloves. Once you hand me these items I will create your very own Scourge Sorcerer Gloves");
}

if ($text=~/sandals/i) {
$client->Message(14,"If you want me to create a Scourge Sorcerer Sandals for you, you need to bring me: 1 spider silk, 1 gnoll fang, 1 snake fang, and 1 cloth sandals. Once you hand me these items I will create your very own Scourge Sorcerer Sandals");
}

if ($text=~/sleeves/i) {
$client->Message(14,"If you want me to create a Scourge Sorcerer Sleeves for you, you need to bring me: 1 spider silk, 1 sceleton tibia, 1 giant rat ear and 1 cloth sleeves. Once you hand me these items I will create your very own Scourge Sorcerer Sleeves");
}

if ($text=~/trousers/i) {
$client->Message(14,"If you want me to create a Scourge Sorcerer Trousers for you, you need to bring me: 1 spider silk, 1 patch of gnoll fur, 1 snake scales and 1 cloth pants. Once you hand me these items I will create your very own Scourge Sorcerer Trousers");
}

if ($text=~/robe/i) {
$client->Message(14,"If you want me to create a Scourge Sorcerer Robe for you, you need to bring me: 1 spider silk, 1 cracked staff, 1 giant rat tail and 1 cloth shirt. Once you hand me these items I will create your very own Scourge Sorcerer Robe");
}

if($text=~/staff/i){
$client->Message(14,"A Staff of the Bloodsabers is a useful implement for young sorcerers dedicated to Bertoxxulous the Plague Lord. I will assist you in the creation of a staff but first you must complete a task for me. The sorcerers of The Order of Three are supporters of Antonius Bayle IV. the haughty ruler of Qeynos. They lend magical aid to the Knights of Thunder and Priests of Life to identify and capture members of the Bloodsabers. A rather troublesome member of The Order of Three. Larkin Tolman. has recently been spotted at a settlement in the Western Plains of Karana. Find this Larkin Tolman and bring me his head.");
}
}
sub EVENT_ITEM {
if (plugin::check_handin(\%itemcount, 20204 =>1)) { #staff Handin NR1
$client->Message(14,"Well done. The Bloodsabers have many enemies within the city of Qeynos and its surrounding regions. You must exercise much caution when not within the safety of our temple here in the Qeynos Catacombs. Take this Rough Bloodsaber Staff and when you have gathered 1 Giant King Snake Skin, 1 Gnoll Fangs, and 1 Giant Fire Beetle Eye, return them to me with this staff and I will complete its construction.");
quest::summonitem(20203);
}

elsif (plugin::check_handin(\%itemcount, 13915 =>1, 19946 =>1, 13251 =>1, 20203 =>1)) { #staff handin NR2 upgrade
$client->Message(14,"Excellent work $name! Here is your reward.");
quest::summonitem(20264);
quest::exp(1000);
quest::ding();
quest::faction( 21,1);
quest::faction( 135,-1);
quest::faction( 235,1);
quest::faction( 257,-1);
}

elsif (plugin::check_handin(\%itemcount, 13041 =>1, 20201 =>1, 20267 =>1, 1001 =>1)) { #cap handin
$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take this cap as a reward!");
quest::summonitem(20236);
quest::exp(1000);
quest::ding();
quest::faction( 21,1);
quest::faction( 135,-1);
quest::faction( 235,1);
quest::faction( 257,-1);
}

elsif (plugin::check_handin(\%itemcount, 13041 =>1, 13789 =>1, 27497 =>1, 1009 =>1)) { #bracer handin
$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take this bracer as a reward!");
quest::summonitem(20237);
quest::exp(1000);
quest::ding();
quest::faction( 21,1);
quest::faction( 135,-1);
quest::faction( 235,1);
quest::faction( 257,-1);
}

elsif (plugin::check_handin(\%itemcount, 13041 =>1, 13073 =>1, 13055 =>1, 1010 =>1)) { #gloves handin
$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take these gloves as a reward!");
quest::summonitem(20241);
quest::exp(1000);
quest::ding();
quest::faction( 21,1);
quest::faction( 135,-1);
quest::faction( 235,1);
quest::faction( 257,-1);
}

elsif (plugin::check_handin(\%itemcount, 13041 =>1, 13915 =>1, 13067 =>1, 1012 =>1)) { #sandals handin
$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take these sandals as a reward!");
quest::summonitem(20239);
quest::exp(1000);
quest::ding();
quest::faction( 21,1);
quest::faction( 135,-1);
quest::faction( 235,1);
quest::faction( 257,-1);
}

elsif (plugin::check_handin(\%itemcount, 13041 =>1, 27390 =>1, 13050 =>1, 1008 =>1)) { #sleeves handin
$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take these sleeves as a reward!");
quest::summonitem(20238);
quest::exp(1000);
quest::ding();
quest::faction( 21,1);
quest::faction( 135,-1);
quest::faction( 235,1);
quest::faction( 257,-1);
}

elsif (plugin::check_handin(\%itemcount, 13041 =>1, 13025 =>1, 13070 =>1, 1011 =>1)) { #trousers handin
$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take these trousers as a reward!");
quest::summonitem(20240);
quest::exp(1000);
quest::ding();
quest::faction( 21,1);
quest::faction( 135,-1);
quest::faction( 235,1);
quest::faction( 257,-1);
}

elsif (plugin::check_handin(\%itemcount, 13041 =>1, 6018 =>1, 5039 =>1, 1004 =>1)) { #robe handin
$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take this robe as a reward!");
quest::summonitem(20242);
quest::exp(1000);
quest::ding();
quest::faction( 21,1);
quest::faction( 135,-1);
quest::faction( 235,1);
quest::faction( 257,-1);
}

plugin::return_items(\%itemcount);
}
#END of FILE Zone:qcat ID:45065 -- Bruax_Grengar 
