######################################
## NPC: Jayna_D`Bious ##
## Zone: NeriakB ##
## Magician GM note turnin ##
## Revised by caved for AX-CLASSIC ##
## EQWorld Server ##
######################################
sub EVENT_SAY {
if ($text=~/Hail/i){
$client->Message(14,"Hail $name, I am Jayna D`Bious Magician GM, did you have a note for me?");
}
}
sub EVENT_ITEM {
if ($item1=="18754"){
$client->Message(14,"Thanks $name, yes I got note that someone was comming today, ready for their training. Please seek out Morgolanth Tal'Raeloen and proof yourself to us.");
quest::summonitem(13583);
quest::ding();
quest::faction(322, -30); #The Dead
quest::faction(331, 10); #The Spurned
quest::exp(1000);
}
else {
plugin::return_items(\%itemcount);
$client->Message(14,"I don't need these, Here $name take them back.");
}
}
#END of FILE Zone:neriakb ID:41054 -- Jayna_D`Bious 

