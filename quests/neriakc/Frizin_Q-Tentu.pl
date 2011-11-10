######################################
## NPC: Frizin_Q'Tentu ##
## Zone: NeriakC ##
## Necromancer Newbie quests ##
## Added by caved for AX-CLASSIC ##
## EQWorld Server ##
######################################

sub EVENT_SAY {
my $training = quest::saylink("training", 1);
my $collecting = quest::saylink("collecting", 1);
my $forging = quest::saylink("forging", 1);
my $caps = quest::saylink("Caps", 1);
my $bracers = quest::saylink("Bracers", 1);
my $sleeves = quest::saylink("Sleeves", 1);
my $sandals = quest::saylink("Sandals", 1);
my $trousers = quest::saylink("Trousers", 1);
my $gloves = quest::saylink("Gloves", 1);
my $robes = quest::saylink("Robes", 1);
my $favor = quest::saylink("favor", 1);

if($text=~/Hail/i){
$client->Message(14,"Pleased to meet you $name. I am Frizin Q'Tentu Necromancer Guildmaster. Yes Xon told me a new recruit was comming today ready for training. We receive many new recruits every day and it is my duty to place them in my $training program.");
}
if($text=~/training/i){
$client->Message(14,"Well all young Necromancers of Innoruuk are brought up from their first day of training to know and respect their practice. I have developed a number of exercises that will enable a young necromancer to obtain a set of their own armor by means of $collecting certain items and handing them to me.");
}
if($text=~/collecting/i){
$client->Message(14,"Recently we have discovered that combining certain items in certain quantities using a magical assembly kit can forge together an armor piece. These armor pieces are called Unholy Silk Armor. If you would like me to begin $forging armor pieces, please tell me.");
}
if($text=~/forging/i){
$client->Message(14,"Excellent $name, please tell me what piece to craft for you, I can make $caps, $bracers, $sleeves, $sandals, $trousers, $gloves and $robes. When you are ready to gather the items for an armor piece simply tell me what piece you want me to craft. When you are ready just hand me the items needed. After you get your armour i would like you to do me one last $favor");
}
if($text=~/caps/i){
$client->Message(14,"If you want me to create a Unholy Silk Cap for you, you need to bring me: 2 Woven Spider Silks, 1 Blood Drenched Cloak, 1 Spiderling eye. Once you hand me these items I will create your very own Unholy Silk Cap.");
}
if($text=~/bracers/i){
$client->Message(14,"If you want me to create a Unholy Silk Bracer for you, you need to bring me: 2 Woven Spider Silks, 1 Ruined Ash Drakeling Scales, 1 Halfling Ulna . Once you hand me these items I will create your very own Unholy Silk Bracer.");

}
if($text=~/sleeves/i){
$client->Message(14,"If you want me to create a Unholy Silk Sleeves for you, you need to bring me: 2 Woven Spider Silks, 1 Ruined Bear Pelt, and 1 Torch. Once you hand me these items I will create your very own Unholy Silk Sleeves.");
}
if($text=~/sandals/i){
$client->Message(14,"If you want me to create a Unholy Silk Sandals for you, you need to bring me: 2 Woven Spider Silks, 1 Giant Snake Fang, 1 Deathfist Orc Skull. Once you hand me these items I will create your very own Unholy Silk Sandals.");
}
if($text=~/trousers/i){
$client->Message(14,"If you want me to create a Unholy Silk Trousers for you, you need to bring me: 2 Woven Spider Silks, 1 Orc Skull and 1 Shadow Wolf Paw. Once you hand me these items I will create your very own Unholy Silk Trousers.");
}
if($text=~/gloves/i){
$client->Message(14,"If you want me to create a Unholy Silk gloves for you, you need to bring me: 2 Woven Spider Silks, 1 Puma Skin and 1 Snake Egg. Once you hand me these items I will create your very own Unholy Silk Gloves.");
}
if($text=~/robes/i){
$client->Message(14,"If you want me to create a Unholy Silk Robe for you, you need to bring me: 2 Woven Spider Silks, 1 Deathfist Templar Scalp and 1 Human Blood. Once you hand me these items I will create your very own Unholy Silk Robe. Don't forget I have a final $favor to ask of you.");
}
if($text=~/favor/i){
$client->Message(14,"I thank you for returning to assist me in this very important task. It has come to my attention that the undead in Nektulos got out of control. Them pets seem to forget who their bosses are; WE ARE!! We better eleminate them before they do any real damage. To prove that you have killed those menaces bring me 4 Calcified Finger Bones and you will be rewarded accordingly, now GO!");
}
}

