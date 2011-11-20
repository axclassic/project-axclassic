######################################
## NPC: Morgalanth_Tal'Raeloen ##
## Zone: NeriakB ##
## Enc-Mag-Wiz Newbie Quests ##
## Revised by caved for AX-CLASSIC ##
## EQWorld Server ##
######################################
sub EVENT_SAY {
my $prove = quest::saylink("prove", 1);
my $craft = quest::saylink("craft", 1);
my $ingredients = quest::saylink("ingredients", 1);
my $understand = quest::saylink("understand", 1);
my $scullcaps = quest::saylink("Scullcaps", 1);
my $bracers = quest::saylink("Bracers", 1);
my $sandals = quest::saylink("Sandals", 1);
my $sleeves = quest::saylink("Sleeves", 1);
my $trousers = quest::saylink("Trousers", 1);
my $gloves = quest::saylink("Gloves", 1);
my $robes = quest::saylink("Robes", 1);
my $final = quest::saylink("final", 1);
if($text=~/Hail/i) {
$client->Message(14,"Who dares to address me while I am clearly busy reviewing my daily research. I sure hope this is important $name, I do not have time to waste on just any initate of House Spurned. Not a single day goes by that I do not come face to face with cannon fodder that is not even worthy of a headstone in our burial grounds. If you wish to $prove yourself then I might be in a generous mood.");
}
if($text=~/prove/i) {
$client->Message(14,"I must admit this is not the first time I have heard someone say that nor will it be the last, however I am wiling to give you a chance. First thing we will need to do is get some clothes on your back if you wish to survive for any amount of time. If you are a young Wizard, Enchanter or Magician of House Spurned then I just might be able to $craft some armour pieces for you.");
}
if($text=~/craft/i) {
$client->Message(14,"'The Mystical Sewing kit that I have created is one that is able to fashion a material used for crafting clothes worn by all Initates of House Spurned. All that is required are Cloaks worn by Lightwalkers that plague our Forest to this very day. If you are to take my task and seek vegenence on this inferior group of Arcane lightwalkers you will pride your house along with gathering one of the key $ingredients for your armor. I have heard rumor that they have tried to generate some kind of magic from a source shrouded by our forest.");
}
if($text=~/ingredients/i) {
$client->Message(14,"You will be given different combination recipes for whichever armor piece you want me to craft. Just get the items that i ask of you and hand them over so i can craft the armour piece for you. Do you $understand the instructions I have just given you?");
}
if($text=~/understand/i) {
if ($race == 'dark elf'){
$client->Message(14,"'Very well $name, I can craft Spurned Initiate $scullcaps, $bracers, $sandals, $sleeves, $trousers, $gloves and $robes. When you feel you are ready to gather the items necessary for me to craft your armor simply tell me which piece you want me to craft. The items that you will need to collect will mostly be found in the Forest but some will be here in town. As I said before seek out the Arcane Lightwalkers to collect the cloaks that you will need so I can make the armour. I look forward to seeing what you will make of this opportunity. After you got your armour i have 1 $final task for you");
}
else {
$client->Message(14,"You are no member of House Spurned. Begone!"); #text made up, I have no record of what's said if you're not an inkie chanter/wizzy/mag
}
}
if($text=~/scullcaps/i) {
$client->Message(14,"If you want me to create a Skullcap of The Spurned Innitiate for you, you need to bring me: 2 Blood Drenched Cloaks, 1 Ruined Ash Drakeling Scale and 1 Bone Chip. Once you hand me these items I will create your very own Skullcap of the Spurned Initiate.");
}
if($text=~/bracers/i) {
$client->Message(14,"If you want me to create a Bracer of The Spurned Innitiate for you, you need to bring me: 2 Blood Drenched Cloaks, 1 Tree Snake Fang and 1 Fire beetle Eye. Once you hand me these items I will create your very own Bracer of the Spurned Initiate.");
}
if($text=~/sandals/i) {
$client->Message(14,"If you want me to create a Sandals of The Spurned Innitiate for you, you need to bring me: 2 Blood Drenched Cloaks, 1 Snake Scales and 1 Ruined Bear Pelt. Once you hand me these items I will create your very own Sandals of the Spurned Initiate.");
}
if($text=~/sleeves/i) {
$client->Message(14,"If you want me to create a Sleeves of The Spurned Innitiate for you, you need to bring me: 2 Blood Drenched Cloaks, 1 Fire Beetle Leg and 1 Coyote Skull. Once you hand me these items I will create your very own Sleeves of the Spurned Initiate.");
}
if($text=~/trousers/i) {
$client->Message(14,"If you want me to create a Trousers of The Spurned Innitiate for you, you need to bring me: 2 Blood Drenched Cloaks, 1 Deathfist Legionnaire Scalp and 1 Ruined Wolf Pelt. Once you hand me these items I will create your very own Trousers of the Spurned Initiate.");
}
if($text=~/gloves/i) {
$client->Message(14,"If you want me to create a Gloves of The Spurned Innitiate for you, you need to bring me:t 2 Blood Drenched Cloaks, 1 Garter Snake Tongue and 1 Spiderling Silk. Once you hand me these items I will create your very own Gloves of the Spurned Initiate.");
}
if($text=~/robes/i) {
$client->Message(14,"It brings me great pleasure to see that your training has come this far $name, for your House Spurned Ceremonial Gown you will need to collect 1 Blood Drenched Cloak, 1 Woven Spider Silk, 1 Halfling Foot Bones and 1 Large Snake Skin. Once you hand me these items I will create your very own Robe of the Spurned Initiate. Please return to me should you succeed in this task, I have one $final test for you in mind.");
}
if($text=~/final/i) {
$client->Message(14,"Well, I must say that I did not expect you to progress in your training at the rate you have. I also knew there was something that separated you from our other initiates. For your final test, I will need you to execute three specific Orc Chieftans in the Nektulos forest. Bring me the Prayer beads of all three Orc Chieftans. These Orc Chieftans are the heads of each Orc camp and will be heavily guarded, so I would suggest bringing any friends you have made that are somewhat proficient on the battlefield to assist you. They have caused my house many problems and it is time that they are put to rest. You have come too far to fail me now. I hope to see you soon...alive, that is.");
}
}

