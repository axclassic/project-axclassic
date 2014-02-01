######################################
## NPC: Vansted_Rohenga ##
## Zone: Quenos2 ##
## Revised by caved for AX-CLASSIC ##
## EQWorld Server ##
######################################

sub EVENT_SAY {
my $text1 = quest::saylink("training", 1);
my $text2 = quest::saylink("collecting", 1);
my $text3 = quest::saylink("forging", 1);
my $helms = quest::saylink("Helms", 1);
my $bracers = quest::saylink("Bracers", 1);
my $armguards = quest::saylink("Armguards", 1);
my $boots = quest::saylink("Boots", 1);
my $greaves = quest::saylink("Greaves", 1);
my $gauntlets = quest::saylink("Gauntlets", 1);
my $breastplates = quest::saylink("Breastplates", 1);
my $favor = quest::saylink("favor", 1);
my $documents = quest::saylink("Documents", 1);

if($text=~/Hail/i){
$client->Message(14, "Pleased to meet you $name. I am Vansted Rohenga High Priest of Karana. I have spent all of my years studying the ways of the Cleric in our wonderful Temple of Thunder. We
receive many new recruits every day and it is my duty to place them in my $text1 program.");
}
if($text=~/training/i){
$client->Message(14,"Well all young clerics of Karana are brought up from their first day of training to know and respect their practice. I have developed a number of exercises that will enable a
young cleric to make a set of their own armor by means of $text2 certain items and handing them to me.");
}
if($text=~/collecting/i){
$client->Message(14,"Recently we have discovered that combing certain items in certain quantities using a magical assembly kit can forge together an armor piece. These armor pieces are called
Enchanted Stormhealer Armor. If you would like me to begin $text3 armor pieces, please tell me.");
}
if($text=~/forging/i){
$client->Message(14,"Excellent $name, please tell me what piece to craft for you, I can make $helms, $bracers, $armguards, $boots, $greaves, $gauntlets and $breastplates. When you are ready to gather the items for an armor piece simply tell me what piece you want me to craft. When you are ready just hand me the items needed. After you get your armour i would like you to do me one last $favor");
}
if($text=~/helms/i){
$client->Message(14,"If you want me to create a Helm of the Stormhealer for you, you need to bring me: 2 Bricks of Crude Iron ore, 1 Field Rat Ribcage, 1 Rat Tooth. Once you hand me these items I will create your very own Helm of the Stormhealer.");
}
if($text=~/bracers/i){
$client->Message(14,"If you want me to create a Bracer of the Stormhealer for you, you need to bring me: 2 Bricks of Crude Iron ore, 1 Field Rat Skull, 1 Coyote Skull. Once you hand me these items
I will create your very own Bracer of the Stormhealer.");
}
if($text=~/armguards/i){
$client->Message(14,"If you want me to create a Armguards of the Stormhealer for you, you need to bring me: 2 Bricks of Crude Iron ore, 1 Whiskered Bat Fangs, and 1 Torch. Once you hand me these
items I will create your very own Armguards of the Stormhealer.");
}
if($text=~/boots/i){
$client->Message(14,"If you want me to create a Boots of the Stormhealer for you, you need to bring me: 2 Bricks of Crude Iron ore, 1 Ruined Blackburrow Gnoll Pelt, 1 Gnoll Fangs. Once you hand me these items I will create your very own Boot of the Stormhealer.");
}
if($text=~/greaves/i){
$client->Message(14,"If you want me to create a Greaves of the Stormhealer for you, you need to bring me: 2 Bricks of Crude Iron ore, 1 Giant Fire Beetle Brain and 1 Shadow Wolf Paw. Once you hand
me these items I will create your very own Greaves of the Stormhealer.");
}
if($text=~/gauntlets/i){
$client->Message(14,"If you want me to create a Gauntlets of the Stormhealer for you, you need to bring me: 2 Bricks of Crude Iron ore, 1 Puma Skin and 1 Bandit Sash. Once you hand me these items
I will create your very own Gauntlets of the Stormhealer.");
}
if($text=~/breastplates/i){
$client->Message(14,"If you want me to create a Breastplate of the Stormhealer for you, you need to bring me: 2 Bricks of Crude Iron ore, 1 Young Plains Cat Scalp and 1 Lock of Scarecrow Straw.
Once you hand me these items I will create your very own Breastplate of the Stormhealer. Don't forget I have a final $favor to ask of you.");
}
if($text=~/favor/i){
$client->Message(14,"I thank you for returning to assist me in this very important task. It has come to my attention that the gnolls of Blackburrow are planning an attack on Qeynos sometime in the
near future. Although I know that these hairballs posses no actual fighting skills, they can present a problem for the defenders of our city just due to sheer numbers. I need you to infiltrate Blackburrow and retrieve some important $documents for me.");
}
if($text=~/documents/i){
$client->Message(14,"There is a believed to be a gnoll tactician somewhere in the gnoll camp of Blackburrow. I need you to bring whatever battle plans he may be in possession of so that I can
position my troops accordingly. Return to me with whatever battle plans you can find along with 2 Gnoll Backbones and I will surely reward you for your dedication."); }
}
sub EVENT_ITEM {
if(plugin::check_handin(\%itemcount, 27416 =>1, 27405 =>2 )) {
$client->Message(14,"Congratulations, $name! Your dedication and hard work will allow me to position my troops accordingly. Take this mace as a reward!"); #ad lib text
quest::ding(); quest::exp(1000);
quest::summonitem(27489);
quest::faction( 135,3 );
quest::faction( 183,3 );
quest::faction( 257,3 );
quest::faction( 21,-3 );
}
elsif(plugin::check_handin(\%itemcount, 19630 =>2, 27386 =>1, 13264 =>1 )) {
$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take this helm as a reward!"); #Helm handin
quest::ding(); quest::exp(1000);
quest::summonitem(27337);
quest::faction( 135,3 );
quest::faction( 183,3 );
quest::faction( 257,3 );
quest::faction( 21,-3 );
}
elsif(plugin::check_handin(\%itemcount, 19630 =>2, 27387 =>1, 9130 =>1 )) {
$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take this bracer as a reward!"); #Bracer handin
quest::ding(); quest::exp(1000);
quest::summonitem(27338);
quest::faction( 135,3 );
quest::faction( 183,3 );
quest::faction( 257,3 );
quest::faction( 21,-3 );
}
elsif(plugin::check_handin(\%itemcount, 19630 =>2, 27388 =>1, 13002 =>1 )) {
$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take these armguards as a reward!"); #Armguards handin
quest::ding(); quest::exp(1000);
quest::summonitem(27339);
quest::faction( 135,3 );
quest::faction( 183,3 );
quest::faction( 257,3 );
quest::faction( 21,-3 );
}
elsif(plugin::check_handin(\%itemcount, 19630 =>2, 13026 =>1, 13915 =>1 )) {
$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take these boots as a reward!"); #Boots handin
quest::ding(); quest::exp(1000);
quest::summonitem(27340);
quest::faction( 135,3 );
quest::faction( 183,3 );
quest::faction( 257,3 );
quest::faction( 21,-3 );
}
elsif(plugin::check_handin(\%itemcount, 19630 =>2, 9910 =>1, 27412 =>1 )) {
$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take these greaves as a reward!"); #Greaves handin
quest::ding(); quest::exp(1000);
quest::summonitem(27341);
quest::faction( 135,3 );
quest::faction( 183,3 );
quest::faction( 257,3 );
quest::faction( 21,-3 );
}
elsif(plugin::check_handin(\%itemcount, 19630 =>2, 13757 =>1, 12100 =>1 )) {
$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take these gauntlets as a reward!"); #Gauntlets handin
quest::ding(); quest::exp(1000);
quest::summonitem(27342);
quest::faction( 135,3 );
quest::faction( 183,3 );
quest::faction( 257,3 );
quest::faction( 21,-3 );
}
elsif(plugin::check_handin(\%itemcount, 19630 =>2, 9905 =>1, 27411 =>1 )) {
$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take this breastplate as a reward!"); #Breastplate handin
quest::ding(); quest::exp(1000);
quest::summonitem(27343);
quest::faction( 135,3 );
quest::faction( 183,3 );
quest::faction( 257,3 );
quest::faction( 21,-3 );
}
elsif(plugin::return_items(\%itemcount)) {
$client->Message(14,"I don't need these, please take them back, This is NOT what i asked for...");
}
}
#END of FILE Zone:qeynos ID:1135 -- Vansted_Rohenga

