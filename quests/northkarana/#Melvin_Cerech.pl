#######################################
## NPC: Melvin Cerech                ##
## Zone: North Karana                ##
## Quest: The Rathe Prestige Quest   ##
## Created by Caved for AXClassic    ##
## EQWorld Server     27-08-2014     ##
#######################################
sub EVENT_SAY {

  if ($text=~/hail/i && $ulevel >= 65) {
    $client->Message(14,"Howdy $name I am Melvin. Howm can I help you?, ");
  }
  elsif  ($text=~/hail/i && $ulevel < 65) {
  $client->Message(14,"I dont think I should talk to you. Laterz!!");
  return 1;
   }
}


sub EVENT_ITEM {
if (plugin::check_handin(\%itemcount, 119946 => 1) && $ulevel == 65) {
    $client->Message(14,"Ah hello $class , I see you helped Mehir catch those vultures. Man let me tell you he is hunting those for years now. Glad to see he finally succeeded. You seem to have atleast SOME potential. Ok I put you to work and see what you are made off, but first I need you to run an aron for me. Take this dagger to Kevan McPherson He will sharpen it for you. Bring the sharpened dagger back to me along with a Superior Green Dragonscale, a Superior Red Dragonscale and a Superior White Dragonscale");
    quest::summonitem("119947");

 }
elsif (plugin::check_handin(\%itemcount, 119951 => 1, 119948 => 1, 119949 => 1, 119950 => 1) && $ulevel == 65) {
    $client->Message(14,"Very good! $sname , I reward you with my token of trust to enable you to advance in your quest. I want you to kill the master of time itself. Bring his head and the token I just gave you back to me, now go!! Dont return without these items! ");
    quest::summonitem("119952");
 }
elsif (plugin::check_handin(\%itemcount, 119952 => 1, 119953 => 1) && $ulevel == 65) {
    $client->Message(14,"Good! Good. I see you have what it takes to complete this quest my friend. I shall send you on your way now. Bring this coin to Helena Kimang. She is an observer. Last time I saw her she was observing in some honorable place in the Plains of Power.");
    quest::summonitem("119954");
 }
else {
    $client->Message(14,"I don't need this $name. Take it back.");
    plugin::return_items(\%itemcount);
    return 1;
 }
}