sub EVENT_ITEM {
if(plugin::check_handin(\%itemcount, 16180 =>4 )) {
$client->Message(14,"Congratulations, $name! This will allow us to regain control over our pets. Take this staff as a reward!"); #staff handin
quest::ding(); quest::exp(1000);
quest::summonitem(6335);
quest::faction(322,10);
quest::faction(268,10);
quest::faction(177,-30);
quest::faction(170,-30);
quest::faction(91,-30);
quest::faction(260,-30);
}
elsif(plugin::check_handin(\%itemcount, 9914 =>2, 22620 =>1, 13253 =>1 )) {
$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take this cap as a reward!"); #Cap handin
quest::ding(); quest::exp(1000);
quest::summonitem(22590);
quest::faction(322,10);
quest::faction(268,10);
quest::faction(177,-30);
quest::faction(170,-30);
quest::faction(91,-30);
quest::faction(260,-30);
}
elsif(plugin::check_handin(\%itemcount, 9914 =>2, 16167 =>1, 16189 =>1 )) {
$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take this bracer as a reward!"); #Bracer handin
quest::ding(); quest::exp(1000);
quest::summonitem(22591);
quest::faction(322,10);
quest::faction(268,10);
quest::faction(177,-30);
quest::faction(170,-30);
quest::faction(91,-30);
quest::faction(260,-30);
}
elsif(plugin::check_handin(\%itemcount, 9914 =>2, 13781 =>1, 13002 =>1 )) {
$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take these sleeves as a reward!"); #Sleeves handin
quest::ding(); quest::exp(1000);
quest::summonitem(22593);
quest::faction(322,10);
quest::faction(268,10);
quest::faction(177,-30);
quest::faction(170,-30);
quest::faction(91,-30);
quest::faction(260,-30);
}
elsif(plugin::check_handin(\%itemcount, 9914 =>2, 7005 =>1, 9943 =>1 )) {
$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take these sandals as a reward!"); #Sandals handin
quest::ding(); quest::exp(1000);
quest::summonitem(22592);
quest::faction(322,10);
quest::faction(268,10);
quest::faction(177,-30);
quest::faction(170,-30);
quest::faction(91,-30);
quest::faction(260,-30);
}
elsif(plugin::check_handin(\%itemcount, 9914 =>2, 16174 =>1, 27412 =>1 )) {
$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take these trousers as a reward!"); #Trousers handin
quest::ding(); quest::exp(1000);
quest::summonitem(22594);
quest::faction(322,10);
quest::faction(268,10);
quest::faction(177,-30);
quest::faction(170,-30);
quest::faction(91,-30);
quest::faction(260,-30);
}
elsif(plugin::check_handin(\%itemcount, 9914 =>2, 13757 =>1, 13088 =>1 )) {
$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take these gloves as a reward!"); #Gloves handin
quest::ding(); quest::exp(1000);
quest::summonitem(22595);
quest::faction(322,10);
quest::faction(268,10);
quest::faction(177,-30);
quest::faction(170,-30);
quest::faction(91,-30);
quest::faction(260,-30);
}
elsif(plugin::check_handin(\%itemcount, 9914 =>2, 16173 =>1, 22514 =>1 )) {
$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take this robe as a reward!"); #Robe handin
quest::ding(); quest::exp(1000);
quest::summonitem(22596);
quest::faction(322,10);
quest::faction(268,10);
quest::faction(177,-30);
quest::faction(170,-30);
quest::faction(91,-30);
quest::faction(260,-30);
}
elsif(plugin::return_items(\%itemcount)) {
$client->Message(14,"I don't need these, please take them back, This is NOT what i asked for...");
}
}
#END of FILE Zone:NeriakC -- Frizin_Q'Tentu