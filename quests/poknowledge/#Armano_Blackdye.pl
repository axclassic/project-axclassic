########################################
## NPC:  Armano Blackdye              ##
## Zone: Plane of Knowledge           ##
## Bots  Armourdye unlock skill Quest ##
## Created by Caved for AX-CLASSIC    ##
##       03-03-2013                   ##
########################################
sub EVENT_SAY {
my $talk = quest::saylink("talk", 1);
my $command = quest::saylink("command", 1);

if($text=~/Hail/i) {
$client->Message(14,"Hey hello $name, how are you? My name sounds familiar to you? But of course my brother is the famous painter Dino Blackdye. That is not what I wanted to $talk to you about though.");
}
if($text=~/talk/i) {
$client->Message(14,", I could give you the skill to dye your
mercenaries armour with a #bot $command . All you have to do is visit my brother Dino and let him fill this vial. The last time I have seen him he was located in the Southern plains of the Karranas close to the Lake Rathe zone. Hurry up now and go...");
quest::summonitem(10062); #Empty vial
}
if($text=~/command/i) {
$client->Message(14,"The command is #bot armorcolor [slot] [red] [green] [blue], if you forget you can always do #bot armorcolor help.");
}
}

sub EVENT_ITEM {
if (plugin::check_handin(\%itemcount, 119513 => 1)) {
$client->Message(14,"Wonderfull, I see you have spoken to my brother. How is he doing? Well as promissed here is your #bot armorcolor skill, enjoy...");
quest::ding();
quest::exp(1000);
quest::setglobal("armorcolor",1,5,"F");
$armorcolor = undef;
$client->Message(6,"You have learned the armorcolor skill!");
}
else {
$client->Message(14,"I don't need this $name. Take this back.");
plugin::return_items(\%itemcount);
return 1;
}
}