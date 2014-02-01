######################################
## NPC: Lyris_Moonbane ##
## Zone: Qcat - Necro GM ##
## Revised by caved for AX-CLASSIC ##
## EQWorld Server ##
######################################

sub EVENT_SAY {
my $note = quest::saylink("note", 1);

if($text=~/Hail/i){
$client->Message(14,"Welcome $name, welcome to the new order of life. I am Lyris Moonbane and serve Bertoxxulous. Did you have a $note for me?");
}
if($text=~/note/i){
$client->Message(14,"Yes! The little note u got when u started, hand it over to me please!");
}
}

sub EVENT_ITEM {
if (plugin::check_handin(\%itemcount, 18721 =>1 )) {
$client->Message(14,"Good work $name, Thank you for the note, yes i had received word that a young Necromancer was coming to join our realms. I am here to see to it that you start your training as soon as possible. Please go and talk to Bruax Grengar....");
quest::ding();
quest::exp(500);
quest::faction(21,1);
quest::faction(135,-1);
quest::faction(235,-1);
quest::faction(257,-1);
quest::faction(53,1);
quest::givecash(0,3,3,0);
}
plugin::return_items(\%itemcount);
}
#END of FILE Zone:qcat Lyris_Moonbane 
