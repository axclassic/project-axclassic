######################################
## NPC: Seta_Bakindo ##
## Zone: Quenos2 ##
## Revised by caved for AX-CLASSIC ##
## EQWorld Server ##
######################################

sub EVENT_SAY {
my $text1 = quest::saylink("tests", 1)
;
my $text2 = quest::saylink("ready", 1)
;
my $caps = quest::saylink("Caps", 1)
;
my $bracers = quest::saylink("Bracers", 1)
;
my $sleeves = quest::saylink("Sleeves", 1)
;
my $sandals = quest::saylink("Sandals", 1)
;
my $trousers = quest::saylink("Trousers", 1)
;
my $gloves = quest::saylink("Gloves", 1)
;
my $robes = quest::saylink("Robes", 1)
;
my $problem = quest::saylink("problem", 1)
;
my $silent = quest::saylink("silent", 1)
;
my $tomer = quest::saylink("Tomer", 1)
;
my $find = quest::saylink("find", 1)
;
my $rescued = quest::saylink("rescued", 1)
;

if ($text=~/Hail/i){
$client->Message(14,"Ah.. Welcome friend. I am master Seta, of the Silent Fist Clan. We know that true strength lies inside your soul. Once you have found and mastered it, your fists will be deadlier than any blade. I am also currently in charge of training our new recruits. If you are a new monk of the Silent Fist I have some $text1 for you to complete.");


}

if ($text=~/tests/i){
$client->Message(14,"I pride myself on passing some of the finest monks in all of the lands through my testing halls. I mainly attribute this fact to my training program that all young monks must undergo. Are you $text2 to begin?");

}

if ($text=~/ready/i){
$client->Message(14,"Be mindful of your surroundings $name, it is here in Qeynos and in the adventuring areas surround it, were you can find all the necessary items you will have to give me, so i can craft Armor of the Silent Fist for you. When you are ready to collect the items for a specific armor pieces please tell me what armor piece you want me to craft. I can craft: $caps, $bracers, $sleeves, $sandals, $trousers, $gloves and $robes. We also have another $problem we need your help with $name. Were you the $class asking about $tomer Instogle");

}

if ($text=~/caps/i){
$client->Message(14,"To create your Cap of the Silent Fist, you will need to bring me: 1 Woven Spider Silks, 1 Skeleton Tibia, 1 Field Rat Skull and a Cloth Cap. Once you hand me these items I will create your very own Cap of the Silent Fist.");
}

if ($text=~/Bracers/i){
$client->Message(14,"To create your Bracer of the Silent Fist, you will need to bring me: 1 Woven Spider Silk, 1 Rat Whisker, 1 Gnoll Jawbone and a Cloth Wristband. Once you hand me these items I will create your very own Bracer of the Silent Fist.");


}

if ($text=~/sleeves/i){
$client->Message(14,"To create your Sleeves of the Silent Fist you will need to bring me: 1 Woven Spider Silk, 2 Rabid Wolf Hides, and Cloth Sleeves. Once you hand me these items I will create your very own Sleeves of the Silent Fist.");

}

if ($text=~/sandals/i){
$client->Message(14,"To create your Sandals of the Silent Fist you will need to bring me: 1 Woven Spider Silk, 1 Gnoll Backbone, 1 Bone Chip and Cloth Sandals. Once you hand me these items I will create your very own Sandals of the Silent Fist.");

}

if ($text=~/Trousers/i){
$client->Message(14,"To create your Trousers of the Silent Fist you will need to bring me: 1 Woven Spider Silk, 1 Bandit Sash, 1 Matted Greater Cat Pelt and 1 Giant Spider Egg Sack. Once you hand me these items I will create your very own Trousers of the Silent Fist.");

}

if ($text=~/Gloves/i){
$client->Message(14,"To create your Gloves of the Silent Fist you will need need to bring me: 1 Woven Spider Silks, 1 Giant Fire Beetle Eye, 1 Chunk of Meat and 1 Young Puma Skin. Once you hand me these items I will create your very own Gloves of the Silent Fist.");

}

if ($text=~/Robe/i){
$client->Message(14,"To create your Robe of the Silent Fist you will need to bring me: 1 Woven Spider Silks, 1 High Quality Cat Pelt, 1 Shadow Wolf Paw, 1 Severed Gnoll Foot. Once you hand me these items I will create your very own Robe of the Silent Fist. Please come see me after you have completed your robe. I need to see you for some help with a $problem our clan has been having.");
}

if ($text=~/problem/i){
$client->Message(14,"There have been numerous muggings lately in Qeynos by corrupt guards. These guards are sworn to protect, server and uphold law in the city but all the do is break the law ten fold themselves. These corrupt individuals must be stopped. I have a $silent Fist clan member that I feel may be in trouble.");

}

if ($text=~/silent/i){
$client->Message(14,"Konem Matse is my friend and mentor, he resides in Qeynos Hills providing security for the Sayers there. Lately though I have heard reports of guards demanding he pay them tax or else. This tax they speak of does not exist. I need you to go to the hills and help Konem. Rid the lands of these corrupt guards and bring me their heads as proof. I will also need 1 High Quality Gnoll Fur for a tailoring project I have been working on. Return to me with these items and you will be rewarded for your troubles.");

}

if ($text=~/Tomer/i){
$client->Message(14,"Oh, Tomer? We haven't heard from him in days, I'm really starting to worry. . . We need to have someone go $find him. Tell me when you $rescued Tomer.");

}

if ($text=~/find/i){
$client->Message(14,"One of our clan brothers has not reported back in over three days. He was sent to help defend the Qeynos Gates, and we haven't heard from him since. We need you to find him, if he is still alive. Tell him that Seta has sent you to find him, and escort him back to our guild. Good luck.");

}

if (($text=~/rescued/i)){

quest::flagcheck(30,1);

if($returnflag == 1){

$client->Message(14,"Great work $name, we thought that was the last we'd seen of young Tomer.");

quest::flagnpc(30,2);

quest::flagcheck(30,1);
}

}
}