sub EVENT_ITEM {
if (plugin::check_handin(\%itemcount, 22642 => 1, 22643 => 1, 22644 => 1)) {
$client->Message(14,"Your prowess both in the classroom and on the battlefield has certainly amazed me. Please take this relic that is only presented to the most dedicated initiates and carry it with pride. You have made your house very proud on this day.");
quest::summonitem(22647); #Ceremonial Dagger of the Spurned
quest::ding(); quest::exp(1000);
}
elsif(plugin::check_handin(\%itemcount, 22620 =>2, 16167 =>1, 13073 =>1 )) {
$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take this cap as a reward!"); #Cap handin
quest::ding(); quest::exp(1000);
quest::summonitem(22635);

}
elsif(plugin::check_handin(\%itemcount, 22620 =>2, 55212 =>1, 10307 =>1 )) {
$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take this bracer as a reward!"); #Bracer handin
quest::ding(); quest::exp(1000);
quest::summonitem(22636);

}
elsif(plugin::check_handin(\%itemcount, 22620 =>2, 13250 =>1, 9130 =>1 )) {
$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take these sleeves as a reward!"); #Sleeves handin
quest::ding(); quest::exp(1000);
quest::summonitem(22638);

}
elsif(plugin::check_handin(\%itemcount, 22620 =>2, 13070 =>1, 13781 =>1 )) {
$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take these sandals as a reward!"); #Sandals handin
quest::ding(); quest::exp(1000);
quest::summonitem(22637);

}
elsif(plugin::check_handin(\%itemcount, 22620 =>2, 16172 =>1, 13782 =>1 )) {
$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take these trousers as a reward!"); #Trousers handin
quest::ding(); quest::exp(1000);
quest::summonitem(22639);

}
elsif(plugin::check_handin(\%itemcount, 22620 =>2, 16168 =>1, 13099=>1 )) {
$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take these gloves as a reward!"); #Gloves handin
quest::ding(); quest::exp(1000);
quest::summonitem(22640);

}
elsif(plugin::check_handin(\%itemcount, 22620 =>1, 9914 =>1, 16183 =>1, 13060 =>1 )) {
$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take this robe as a reward!"); #Robe handin
quest::ding(); quest::exp(1000);
quest::summonitem(22641);

}
else {
$client->Message(14,"I don't need this $name. Take this back.");
plugin::return_items(\%itemcount);
return 1;
}
}