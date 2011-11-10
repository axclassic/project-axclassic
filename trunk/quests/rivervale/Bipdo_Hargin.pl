######################################
## NPC: Bipdo_Hargin ##
## Zone: Rivervale ##
## Halfling Ranger Newbie Quests ##
## Revised by caved for AX-CLASSIC ##
## Revision NR: 1 ##
## EQWorld Server ##
######################################

sub EVENT_SAY {
my $trainees = quest::saylink("trainees", 1);
my $cap = quest::saylink("Cap", 1);
my $bracer = quest::saylink("Bracer", 1);
my $sleeves = quest::saylink("Sleeves ", 1);
my $boots = quest::saylink("Boots", 1);
my $gloves = quest::saylink("Gloves", 1);
my $leggings = quest::saylink("Leggings", 1);
my $tunic = quest::saylink("Tunic", 1);
if($text=~/hail/i) {
$client->Message(14,"I am busy right now. Please leave me alone. Or are you one of Megosh's new $trainees.");
}
if($text=~/trainees/i) {
$client->Message(14,"Pleased to meet you $name! You must be one of Megosh's new trainees. Megosh has asked me to help get you outfitted in a suit of armor to protect you from the vile weapons of Rivervales foes. I have assembled a kit that will allow me to construct the armor pieces, once you have gathered the necessary components just hand them to me. The required components vary according to which piece of Thorn Mail Armor you want me to craft. Do you want me to craft a thorn mail $cap, a Thorn Mail $bracer, Thorn Mail $gloves, Thorn Mail $boots, Thorn Mail $sleeves, Thorn Mail $leggings, or a Thorn Mail $tunic.");
}

if($text=~/cap/i) {
$client->Message(14,"If you want me to create a Thorn Mail Cap for you, you need to bring me: 2 spiderling silks, 1 ruined thorn drakeling scales, and a giant thicket rat skull. Once you hand me these items I will create your very own Thorn Mail Cap.");
}

if($text=~/bracer/i) {
$client->Message(14,"If you want me to create a Thorn Mail Bracer for you, you need to bring me: 2 spiderling silks, 1 rat tooth, and a large fruit bat wing. Once you hand me these items I will create your very ownThorn Mail Bracer.");
}

if($text=~/gloves/i) {
$client->Message(14,"If you want me to create a Thorn Mail Gloves for you, you need to bring me: 2 spiderling silks, 1 Spider Venom Sac, and 1 large fruit bat fur. Once you hand me these items I will create your very own Thorn Mail Gloves.");
}

if($text=~/boots/i) {
$client->Message(14,"If you want me to create a Thorn Mail Boots for you, you need to bring me: 2 spiderling silks, 1 embalming dust, and 1 giant thicket rat pelts. Once you hand me these items I will create your very own Thorn Mail Boots.");
}

if($text=~/sleeves/i) {
$client->Message(14,"If you want me to create a Thorn Mail Sleeves for you, you need to bring me: 2 spiderling silks, 1 large snake skin, and 1 giant fruit bat wing. Once you hand me these items I will create your very own Thorn Mail Sleeves.");
}

if($text=~/leggings/i) {
$client->Message(14,"If you want me to create a Thorn Mail Leggings for you, you need to bring me: 2 spiderling silks, 1 large wood spider tibia and 1 shadow wolf paw. Once you hand me these items I will create your very own Thorn Mail Leggings.");
}

if($text=~/tunic/i) {
$client->Message(14,"If you want me to create a Thorn Mail Tunic for you, you need to bring me: 2 spiderling silks, 1 calcified finger bones and 1 giant fruit bat rib cage. Once you hand me these items I will create your very own Thorn Mail Tunic.");
}
}

