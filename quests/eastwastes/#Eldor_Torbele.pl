#######################################
## NPC: Eldor_Torbele                ##
## Zone: East Waste                  ##
## Quest: The Rathe Prestige Quest   ##
## Created by Caved for AXClassic    ##
## EQWorld Server     30-08-2014     ##
#######################################
sub EVENT_SAY {

  if ($text=~/hail/i && $ulevel >= 65) {
    $client->Message(14,"Hello stranger, well met. I am Eldor. I have been send down here to observe. Rumor has it that there are special monsters roaming these lands. To be honest I dont trust those ice bunnies one bit.");
  }
  elsif  ($text=~/hail/i && $ulevel < 65) {
  $client->Message(14,"I dont think I should talk to you. Move along now!");
  return 1;
   }
}


sub EVENT_ITEM {
if (plugin::check_handin(\%itemcount,119965 >= 1) {
    $client->Message(14,"$name , you have to seek out A Very Mean Ice Bunny and kill him, he is in this zone. He posesses the Ring of Ice");
    quest::spawn("116909","0","0","-1345.99","-272.67","185.83");

 }
else {
    $client->Message(14,"I don't need this $name. Take it back.");
    plugin::return_items(\%itemcount);
    return 1;
 }
}