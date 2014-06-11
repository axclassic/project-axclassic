######################################
## NPC: Xon_Quexill ##
## Zone: NeriakC ##
## Necromancer Guildmaster ##
## Revised by caved for AX-CLASSIC ##
## EQWorld Server ##
######################################
#Last part of Sir Arium's Bridal quest.

sub EVENT_SAY {
if($text=~/Hail/i){
$client->Message(14,"Welcome to the Lodge of the Dead. May you serve our Queen with the bleeding of others. Seek out Frizin Q'Tentu. He might have some tasks for you and help you with your

training.");
}
if($text=~/befallen/i){
$client->Message(14,"It is true that the return of Marnek could create difficulties for us, especially if this has the blessing of Solusek Ro himself. Therefore, I command you to deliver

to me any further information you uncover regarding the plans of the Burning Dead, and likewise I order you to return here at my bidding for further instructions in this matter. Now,

begone.");
}
}

sub EVENT_ITEM {
if(plugin::check_handin(\%itemcount,18474 =>1)){
$client->Message(14,"Very interesting, servant of the Queen. This deed has stayed my wrath for this interruption of my business. Where did you find this?");
quest::faction(322,10);
quest::faction(268,10);
quest::faction(177,-30);
quest::faction(170,-30);
quest::faction(91,-30);
quest::faction(260,-30);
quest::ding();
quest::exp(6400);
quest::givecash(0,8,0,0);
}
if(plugin::check_handin(\%itemcount,31492 => 1)){
$client->Message(14,"Ha ha ha ha! Oh the poor steed of a noble paladin! Bah, it will find no rest yet. I who can command the spirits of the dead demand it serve you once again.");
quest::summonitem(31496);
quest::faction(322,10);
quest::faction(268,10);
quest::faction(177,-30);
quest::faction(170,-30);
quest::faction(91,-30);
quest::faction(260,-30);
quest::ding();
quest::exp(6400);
quest::givecash(7,3,1,0);

}
if(plugin::check_handin(\%itemcount,18758 => 1)){
$client->Message(14,"Welcome to the Lodge of the Dead. May you serve our Queen with the bleeding of others. Take this Robe and wear it with pride. Hey young $class seek out Frizin Q'Tentu. He might have some tasks for you and help you with your training.");
quest::summonitem(13587);
quest::faction(322,10);
quest::faction(268,10);
quest::faction(177,-30);
quest::faction(170,-30);
quest::faction(91,-30);
quest::faction(260,-30);
quest::ding();
quest::exp(1000);

}
}