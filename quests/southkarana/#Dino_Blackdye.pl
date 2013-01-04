########################################
## NPC:  Dino Blackdye                ##
## Zone: South Karana                 ##
## Bots  Armourdye unlock skill Quest ##
## Created by Caved for AX-CLASSIC    ##
##       03-03-2013                   ##
########################################
sub EVENT_SAY {
my $yes = quest::saylink("yes", 1);
my $no = quest::saylink("no", 1);

if($text=~/Hail/i) {
$client->Message(14,"Hey hello $name, how are you? I am Dino Blackdye the uhm 'famous' painter. Did you come here to fill a vial for my brother or one of the Norrath Adventurers? $yes or $no ");
}
if($text=~/yes/i) {
$client->Message(14,"Give me the empty vial so I can fill it quick so you can get back to dilliver it to Armano or the Norrath Adventurer.");
}
if($text=~/no/i) {
$client->Message(14,"OK then $name, well met but now I have to return to my new painting. Think I am going to call it 'the Monalisa' what do you think?");
}
}

sub EVENT_ITEM {
if (plugin::check_handin(\%itemcount, 10062 => 1)) {
$client->Message(14,"Okay, I have filled the vial for you, now hurry back to Armano or the Norrath Adventurer you came from.");
quest::summonitem(119513); #return filled vial name: Dino's vial
quest::ding(); 
quest::exp(1000);
}
else {
$client->Message(14,"I don't need this $name. Take this back.");
plugin::return_items(\%itemcount);
return 1;
}
}