sub EVENT_ITEM {
my $cap = quest::saylink("Cap", 1);
my $bracer = quest::saylink("Bracer", 1);
my $sleeves = quest::saylink("Sleeves ", 1);
my $boots = quest::saylink("Boots", 1);
my $gloves = quest::saylink("Gloves", 1);
my $leggings = quest::saylink("Leggings", 1);
my $tunic = quest::saylink("Tunic", 1);
if (plugin::check_handin(\%itemcount, 19627 => 1)) {
$client->Message(14,"Pleased to meet you $name! You must be one of Megosh's new trainees. Megosh has asked me to help get you outfitted in a suit of armor to protect you from the vile weapons of Rivervales foes. I have assembled a kit that will allow me to construct the armor pieces, once you have gathered the necessary components. The required components vary according to which piece of Thorn Mail Armor you want me to craft. Do you want me to craft a Thorn Mail $cap, a Thorn Mail $bracer, Thorn Mail $gloves, Thorn Mail $boots, Thorn Mail $sleeves, Thorn Mail $leggings, or a Thorn Mail $tunic.");
}

elsif(plugin::check_handin(\%itemcount, 13099 =>2, 19612 =>1, 19615 =>1 )) {
$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take this cap as a reward!"); #Cap handin
quest::ding(); quest::exp(1000);
quest::summonitem(19664);
quest::faction(316,5); # +Storm Reapers
quest::faction(208,5); # +Mayor Gubbin
quest::faction(218,5); # +Merchants of Rivervale
quest::faction(347,-5); # -Unkempt Druids
}

elsif(plugin::check_handin(\%itemcount, 13099 =>2, 13264 =>1, 19616 =>1 )) {
$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take this bracer as a reward!"); #Bracer handin
quest::ding(); quest::exp(1000);
quest::summonitem(19667);
quest::faction(316,5); # +Storm Reapers
quest::faction(208,5); # +Mayor Gubbin
quest::faction(218,5); # +Merchants of Rivervale
quest::faction(347,-5); # -Unkempt Druids
}

elsif(plugin::check_handin(\%itemcount, 13099 =>2, 14018 =>1, 19618 =>1 )) {
$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take these gloves as a reward!"); #Gloves handin
quest::ding(); quest::exp(1000);
quest::summonitem(19668);
quest::faction(316,5); # +Storm Reapers
quest::faction(208,5); # +Mayor Gubbin
quest::faction(218,5); # +Merchants of Rivervale
quest::faction(347,-5); # -Unkempt Druids
}

elsif(plugin::check_handin(\%itemcount, 13099 =>2, 16990 =>1, 19620 =>1 )) {
$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take these boots as a reward!"); #Boots handin
quest::ding(); quest::exp(1000);
quest::summonitem(19670);
quest::faction(316,5); # +Storm Reapers
quest::faction(208,5); # +Mayor Gubbin
quest::faction(218,5); # +Merchants of Rivervale
quest::faction(347,-5); # -Unkempt Druids
}

elsif(plugin::check_handin(\%itemcount, 13099 =>2, 13060 =>1, 19617 =>1 )) {
$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take these sleeves as a reward!"); #Sleeves handin
quest::ding(); quest::exp(1000);
quest::summonitem(19666);
quest::faction(316,5); # +Storm Reapers
quest::faction(208,5); # +Mayor Gubbin
quest::faction(218,5); # +Merchants of Rivervale
quest::faction(347,-5); # -Unkempt Druids
}

elsif(plugin::check_handin(\%itemcount, 13099 =>2, 19655 =>1, 27412 =>1 )) {
$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take these leggings as a reward!"); #Leggings handin
quest::ding(); quest::exp(1000);
quest::summonitem(19669);
quest::faction(316,5); # +Storm Reapers
quest::faction(208,5); # +Mayor Gubbin
quest::faction(218,5); # +Merchants of Rivervale
quest::faction(347,-5); # -Unkempt Druids
}

elsif(plugin::check_handin(\%itemcount, 13099 =>2, 16180 =>1, 19621 =>1 )) {
$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take this tunic as a reward! You have done a good job equiping yourself young $class, now go back to Megosh and hand him the note back so he can give it to other tranees, he will know you will be comming for your final task."); #tunic handin and followup weapons quest ---> Bring the note back
quest::ding(); quest::exp(1000);
quest::summonitem(19665);
quest::summonitem(19627);
quest::faction(316,5); # +Storm Reapers
quest::faction(208,5); # +Mayor Gubbin
quest::faction(218,5); # +Merchants of Rivervale
quest::faction(347,-5); # -Unkempt Druids
}

else{
(plugin::return_items(\%itemcount));
$client->Message(14,"I don't need these, please take them back, This is NOT what i asked for...");
}
}