######################################
## NPC: Miltiades_Tal-Azroth ##
## Zone: Quenos ##
## Paladin Newbie Armour Quests ##
## Revised by caved for AX-CLASSIC ##
## EQWorld Server ##
######################################

sub EVENT_SAY {
my $paladin = quest::saylink("Paladin", 1);
my $tests = quest::saylink("tests", 1);
my $collecting = quest::saylink("collecting", 1);
my $helms = quest::saylink("Helms", 1);
my $bracers = quest::saylink("Bracers", 1);
my $armguards = quest::saylink("Armguards", 1);
my $boots = quest::saylink("Boots", 1);
my $greaves = quest::saylink("Greaves", 1);
my $gauntlets = quest::saylink("Gauntlets", 1);
my $breastplates = quest::saylink("Breastplates", 1);
my $favor = quest::saylink("favor", 1);
my $slayings = quest::saylink("slayings", 1);

if($text=~/Hail/i){
$client->Message(14,"Greetings and salutations $name. I am Miltiades Tal`Azroth Crusader of Karana. I have spent all of my years here in Qeynos and gathered infinite knowledge from my teachers on my path to enlightenment. I have also started training new recruits to help them find their calling as a Holy Warrior of Karana. If you are a $paladin of Karana I might have some tasks for you to complete.");
}
if($text=~/paladin/i){
$client->Message(14,"That is excellent news $name. As a Knight in training of Karana I would like to offer you a series of $tests what will test your devotion to yourself and your god.");
}
if($text=~/tests/i){
$client->Message(14,"I have put together a series of tests that will enable our new recruits to get their own armor. you will have to collect from both the hunting areas surround Qeynos and the city itself. I can craft this armour for you but you will have to get me the items needed to do so. Are you ready to start $collecting the items needed?");
}
if($text=~/collecting/i){
$client->Message(14,"Excellent $name. Now for your materials you will fashion you will obviously need to know what items are used for what armor materials. Simply tell me what armor piece you want me to create and I will tell you wich items to collect for me. I can craft $helms, $bracers, $armguards, $boots, $greaves, $gauntlets and $breastplates. After you got your armour set I would like you to do me another $favor young $class");
}
if($text=~/helms/i){
$client->Message(14,"If you want me to create a Helm of the Rainkeeper for you, you need to bring me: 2 Bricks of Crude Iron ore, 1 Field Rat Ribcage, 1 Rat Tooth. Once you hand me these items I will create your very own Helm of the Rainkeeper.");
}
if($text=~/bracers/i){
$client->Message(14,"If you want me to create a Bracer of the Rainkeeper for you, you need to bring me: 2 Bricks of Crude Iron ore, 1 Field Rat Skull, 1 Coyote Skull. Once you hand me these items I will create your very own Bracer of the Rainkeeper.");
}
if($text=~/armguards/i){
$client->Message(14,"If you want me to create a Armguards of the Rainkeeper for you, you need to bring me: 2 Bricks of Crude Iron ore, 1 Whiskered Bat Fangs, and 1 Torch. Once you hand me these items I will create your very own Armguards of the Rainkeeper.");
}
if($text=~/boots/i){
$client->Message(14,"If you want me to create a Boots of the Rainkeeper for you, you need to bring me: 2 Bricks of Crude Iron ore, 1 Ruined Blackburrow Gnoll Pelt, 1 Gnoll Fangs. Once you hand me these items I will create your very own Boot of the Rainkeeper.");
}
if($text=~/greaves/i){
$client->Message(14,"If you want me to create a Greaves of the Rainkeeper for you, you need to bring me: 2 Bricks of Crude Iron ore, 1 Giant Fire Beetle Brain and 1 Shadow Wolf Paw. Once you hand me these items I will create your very own Greaves of the Rainkeeper.");
}
if($text=~/gauntlets/i){
$client->Message(14,"If you want me to create a Gauntlets of the Rainkeeper for you, you need to bring me: 2 Bricks of Crude Iron ore, 1 Puma Skin and 1 Bandit Sash. Once you hand me these items I will create your very own Gauntlets of the Rainkeeper.");
}
if($text=~/breastplates/i){
$client->Message(14,"If you want me to create a Breastplate of the Rainkeeper for you, you need to bring me: 2 Bricks of Crude Iron ore, 1 Young Plains Cat Scalp and 1 Lock of Scarecrow Straw. Once you hand me these items I will create your very own Breastplate of the Rainkeeper. Don't forget I have a final $favor to ask of you.");
}
if($text =~ /favor/i) {
$client->Message(14,"In the past I have sent some of my finest messengers to Qeynos Hills to deliver messages to the Sayers about current events in Qeynos. However the last few I have sent did not return so I began to look into what might have happened when I received word that the Bloodsabers had claimed responsibility for the slayings. I must ask that you bring me the head of a certain Bloodsaber who I think is responsible for the $slayings.");
}
if($text =~ /slayings/i) {
$client->Message(14,"I have reason to believe that Tovax Vmar is behind this, a dreaded necromancer that has been known to prowl the hills. Having Tovax dead will surely send a message to the Bloodsabers to tread lightly for their days are numbered. If you are able to find Tovax return to me his necklace along with 2 Enchanted Wisp Globes and I will reward you with a weapon suitable for a true knight of Karana.");
}
}

