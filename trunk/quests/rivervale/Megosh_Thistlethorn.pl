######################################
## NPC: Megosh_Thistlethorn ##
## Zone: Rivervale ##
## Halfling Ranger GM ##
## Moss Toe Armor and Guild Summons ##
## Revised by caved for AX-CLASSIC ##
## Revision NR: 1 ##
## EQWorld Server ##
######################################

sub EVENT_SAY {
my $evil = quest::saylink("evil", 1);
my $desecration = quest::saylink("desecration", 1);

if($text=~/Hail/i){
$client->Message(14,"Greetings $name! I am Megosh Thistlethorn first Ranger of the Storm Reapers of Rivervale. What can i do for you $class? Did you have a note for me?");
}
if($text=~/evil/i){
$client->Message(14,"Currently the Death Fist Clan of Orcs. a race of bloodthirsty humanoids concerned only with expanding their territory and slaughtering all who stand in their path. threatens our homeland. The Orcs have long had a minor presence in the Misty Thicket but lately they have been amassing in greater numbers. The Death Fist has been chopping down our trees and quarrying rock from the nearby mountains. We know only that they have been shipping the materials to the commonlands and stockpiling it for what purpose we do not know. As rangers of the Storm Reapers it is our duty to stop the $desecration of the thicket.");
}
if($text=~/desecration/i){
$client->Message(14,"First you must outfit yourself for battle with the Death Fists. Seek Bipdo Hargin here in Rivervale and give him this letter. He will instruct you further on getting yourself outfitted for the tasks ahead. Once you have been outfitted in a suit of Thorn Mail Armor return to me and I will instruct you for your next task.");
quest::summonitem("19627");
}
if($text=~/task/i){
$client->Message(14,"If you feel you are ready to face the Orcs of Clan Death Fist then journey to the Misty Thicket beyond the protection of the Wall of Cetelt. Hunt the Orcs that are cutting down the trees of the thicket and bring me two of the Orc Ribcages and two of the Orc Scalps.");
}
if($text=~/what/i){
$client->Message(14,"First you must outfit yourself for battle with the Death Fists. Seek Bipdo Hargin here in Rivervale and give him this letter. He will instruct you further on getting yourself outfitted for the tasks ahead. Once you have been outfitted in a suit of Thorn Mail Armor return to me and I will instruct you for your next $task.");
quest::summonitem("19627"); }
}

sub EVENT_ITEM {
my $evil = quest::saylink("evil", 1);
my $task = quest::saylink("task", 1);
if(plugin::check_handin(\%itemcount, 18432 => 1)){ #Note turnin
$client->Message(14,"Ah yes welcome $name, I got word that a young ranger would be coming my way. I journeyed many years ago to the Surefall Glade far to the west of our lovely shire. It was there I trained with the human and half-elven rangers that like the Storm Reapers are faithful disciples of Karana. I have returned now to Rivervale to teach our interested young people the ways of a ranger of the Storm Lord. so that we may defend our shire and the wilds of Norrath from the $evil forces that would see it destroyed.");
    quest::summonitem(13509); #Mud Stained Tunic
    quest::ding();
	quest::faction(316, 10); #Storm Reapers
	quest::faction(133, 10); #Guardians of the Vale
    quest::faction(208, 10); #Mayor Gubbin
    quest::faction(218, 10); #Merchants of Rivervale
    quest::faction(88, -30); #Dreadguard Outer
	quest::exp(1000);
}

elsif(plugin::check_handin(\%itemcount, 19627 => 1)){ #Followup weapon quest after getting the note back
$client->Message(14,"Ah you returned for your final $task $name. You done well in the equiping department but now we really need your help. We have been training you for this.");
}
elsif(plugin::check_handin(\%itemcount, 13791 => 2, 19551 => 2)){ #Weapon quest turning first step
$client->Message(14,"Great job $name, you are almost there. Seek out Bodbin Gimble and bring him this sword and a ruined thorn drakeling scale. Then he will finish this sword and sharpen it for you.");
quest::summonitem(19624);
}

else {
plugin::try_tome_handins(\%itemcount, $class, 'Ranger');
plugin::return_items(\%itemcount);
$client->Message(14,"I have no need for this item $name, you can have it back.");
}
}