sub EVENT_ITEM {
if(plugin::check_handin(\%itemcount, 27426 =>1, 27427 =>1 )) {
quest::summonitem("27494");

quest::faction("2082","1");

quest::faction("2084","1");

quest::faction("2030","1");

quest::ding(); quest::exp("1000");

}
elsif(plugin::check_handin(\%itemcount, 9914 =>1, 27390 =>1, 10152 =>1, 27387 =>1 )) {
$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take this cap as a reward!"); #Cap handin
quest::ding(); quest::exp(1000);
quest::summonitem(27372);
quest::faction( 135,3 );
quest::faction( 183,3 );
quest::faction( 257,3 );
quest::faction( 21,-3 );
}
elsif(plugin::check_handin(\%itemcount, 9914 =>1, 13071 =>1, 27392 =>1, 1009 =>1 )) {
$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take this bracer as a reward!"); #Bracer handin
quest::ding(); quest::exp(1000);
quest::summonitem(27373);
quest::faction( 135,3 );
quest::faction( 183,3 );
quest::faction( 257,3 );
quest::faction( 21,-3 );
}
elsif(plugin::check_handin(\%itemcount, 9914 =>1, 27403 =>2, 1008 =>1 )) {
$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take these sleeves as a reward!"); #Sleeves handin
quest::ding(); quest::exp(1000);
quest::summonitem(27374);
quest::faction( 135,3 );
quest::faction( 183,3 );
quest::faction( 257,3 );
quest::faction( 21,-3 );
}
elsif(plugin::check_handin(\%itemcount, 9914 =>1, 27405 =>1, 13073 =>1, 1012 =>1 )) {
$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take these sandals as a reward!"); #Sandals handin
quest::ding(); quest::exp(1000);
quest::summonitem(27375);
quest::faction( 135,3 );
quest::faction( 183,3 );
quest::faction( 257,3 );
quest::faction( 21,-3 );
}
elsif(plugin::check_handin(\%itemcount, 9914 =>1, 12100 =>1, 9913 =>1, 9904 =>1 )) {
$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take these trousers as a reward!"); #Trousers handin
quest::ding(); quest::exp(1000);
quest::summonitem(27376);
quest::faction( 135,3 );
quest::faction( 183,3 );
quest::faction( 257,3 );
quest::faction( 21,-3 );
}
elsif(plugin::check_handin(\%itemcount, 9914 =>1, 13251 =>1, 13085 =>1, 9906 =>1 )) {
$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take these gloves as a reward!"); #Gloves handin
quest::ding(); quest::exp(1000);
quest::summonitem(27377);
quest::faction( 135,3 );
quest::faction( 183,3 );
quest::faction( 257,3 );
quest::faction( 21,-3 );
}
elsif(plugin::check_handin(\%itemcount, 9914 =>1, 12086 =>1, 27412 =>1, 27409 =>1 )) {
$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take this robe as a reward!"); #Robe handin
quest::ding(); quest::exp(1000);
quest::summonitem(27378);
quest::faction( 135,3 );
quest::faction( 183,3 );
quest::faction( 257,3 );
quest::faction( 21,-3 );
}
else {
#do all other handins first with plugin, then let it do disciplines
plugin::try_tome_handins(\%itemcount, $class, 'Monk');

plugin::return_items(\%itemcount);

}

}

#END of FILE Zone:qeynos2 ID:2078 -- Seta_Bakindo
