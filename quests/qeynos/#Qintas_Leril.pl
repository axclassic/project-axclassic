#######################################
## NPC: Qintas_Leril                 ##
## Zone: Qeynos                      ##
## Quest: The Rathe Prestige Quest   ##
## Created by Caved for AXClassic    ##
## EQWorld Server     30-08-2014     ##
#######################################
sub EVENT_SAY {

  if ($text=~/hail/i && $ulevel >= 65) {
    $client->Message(14,"Hello $name who are you?, ");
  }
  elsif  ($text=~/hail/i && $ulevel < 65) {
  $client->Message(14,"I dont think I should talk to you. Move along now!");
  return 1;
   }
}


sub EVENT_ITEM {
if (plugin::check_handin(\%itemcount, 119963 => 1, 119962 => 1) && $ulevel == 65) {
    $client->Message(14,"Hello $name, Desree told me that you are on the way to see me and there you are. Well met my friend. You are only moments away from getting your great quest reward. just wanted you to do 1 more thing for me. Return my Token of trust to me together with 3 Drachnid Leg tips. I need to make a half decent dagger so I can defend myself. Do this for me and I will send you to your final fight!";
    quest::summonitem("119964");

 }
elsif (plugin::check_handin(\%itemcount, 119964 => 1, 11937 => 3) && $ulevel == 65) {
    $client->Message(14,"Ok $sname . You are ready for the final fight. I give you a coin for Eldor Torbele He can be found in the icy regions of Velious. Be prepared to fight once you give it to him.");
    quest::summonitem("119965");


 }
else {
    $client->Message(14,"I don't need this $name. Take it back.");
    plugin::return_items(\%itemcount);
    return 1;
 }
}