######################################
## NPC: Camia_V`Retta ##
## Zone: NeriakB ##
## Enchanter GM note turnin ##
## Revised by caved for AX-CLASSIC ##
## EQWorld Server ##
######################################
sub EVENT_SAY {
if ($text=~/Hail/i){
$client->Message(14,"Hail $name, I am CamiaV`Retta Enchanter GM, did you have a note for me?");
}
}
sub EVENT_ITEM {
if ($item1=="18753"){
$client->Message(14,"Thanks $name, yes I got note that someone was comming today, ready for their training. Please seek out Morgolanth Tal'Raeloen and proof yourself to us.");
quest::summonitem("13584");
quest::ding();
quest::exp("100");
}
else {
plugin::return_items(\%itemcount);
$client->Message(14,"I don't need these, Here $name take them back.");
}
}
#END of FILE Zone:neriakb ID:41052 -- Camia_V`Retta 