sub EVENT_ITEM {
if (plugin::check_handin(\%itemcount, 27414 => 1, 27415 => 2)) {
quest::summonitem(27488);
quest::ding(); quest::exp(500);
$client->Message(14,"Good! Now the Bloodsabers know that Karana will not allow them to live forever! Here, take this to aid you.");
}
elsif(plugin::check_handin(\%itemcount, 19630 =>2, 27386 =>1, 13264 =>1 )) {
$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take this helm as a reward!"); #Helm handin
quest::ding(); quest::exp(1000);
quest::summonitem(27330);
quest::faction( 135,3 );
quest::faction( 183,3 );
quest::faction( 257,3 );
quest::faction( 21,-3 );
}
elsif(plugin::check_handin(\%itemcount, 19630 =>2, 27387 =>1, 9130 =>1 )) {
$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take this bracer as a reward!"); #Bracer handin
quest::ding(); quest::exp(1000);
quest::summonitem(27331);
quest::faction( 135,3 );
quest::faction( 183,3 );
quest::faction( 257,3 );
quest::faction( 21,-3 );
}
elsif(plugin::check_handin(\%itemcount, 19630 =>2, 27388 =>1, 13002 =>1 )) {
$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take these armguards as a reward!"); #Armguards handin
quest::ding(); quest::exp(1000);
quest::summonitem(27332);
quest::faction( 135,3 );
quest::faction( 183,3 );
quest::faction( 257,3 );
quest::faction( 21,-3 );
}
elsif(plugin::check_handin(\%itemcount, 19630 =>2, 13026 =>1, 13915 =>1 )) {
$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take these boots as a reward!"); #Boots handin
quest::ding(); quest::exp(1000);
quest::summonitem(27333);
quest::faction( 135,3 );
quest::faction( 183,3 );
quest::faction( 257,3 );
quest::faction( 21,-3 );
}
elsif(plugin::check_handin(\%itemcount, 19630 =>2, 9910 =>1, 27412 =>1 )) {
$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take these greaves as a reward!"); #Greaves handin
quest::ding(); quest::exp(1000);
quest::summonitem(27334);
quest::faction( 135,3 );
quest::faction( 183,3 );
quest::faction( 257,3 );
quest::faction( 21,-3 );
}
elsif(plugin::check_handin(\%itemcount, 19630 =>2, 13757 =>1, 12100 =>1 )) {
$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take these gauntlets as a reward!"); #Gauntlets handin
quest::ding(); quest::exp(1000);
quest::summonitem(27335);
quest::faction( 135,3 );
quest::faction( 183,3 );
quest::faction( 257,3 );
quest::faction( 21,-3 );
}
elsif(plugin::check_handin(\%itemcount, 19630 =>2, 9905 =>1, 27411 =>1 )) {
$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take this breastplate as a reward!"); #Breastplate handin
quest::ding(); quest::exp(1000);
quest::summonitem(27336);
quest::faction( 135,3 );
quest::faction( 183,3 );
quest::faction( 257,3 );
quest::faction( 21,-3 );
}
elsif(plugin::return_items(\%itemcount)) {
$client->Message(14,"I don't need these, please take them back, This is NOT what i asked for...");
}
}
#END of FILE Zone:qeynos ID:1018 -- Miltiades_Tal`Azroth 