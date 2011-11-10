######################################
## NPC: Bodbin Gimble ##
## Zone: Rivervale ##
## Newbie Arms Crafter ##
## Revised by caved for AX-CLASSIC ##
## Revision NR: 1 ##
## EQWorld Server ##
######################################

sub EVENT_SAY {
if($text=~/Hail/i){
$client->Message(14,"Hello $name, I am Bodbin Gimble, the best arms crafter and sharpener in all of Rivervale (atleast thats what they say hehe). Most of the work i do for the guild leaders around here. Anyway young $class, did you have work for me? You can just hand me the items and i see what i can do ...");
}
}

sub EVENT_ITEM {
if(plugin::check_handin(\%itemcount, 19624 => 1, 19612 => 1)) { #Ranger handin
quest::emote("fashions a grip out of the ruined thorn drakeling scales then tests and polishes the blade of the machete.");
$client->Message(14,"Yer another one of Megosh's trainees I suppose. This here's a fine weapon for a young Ranger of the Storm Reapers like yerself.");
quest::faction(218,10);
quest::faction(77,10);
quest::faction(133,10);
quest::faction(208,10);
quest::faction(369,-30);
quest::exp(10850);
quest::summonitem(19687);
}
elsif(plugin::check_handin(\%itemcount, 19626 => 1, 19616 => 1, 13408 => 1)){ #Druid handin
quest::emote("fashions a grip out of the large fruit bat wing then tests and polishes the blade of the scimitar.");
$client->Message(14,"Yer another one of Hibbs trainees I suppose. This here's a fine weapon for a young Druid of the Storm Reapers like yourself. I sharpened it and placed a new handle onit, you'l love thisone $name ...");
quest::faction(218,10);
quest::faction(77,10);
quest::faction(133,10);
quest::faction(208,10);
quest::faction(369,-30);
quest::exp(10850);
quest::summonitem(19686);
}

elsif(plugin::check_handin(\%itemcount, 19625 => 1, 19612 => 1)) { #Paladin handin
quest::emote("fashions a grip out of the ruined thorn drakeling scales then tests and polishes the blade of the sword.");
$client->Message(14,"Yer another one of Kaya's trainees I suppose. This here's a fine weapon for a young Paladin like yerself.");
quest::faction(218,10);
quest::faction(77,10);
quest::faction(133,10);
quest::faction(208,10);
quest::faction(369,-30);
quest::exp(10850);
quest::summonitem(19685);
}

else {
(plugin::return_items(\%itemcount));
$client->Message(14,"I don't need these, please take them back, This is NOT what i asked for...");
}
}
